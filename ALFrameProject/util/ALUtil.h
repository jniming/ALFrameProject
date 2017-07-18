//
//  ALUtil.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 常用的工具类
 */
@interface ALUtil : NSObject



//返回秒数时间搓
/**
 返回秒数时间搓,单位是毫秒
 
 @return string
 */
+(NSString*)getCurrentTimestamp;

/**
 字符串转字典

 @param jsonString nil
 @return nil
 */
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


/**
 字典转字符串

 @param jsonObject nil
 @return nil
 */
+ (NSString *)jsonStringWithObject:(id)jsonObject;




//删除沙盒文件
/**
 根据路径删除沙盒中的文件

 @param filePath nil
 @return nil
 */
+(bool) deleteDistoryFile:(NSString*)filePath;





/**
 汉子转拼音

 @param string nil
 @return nil
 */
+(NSString *)transformMandarinToLatin:(NSString *)string;
@end
