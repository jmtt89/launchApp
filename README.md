# launchApp for iOS and Android

`Version 0.5.0`

A Plugin for Apache Cordova and Adobe PhoneGap by jmtt89
Based on work of [ohh2ahh](http://ohh2ahh.com), [AppAvailability](https://github.com/ohh2ahh/AppAvailability).

1. [Description](https://github.com/jmtt89/launchApp#1-description)
2. [Installation](https://github.com/jmtt89/launchApp#2-installation)
3. [Usage](https://github.com/jmtt89/launchApp#3-usage)
4. [Some URI Schemes](https://github.com/jmtt89/launchApp#4-some-uri-schemes)
5. [Angular/Ionic](https://github.com/jmtt89/launchApp#5-angular--ionic)
6. [License](https://github.com/jmtt89/launchApp#6-license)

## 1. Description

This plugin allows you to check if an app is installed on the user's device and if installed executed, otherwise open in webBrowser.
It requires an URI Scheme, for now only work on IOS (next releases add android support)

* Ready for the Command-line Interface of Cordova / PhoneGap 3.0 and later

### Supported Platforms

* iOS

## 2. Installation

The Cordova CLI is the recommended way to install AppAvailability, see [The Command-line Interface](http://cordova.apache.org/docs/en/4.0.0/guide_cli_index.md.html#The%20Command-Line%20Interface).

### Automatically (Command-line Interface)

Simply run this command to add the latest version of AppAvailability to your project:
```
$ cordova plugin add https://github.com/jmtt89/launchApp.git
```

Don't forget to prepare and compile your project:
```
$ cordova build
```

## 3. Usage

### iOS

```javascript
launchApp.launch(
    function() {  // Success callback
        ...
    },
    function() {  // Error callback
        ...
    },
    'twitter://', // URI Scheme
    'q=%23launchAppCordova',//Params to send a App
    'www.twitter.com' //URL for Fallback in case not installed
);
```

if only whant check
```javascript
launchApp.check(
    function() {  // Success callback (Installed)
        ...
    },
    function() {  // Error callback (Not installed)
        ...
    },
    'twitter://' // URI Scheme
);
```


## 4. Some URI Schemes
check [this link](http://wiki.akosma.com/IPhone_URL_Schemes)

## 5. Angular/Ionic

If you using Angular or Ionic, you need add this service in app.js  

```javascript
    //MAIN MODULE
    angular.module('myModule', ['ionic','starter.controllers',...])
    ...
    //Service to add
        .factory('$cordovaLaunchApp', ['$q', function ($q) {
          return {
            launch: function (scheme,params,url) {
              var q = $q.defer();

              launchApp.launch(function (result) {
                q.resolve(result);
              }, function (err) {
                q.reject(err);
              },scheme,params,url);

              return q.promise;
            }
          }
        }])
    //end Service to add
    ...
    ;
```


## 6. License

[The MIT License (MIT)](http://www.opensource.org/licenses/mit-license.html)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
