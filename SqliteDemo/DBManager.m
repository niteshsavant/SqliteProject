
//
//  DBManager.m
//  SqliteDemo
//
//  Created by Student P_04 on 27/01/18.
//  Copyright © 2018 deepK. All rights reserved.
//

#import "DBManager.h"

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement= nil;
@implementation DBManager

+(DBManager *)getInstance
{
    if (sharedInstance == nil) {
        sharedInstance = [[DBManager alloc]init];
    }
    [self createDB];
    return sharedInstance;
}

+(NSString *)dbPath
{
    NSArray *arr=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *strDirectoryPath=arr[0];
    
    NSString *strDBPath=[strDirectoryPath stringByAppendingPathComponent:@"person.sqlite"];
    
    return strDBPath;
}

+(BOOL)createDB{
    NSString *strPath = [self dbPath];
    NSLog(@"%@",strPath);
    NSFileManager *filemanager=[NSFileManager defaultManager];
    if([filemanager fileExistsAtPath:strPath]==NO)
    {
        const char *databasePath=[strPath UTF8String];
    if(sqlite3_open(databasePath, &database)==SQLITE_OK)
    {
        NSString *sql=@"create table if not exists userdetail(id integer primary key autoincrement,name text,address text,city text)";
        const char *query=[sql UTF8String];
        char *error;
        if(sqlite3_exec(database, query, NULL, NULL, &error)==SQLITE_OK)
        {
            sqlite3_close(database);
            
            return YES;
        }
    }
    
    }
    return NO;
}


+(NSArray *)getRecordsfromuserdetail:(NSString *)strQueryPass
{
    NSMutableArray *arrUserdetail = [[NSMutableArray alloc]init];
    const char *dbPaths = [[self dbPath]UTF8String];
    
    if (sqlite3_open(dbPaths, &database) == SQLITE_OK)
    {
        const char *query = [strQueryPass UTF8String];
        
        if (sqlite3_prepare_v2(database, query, -1, &statement, NULL) == SQLITE_OK )
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                
                int myno = sqlite3_column_int(statement, 0) ;
                
                [dict setObject:[NSNumber numberWithInt:myno] forKey:@"id"];
                
                NSString *strName = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 1)];
                [dict setObject:strName forKey:@"name"];
                
                NSString *strAddress = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 2)];
                [dict setObject:strAddress forKey:@"address"];
                
                NSString *strCity = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 3)];
                [dict setObject:strCity forKey:@"city"];
                
                [arrUserdetail addObject:dict];
            }
        }
    }
    sqlite3_close(database);
    return arrUserdetail;
}

+(BOOL )saveData:(NSString *)name alongAdrress:(NSString *)address alsocity:(NSString *)city
{
    const char *dbPaths = [[self dbPath]UTF8String];
    if (sqlite3_open(dbPaths, &database) == SQLITE_OK)
    {
        NSString *strQuery = [NSString stringWithFormat:@"insert into userdetail(name,address,city) values(\"%@\",\"%@\",\"%@\")",name,address,city];
        
        const char *query = [strQuery UTF8String];
        
        if (sqlite3_prepare_v2(database, query, -1, &statement, NULL) == SQLITE_OK )
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                sqlite3_close(database);
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)deleteRecordsfromtable:(int)userid
{
    const char *dbPaths = [[self dbPath]UTF8String];
    if (sqlite3_open(dbPaths, &database) == SQLITE_OK)
    {
        NSString *strQuery = [NSString stringWithFormat:@"delete from userdetail where id == %d",userid];
        
        const char *query = [strQuery UTF8String];
        
        if (sqlite3_prepare_v2(database, query, -1, &statement, NULL) == SQLITE_OK )
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                sqlite3_close(database);
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)updateRecordsfromtable:(int)userid  name:(NSString *)name address:(NSString *)address city:(NSString *)city
{
    const char *dbPaths = [[self dbPath]UTF8String];
    if (sqlite3_open(dbPaths, &database) == SQLITE_OK)
    {
        NSString *strQuery = [NSString stringWithFormat:@"update userdetail set name = '%@' , address = '%@' , city = '%@' where id == %d",name, address, city,userid];
        
        const char *query = [strQuery UTF8String];
        
        if (sqlite3_prepare_v2(database, query, -1, &statement, NULL) == SQLITE_OK )
        {
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                sqlite3_close(database);
                return YES;
            }
        }
    }
    return NO;
}

//UPDATE userdetail
//set name = 'Satish Rawat'
//where id = 3
@end
