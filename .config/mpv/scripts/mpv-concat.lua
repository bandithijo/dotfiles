-- mpvconcat
-- interactively create concat input for ffmpeg
-- forked from https://github.com/pvpscript/mpv-video-splice

local mp  = require 'mp'
local msg = require 'mp.msg'

local preview_count = 0
local timer = nil
local file_name = "concat.txt"
local concat_file = string.format("%s/%s", mp.get_property("working-directory"), file_name)
local times = {}
local start_time = nil
local remove_val = ""
local exit_time = 0

function notify(duration, ...)
	local args = {...}
	local text = ""

	for i, v in ipairs(args) do
		text = text .. tostring(v)
	end

	msg.info(text)
	mp.command(string.format("show-text \"%s\" %d 1",
		text, duration))
end

local function time_to_str(time)
	local hours = math.floor(time / 3600)
	local mins = math.floor((time - hours * 3600) / 60)
	local secs = time - hours * 3600 - mins * 60

	local fmt_time = string.format('%02d:%02d:%05.2f', hours, mins, secs)

	return fmt_time
end

local function add_time(obj)
	table.insert(times, obj)
end

local function del_time(num)
	table.remove(times, num)
end

function put_time()
	local time = mp.get_property_number('time-pos')
	local message = ""

	if not start_time then
		start_time = time
		message = "[START TIMESTAMP]"
	else
		add_time({
			t_file = mp.get_property("path"),
			t_start = start_time,
			t_starts = time_to_str(start_time),
			t_end = time,
			t_ends = time_to_str(time)
		})
		start_time = nil

		message = "[END TIMESTAMP]"
	end

	notify(2000, message, ": ", time_to_str(time))
end

function show_times()
	notify(2000, "Total cuts: ", #times)

	for i, obj in ipairs(times) do
		msg.info("Segment", "#" .. i, obj.t_file .. ":", obj.t_starts, "-", obj.t_ends)
	end
	if start_time then
		notify(2000, "Segment ", #times+1, " in progress.")
	end
end

function reset_segment()
	if start_time then
		notify(2000, "Segment ", #times+1, " reseted.")

		start_time = nil
	end
end

function delete_segment()
	if remove_val == "" then
		notify(2000, "Entered segment deletion mode.")

		-- Add shortcut keys to the interval {0..9}.
		for i=0,9,1 do
			mp.add_key_binding("ctrl+" .. i, "num_key_" .. i,
				function()
					remove_val = remove_val .. i
					notify(1000, "Segment to remove: "
						.. remove_val)
				end
			)
		end
	else
		-- Remove previously added shortcut keys.
		for i=0,9,1 do
			mp.remove_key_binding("num_key_" .. i)
		end

		remove_num = tonumber(remove_val)
		if #times >= remove_num and remove_num > 0 then
			del_time(remove_num)
			notify(2000, "Removed segment ", remove_num)
		end

		remove_val = ""

		msg.info("Exited segment deletion mode.")
	end
end

function prevent_quit(name)
	if start_time then
		if os.time() - exit_time <= 2 then
			mp.command(name)
		else
			exit_time = os.time()
		end
		notify(3000, "Segment has been marked. Press again to quit")
	else
		mp.command(name)
	end
end

function get_concat_arg(line)
	local arg = string.sub(string.match(line, " .*$"), 2)
	if arg:match("^[\"'].*[\"']$") then
		arg = arg:sub(2, -2)
	end
	return arg
end

function read_concat()
	local concat_file_ptr = io.open(concat_file, "r")

	if concat_file_ptr then
		obj = {t_file = nil, t_start = nil, t_end = nil}
		for line in concat_file_ptr:lines() do
			if string.match(line, "^file ") then
				obj.t_file = get_concat_arg(line)
			elseif string.match(line, "^inpoint ") then
				obj.t_start = tonumber(get_concat_arg(line))
				obj.t_starts = time_to_str(obj.t_start)
			elseif string.match(line, "^outpoint ") then
				obj.t_end = tonumber(get_concat_arg(line))
				obj.t_ends = time_to_str(obj.t_end)
			end
			if obj.t_file and obj.t_start and obj.t_end then
				add_time(obj)
				obj = {t_file = nil, t_start = nil, t_end = nil}
			end
		end
		concat_file_ptr:close()
	end
end

function write_concat()
	local concat_file_ptr = io.open(concat_file, "w")

	for i, obj in ipairs(times) do
		if i > 1 then
			concat_file_ptr:write("\n")
		end
		concat_file_ptr:write(string.format("# Segment #%d: %s - %s\n", i, obj.t_starts, obj.t_ends))
		concat_file_ptr:write(string.format("file '%s'\n", obj.t_file))
		concat_file_ptr:write(string.format("inpoint %s\n", obj.t_start))
		concat_file_ptr:write(string.format("outpoint %s\n", obj.t_end))
	end

	concat_file_ptr:close()

	notify(10000, "concat file saved as: ", concat_file)
end

function preview_kill()
	mp.set_property_native("pause", true)
	mp.unobserve_property(preview_handler)
	preview_count = 0
	notify(10000, "Exited preview mode")
end

function preview_handler()
	if mp.get_property_number("time-pos") >= times[preview_count].t_end then
		if preview_count < #times then
			preview_count = preview_count + 1
		else
			preview_kill()
			return
		end
		mp.commandv("seek", times[preview_count].t_start, "absolute", "exact")
	end
end

function preview_concat()
	if preview_count == 0 then
		notify(10000, "Entered preview mode")
		preview_count = 1
		mp.commandv("seek", times[preview_count].t_start, "absolute", "exact")
		mp.set_property_native("pause", false)
		mp.observe_property("time-pos", number, preview_handler)
	else
		preview_kill()
	end
end

mp.set_property("keep-open", "yes")     -- Prevent mpv from exiting when the video ends
mp.set_property("quiet", "yes")         -- Silence terminal.

mp.add_key_binding('q',       "quit",             function() prevent_quit("quit") end)
mp.add_key_binding('Shift+q', "quit-watch-later", function() prevent_quit("quit-watch-later") end)
mp.add_key_binding('ctrl+t',  "put_time",         put_time)
mp.add_key_binding('ctrl+s',  "show_times",       show_times)
mp.add_key_binding('ctrl+r',  "reset_segment",    reset_segment)
mp.add_key_binding('ctrl+d',  "delete_segment",   delete_segment)
mp.add_key_binding('ctrl+p',  "preview_concat",   preview_concat)
mp.add_key_binding('ctrl+w',  "write_concat",     write_concat)

read_concat()
