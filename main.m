#import <UIKit/UIKit.h>

int main(int argc, char **argv) {
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	int ret = UIApplicationMain(argc, argv, @"WifiNetworkListApplication", @"WifiNetworkListApplication");
	[p drain];
	return ret;
}

// vim:ft=objc
