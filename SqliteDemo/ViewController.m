//
//  ViewController.m
//  SqliteDemo
//
//  Created by Student P_04 on 27/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnActionList:(id)sender
{
    DisplayDataController *disp = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayDataController"];
    
    
    [self.navigationController pushViewController:disp animated:YES];
}

- (IBAction)btnActionSave:(id)sender
{
    if ([_txtName.text isEqualToString:@""])
    {
        
    }
    else if ([_txtAddress.text isEqualToString:@""])
    {
        
    }
    
    else if ([_txtCity.text isEqualToString:@""])
    {
        
    }
    else
    {
        [DBManager saveData:_txtName.text alongAdrress:_txtAddress.text alsocity:_txtCity.text];
    }

    _txtCity.text = @"";
    _txtName.text = @"";
    _txtAddress.text = @"";
}

- (IBAction)btnActionSearch:(id)sender
{
    SearchViewController *search = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    
    
    [self.navigationController pushViewController:search animated:YES];
    
}
@end
