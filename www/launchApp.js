var launchApp = {
    
    launch: function(successCallback,errorCallback,urlScheme,params,fallBackUrl) {
        var options = {
            urlScheme : urlScheme,
            params : params,
            url : fallBackUrl
        };
        cordova.exec(
            successCallback,
            errorCallback,
            "launchApp",
            "launchApp",
            [options]
        );
    },
    
    check: function(successCallback, errorCallback, urlScheme) {
        var options = {
            urlScheme : urlScheme
        };
        cordova.exec(
            function(success) { callback(success); },
            function(error) { callback(error); },
            "launchApp",
            "checkApp",
            [options]
        );
    }
    
};

module.exports = launchApp;