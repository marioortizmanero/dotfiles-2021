-- Enables every filetype, with some specific configurations, and the names
-- disabled to avoid unintentional highlighting.
require('colorizer').setup ({
    '*',
    rasi = {
        RRGGBBAA = true,
    },
}, {
    names = false,
})
