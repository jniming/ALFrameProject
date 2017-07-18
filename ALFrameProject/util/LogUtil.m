//
//  LogUtil.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "LogUtil.h"

@implementation LogUtil
+(void)log:(NSObject *)cls logString:(NSObject *)obj{
    
    NSLog(@"ALlog>>%@>>>>%@",NSStringFromClass([cls class]),obj);
    
}
@end
