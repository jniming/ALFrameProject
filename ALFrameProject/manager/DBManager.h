//
//  DBManager.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
/**
 数据库管理器
 */
@interface DBManager : NSObject
@property FMDatabase *db;
+(DBManager *)sharedInstance;
@end
