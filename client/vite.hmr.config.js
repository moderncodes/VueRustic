const fs = require('fs');
const viteConfig = require('./vite.config');

module.exports = {
    ...viteConfig,
    server: {
        ...(viteConfig.server || {}),
        watch: {
            ...((viteConfig.server && viteConfig.server.watch) || {}),
            usePolling: true,
            interval: 1000,
        },
    },
};