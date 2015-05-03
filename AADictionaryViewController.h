//
//  AADictionaryViewController.h
//  AADictionaryViewController
//
//  Created by Aaron Ash on 5/3/15.
//
//

#import <UIKit/UIKit.h>

@interface AADictionaryViewController : UITableViewController

@property(nonatomic, strong) NSDictionary *dictionary;

- (id)initWithDictionary:(NSDictionary*)dict;

@end
