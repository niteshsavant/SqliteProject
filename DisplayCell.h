//
//  DisplayCell.h
//  SqliteDemo
//
//  Created by Student P_04 on 28/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;

@end
