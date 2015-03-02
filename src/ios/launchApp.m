#import "launchApp.h"
#import <Cordova/CDV.h>

@implementation launchApp

- (void)launchApp:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;

    NSArray *args = [command.arguments objectAtIndex:0];
    NSString *scheme  = args[0];
    NSString *url = args[1];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) {
    	NSString *tmp = [NSString stringWithFormat:@"%@%@",scheme,url];
		NSURL *myURL = [NSURL URLWithString:tmp];
		[[UIApplication sharedApplication] openURL:myURL];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
    }
    else {
    	NSString *tmp = [NSString stringWithFormat:@"%@%@",@"http://",url];
		NSURL *myURL = [NSURL URLWithString:tmp];
		[[UIApplication sharedApplication] openURL:myURL];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

@end