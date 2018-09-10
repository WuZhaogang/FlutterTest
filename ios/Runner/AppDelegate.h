#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : FlutterAppDelegate <FlutterStreamHandler>
@property(nonatomic, copy) FlutterEventSink eventSink;
@end


