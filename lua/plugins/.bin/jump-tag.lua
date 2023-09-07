return {
    "harrisoncramer/jump-tag",
    event = "VeryLazy",
    keys = {
        { "<S-Up>",   mode = { "n" }, function() require("jump-tag").jumpParent() end, desc = "Jump Parent Tag" },
        { "<S-Down>", mode = { "n" }, function() require("jump-tag").jumpChild() end,  desc = "Jump Child Tag" },
        {
            "<S-Right>",
            mode = { "n" },
            function() require("jump-tag").jumpNextSibling() end,
            desc =
            "Jump Next Sibling Tag"
        },
        {
            "<S-Left>",
            mode = { "n" },
            function() require("jump-tag").jumpPrevSibling() end,
            desc =
            "Jump Previous Sibling Tag"
        },
    },
}
