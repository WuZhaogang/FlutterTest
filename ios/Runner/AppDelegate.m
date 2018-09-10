#import <UIKit/UIKit.h>
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "CustomeVc.h"

#define METHOD_CHANNEL @"samples.flutter.io/battery";
#define EVENT_CHANNEL "samples.flutter.io/charging";

@implementation AppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];

    /**
     * FlutterViewController
     */
    FlutterViewController *controller = (FlutterViewController *) self.window.rootViewController;

    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/battery" binaryMessenger:controller];
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {

        if ([@"asdasd" isEqualToString:call.method]) {

            NSLog(@"Dasdasdasdasdasdas");
            CustomeVc *customeVc = [[CustomeVc alloc] init];
            NSLog(@"------------%@",controller.navigationController);
            [controller.navigationController pushViewController:customeVc animated:YES];
        } else {
//            result(FlutterMethodNotImplemented);
        }
    }];

    /**
     * FlutterEventChannel & Handler
     */
    FlutterEventChannel *chargingChannel = [FlutterEventChannel eventChannelWithName:@"samples.flutter.io/charging" binaryMessenger:
            controller];
    [chargingChannel setStreamHandler:self];


    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    self.eventSink = eventSink;

    // 监听电池状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onBatteryStateDidChange:)
                                                 name:UIDeviceBatteryStateDidChangeNotification
                                               object:nil];
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.eventSink = nil;
    return nil;
}

- (void)onBatteryStateDidChange:(NSNotification *)notification {
    if (self.eventSink == nil) return;
    UIDeviceBatteryState state = [[UIDevice currentDevice] batteryState];
    switch (state) {
        case UIDeviceBatteryStateFull:
        case UIDeviceBatteryStateCharging:
            self.eventSink(@"charging");
            break;
        case UIDeviceBatteryStateUnplugged:
            self.eventSink(@"discharging");
            break;
        default:
            self.eventSink([FlutterError errorWithCode:@"UNAVAILABLE"
                                               message:@"Charging status unavailable"
                                               details:nil]);
            break;
    }
}

@end


