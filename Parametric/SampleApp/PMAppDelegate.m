//
//  PMAppDelegate.m
//  Parametric
//

#import "PMAppDelegate.h"

#import "PMSampleAppViewController.h"

@implementation PMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[PMSampleAppViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
