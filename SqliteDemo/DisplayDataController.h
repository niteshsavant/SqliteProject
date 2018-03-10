//
//  DisplayDataController.h
//  SqliteDemo
//
//  Created by Student P_04 on 28/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayCell.h"
#import "DBManager.h"
#import "UpdateViewController.h"

@interface DisplayDataController : UIViewController
@property(nonatomic,strong) NSArray *arrDataDisplay;

@property (weak, nonatomic) IBOutlet UITableView *tableofUsers;

@end
