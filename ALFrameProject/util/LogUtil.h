//
//  LogUtil.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogUtil : NSObject
/**
 对象打印语句,ALlog 标识,类名前缀
 
 @param cls 类对象
 @param obj 打印的对象
 */
+(void)log:(NSObject *)cls logString:(NSObject*)obj ;

@end
