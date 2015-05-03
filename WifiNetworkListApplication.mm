#import "RootViewController.h"

@interface WifiNetworkListApplication: UIApplication <UIApplicationDelegate> {
	RootViewController *_viewController;
}
@property (strong, nonatomic) UIWindow *window;
@end

@implementation WifiNetworkListApplication
@synthesize window = _window;
- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIViewController *vc = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (void)dealloc {
	[_viewController release];
	[_window release];
	[super dealloc];
}
@end

// vim:ft=objc
