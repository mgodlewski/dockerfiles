const WOLProxy = require('wake-on-lan-proxy');
 
(new WOLProxy())
    .source(process.env.SOURCE_PORT)
    .target({
        port: process.env.TARGET_PORT,
        host: process.env.TARGET_HOST,
        MAC: process.env.TARGET_MAC 
    })
    .wakeUpTimeout(process.env.WAKEUP_TIMEOUT || 60000)
    .run();
