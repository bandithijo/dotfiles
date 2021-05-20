local mp = require "mp"

local function set_clipboard(text)
    os.execute("echo -n "..text.." | xclip -sel clip")
end

local function copy_path()
    local path_url = mp.get_property("path")
    mp.osd_message(string.format("Copied to Clipboard: %s", path_url))
    set_clipboard(path_url)
end

mp.add_key_binding("y-p", "copy_path", copy_path)
