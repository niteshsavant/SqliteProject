//
//  SearchViewController.m
//  SqliteDemo
//
//  Created by Student P_04 on 28/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *strquery = [NSString stringWithFormat:@"select * from userdetail"];
    arrSearch = [DBManager getRecordsfromuserdetail:strquery];
    [_tableSearch reloadData];
         // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSearchkeyFromtable:(id)sender
{
  //  NSString *strquery = [NSString stringWithFormat:@"select * from userdetail where name like '%%%@%%'",_txtSearchkey.text];
    
   // NSString *strquery = [NSString stringWithFormat:@"select * from userdetail"];
    //arrSearch = [DBManager getRecordsfromuserdetail:strquery];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSearch.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DisplayCell"];
    
    if (cell == nil)
    {
        cell = [[SearchingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DisplayCell"];
    }
    
    NSDictionary *dicttemp = [arrSearch objectAtIndex:indexPath.row];
    
    cell.lblNames.text = [dicttemp valueForKey:@"name"];
    NSLog(@"%@,%@,%@",[dicttemp valueForKey:@"name"],[dicttemp valueForKey:@"address"],[dicttemp valueForKey:@"city"]);
    cell.lblAddressess.text = [dicttemp valueForKey:@"address"];
    cell.lblCities.text = [dicttemp valueForKey:@"city"];
    return cell;
}

@end
