//
//  DisplayDataController.m
//  SqliteDemo
//
//  Created by Student P_04 on 28/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import "DisplayDataController.h"

@interface DisplayDataController ()

@end

@implementation DisplayDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
      _arrDataDisplay =  [DBManager getRecordsfromuserdetail:@"select * from userdetail"];
    [_tableofUsers reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrDataDisplay.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DisplayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DisplayCell"];
    
    if (cell == nil)
    {
        cell = [[DisplayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DisplayCell"];
    }
    
    NSDictionary *dicttemp = [_arrDataDisplay objectAtIndex:indexPath.row];
    
    cell.lblName.text = [dicttemp valueForKey:@"name"];
    cell.lblAddress.text = [dicttemp valueForKey:@"address"];
    cell.lblCity.text = [dicttemp valueForKey:@"city"];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [_arrDataDisplay objectAtIndex:indexPath.row];
    int userid = [[dict valueForKey:@"id"]intValue];
    if ([DBManager deleteRecordsfromtable:userid])
    {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        array = [_arrDataDisplay mutableCopy];
        
        [array removeObjectAtIndex:indexPath.row];
        _arrDataDisplay = [array copy];
        [_tableofUsers reloadData];
    }
    
}

//Optional method for

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return YES;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UpdateViewController *up = [self.storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
    
    up.dictpass = [_arrDataDisplay objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:up animated:YES];
}

@end
