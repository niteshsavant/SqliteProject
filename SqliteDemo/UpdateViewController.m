//
//  UpdateViewController.m
//  SqliteDemo
//
//  Created by Student P_04 on 03/02/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __txtname.text = [_dictpass valueForKey:@"name"];
    _txtaddress.text = [_dictpass valueForKey:@"address"];
    _txtcity.text = [_dictpass valueForKey:@"city"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnUpdaterecord:(id)sender
{
    int userid = [[_dictpass valueForKey:@"id"]intValue];
    
    [DBManager updateRecordsfromtable:userid name:__txtname.text address:_txtaddress.text city:_txtcity.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
