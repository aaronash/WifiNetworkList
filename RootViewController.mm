#import "RootViewController.h"
#include "MobileWiFi/MobileWiFi.h"
#import "MobileWiFi/WiFiNetwork.h"
#import "AADictionaryViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Known Networks";
    self.clearsSelectionOnViewWillAppear = NO;
    [self loadNetworks];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:animated];
}

-(void)loadNetworks {
    
    WiFiManagerRef manager = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    CFArrayRef allNetworks = WiFiManagerClientCopyNetworks(manager);
    
    //NSLog(@"networks: %@", allNetworks);
    //NSArray *narray = (__bridge NSArray*)allNetworks;
    
    self.networks = (__bridge NSArray*)allNetworks;

    CFRelease(manager);
    CFRelease(allNetworks);
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.networks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    NSObject *network = [self.networks objectAtIndex:indexPath.row];
    CFPropertyListRef property = WiFiNetworkGetProperty((WiFiNetworkRef)network, CFSTR("SSID_STR"));
    cell.textLabel.text = (NSString*)property;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSObject *network = [self.networks objectAtIndex:indexPath.row];
    CFDictionaryRef dict = WiFiNetworkCopyRecord((WiFiNetworkRef)network);
    //NSLog(@"property: %@", dict);
    UIViewController *vc = [[AADictionaryViewController alloc] initWithDictionary:(NSDictionary*)dict];
    [self.navigationController pushViewController:vc animated:true];
}


@end
