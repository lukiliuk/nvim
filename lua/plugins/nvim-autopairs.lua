return {
        'windwp/nvim-autopairs', -- plugin 1
        event = { 'InsertEnter' },
        config = function()
            local npairs_status_ok, npairs = pcall(require, 'nvim-autopairs')

            npairs.setup({})

        end
    }