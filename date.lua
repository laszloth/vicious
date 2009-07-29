----------------------------------------------------------
-- Licensed under the GNU General Public License version 2
--  * Copyright (C) 2009 Adrian C. <anrxc_sysphere_org>
----------------------------------------------------------

-- {{{ Grab environment
local os = { date = os.date }
-- }}}


-- Date: provides access to os.date with optional custom formatting
module("vicious.date")


-- {{{ Date widget type
function worker(format)
    -- Get format
    if format == nil then
        return os.date()
    else
        return os.date(format)
    end
end
-- }}}
