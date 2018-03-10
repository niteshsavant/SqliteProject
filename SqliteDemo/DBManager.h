//
//  DBManager.h
//  SqliteDemo
//
//  Created by Student P_04 on 27/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBManager : NSObject
+(DBManager *)getInstance;
+(BOOL )saveData:(NSString *)name alongAdrress:(NSString *)address alsocity:(NSString *)city;

+(NSArray *)getRecordsfromuserdetail:(NSString *)strQueryPass;
+ (BOOL)deleteRecordsfromtable:(int)userid;
+ (BOOL)updateRecordsfromtable:(int)userid  name:(NSString *)name address:(NSString *)address city:(NSString *)city;
@end
