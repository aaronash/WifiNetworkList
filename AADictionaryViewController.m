//
//  AADictionaryViewController.m
//  AADictionaryViewController
//
//  Created by Aaron Ash on 5/3/15.
//
//

#import "AADictionaryViewController.h"

@interface AADictionaryViewController ()

@end

@implementation AADictionaryViewController


- (id)initWithDictionary:(NSDictionary*)dict {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.dictionary = dict;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.dictionary.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.dictionary.allKeys objectAtIndex:indexPath.row];
    
    NSString *formatted = [NSString stringWithFormat:@"%@", [self.dictionary valueForKey:[self.dictionary.allKeys objectAtIndex:indexPath.row]]];
    
    NSString *detail = [[formatted componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@" "];
    
    cell.detailTextLabel.text = detail;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject *object = [self.dictionary valueForKey:[self.dictionary.allKeys objectAtIndex:indexPath.row]];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        AADictionaryViewController *vc = [[AADictionaryViewController alloc] initWithDictionary:(NSDictionary*)object];
        [self.navigationController pushViewController:vc animated:true];
    }
    
}


@end
