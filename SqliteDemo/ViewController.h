//
//  ViewController.h
//  SqliteDemo
//
//  Created by Student P_04 on 27/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayDataController.h"
#import "SearchViewController.h"
#import "DisplayCell.h"

@interface ViewController : UIViewController
- (IBAction)btnActionList:(id)sender;
- (IBAction)btnActionSave:(id)sender;
- (IBAction)btnActionSearch:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;

@end

