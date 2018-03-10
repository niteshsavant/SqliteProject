//
//  SearchViewController.h
//  SqliteDemo
//
//  Created by Student P_04 on 28/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "SearchingCell.h"

@interface SearchViewController : UIViewController
{
    NSArray *arrSearch;
}
@property (weak, nonatomic) IBOutlet UITableView *tableSearch;
@property (weak, nonatomic) IBOutlet UITextField *txtSearchkey;
- (IBAction)btnSearchkeyFromtable:(id)sender;

@end
