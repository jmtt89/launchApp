#import <Cordova/CDV.h>

@interface launchApp : CDVPlugin

- (void)launchApp:(CDVInvokedUrlCommand*)command;

- (void)checkApp:(CDVInvokedUrlCommand*)command;

@end