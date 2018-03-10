//
//  UpdateViewController.h
//  SqliteDemo
//
//  Created by Student P_04 on 03/02/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface UpdateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *_txtname;
@property (weak, nonatomic) IBOutlet UITextField *txtaddress;
@property (weak, nonatomic) IBOutlet UITextField *txtcity;
@property(nonatomic,strong) NSDictionary *dictpass;

- (IBAction)btnUpdaterecord:(id)sender;


@end
