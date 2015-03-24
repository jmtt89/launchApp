#import "launchApp.h"
#import <Cordova/CDV.h>

@implementation launchApp

- (void)launchApp:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;

    NSMutableDictionary* options = (NSMutableDictionary*)[command argumentAtIndex:0];
    NSString *scheme  = [options objectForKey:@"urlScheme"];
    NSString *params  = [options objectForKey:@"params"];
    NSString *url     = [options objectForKey:@"url"];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) 
    {
        NSString *tmp = [NSString stringWithFormat:@"%@%@",scheme,params];
        NSURL *myURL = [NSURL URLWithString:tmp];
        [[UIApplication sharedApplication] openURL:myURL];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    else 
    {
        NSString *tmp = [NSString stringWithFormat:@"%@%@",@"http://",url];
        NSURL *myURL = [NSURL URLWithString:tmp];
        [[UIApplication sharedApplication] openURL:myURL];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [[UIApplication sharedApplication] performSelector:@selector(suspend)];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)checkApp:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;

    NSMutableDictionary* options = (NSMutableDictionary*)[command argumentAtIndex:0];
    NSString *scheme  = [options objectForKey:@"urlScheme"];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) 
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    else 
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end