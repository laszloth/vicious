----------------------------------------------------------
-- Licensed under the GNU General Public License version 2
--  * Copyright (C) 2009 Adrian C. <anrxc_sysphere_org>
----------------------------------------------------------

-- {{{ Grab environment
local io = { open = io.open }
local string = { gfind = string.gfind }
local helpers = require("vicious.helpers")
-- }}}


-- Mbox: provides the subject of last e-mail in a mbox file
module("vicious.mbox")


-- {{{ Mailbox widget type
function worker(format, mbox)
    local f = io.open(mbox)
    -- mbox could be huge, get a 15kb chunk from EOF
    --  * attachments could be much bigger than this
    f:seek("end", -15360)

    -- Get data
    local text = f:read("*all")
    f:close()

    -- Find subject lines
    for match in string.gfind(text, "Subject: ([^\n]*)") do
        subject = match
    end

    if subject then
        -- Spam sanitize only the last subject
        subject = helpers.escape(subject)

        -- Don't abuse the wibox, truncate
        if subject:len() > 22 then
            subject = subject:sub(1, 19) .. "..."
        end

        return {subject}
    end
end
-- }}}
