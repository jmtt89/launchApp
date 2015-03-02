var launchApp = {
    
    launch: function(successCallback, errorCallback, urlScheme, url) {
        cordova.exec(
            successCallback,
            errorCallback,
            "launchApp",
            "launchApp",
            [urlScheme,url]
        );
    },
    
    check: function(successCallback, errorCallback, urlScheme) {
        cordova.exec(
            function(success) { callback(success); },
            function(error) { callback(error); },
            "launchApp",
            "checkApp",
            [urlScheme]
        );
    }
    
};

module.exports = launchApp;