//
//  DBManager.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "DBManager.h"

static DBManager *dbManager;
@implementation DBManager

+(DBManager *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbManager=[[DBManager alloc]init];
        
    });
    return dbManager;
}

-(instancetype)init{
    self=[super init];
    if(self){
    
        [self ceateTable];
    }
    return self;
}


-(void)ceateTable{
    NSString *path=[NSString stringWithFormat:@"%@/Documents/alfram.db",NSHomeDirectory()];// 创建数据库示例
    self.db = [FMDatabase databaseWithPath:path];
    //    [self.db open];  //打开数据库
    if (![self.db open]) {
        // [db release];   // uncomment this line in manual referencing code; in ARC, this is not necessary/permitted
        self.db = nil;
        return;
    }
    //创建用户表
    NSString * sql=@"create table if not exists userinfo(_id integer primary key autoincrement,userinfo blob NOT NULL, account text NOT NULL)";
 
    [self.db executeUpdate:sql ];

    [self.db close];
    
    

}


//-(void)saveMessageWithOtherId:(BaseMsg *)msg{
//    NSString *msg_type=[msg valueForKey:@"msg_info_type"];
//    NSString *msg_content=[msg valueForKey:@"msg_content"];
//    NSString *msg_second=[msg valueForKey:@"msg_second"];
//    NSString *msg_isor=[msg valueForKey:@"msg_isor"];
//    NSString *msg_time=[msg valueForKey:@"msg_time"];
//    NSString *otherid=[msg valueForKey:@"otherid"];
//    NSString *isread=[msg valueForKey:@"isread"];
//    NSString *videourl=[msg valueForKey:@"videoUrl"];
//    NSString *lc_voiceUrl=[msg valueForKey:@"lc_voiceUrl"]==nil?@"":[msg valueForKey:@"lc_voiceUrl"];
//    [self.db open];
//    [self.db beginTransaction];
//    
//    NSString *sql=@"insert into msgtable(msg_type,msg_content,msg_isor,msg_second,msg_time,otherid,videoUrl,lc_voiceUrl) values(?,?,?,?,?,?,?,?)";
//    //注意,填充符里面的都是对象,如果数据是基本类型,要先转为对象
//    [self.db executeUpdate:sql,msg_type,msg_content,msg_isor,msg_second,msg_time,otherid,videourl,lc_voiceUrl];
//    [self.db commit];
//    [self.db close];
//    
//    MsgListEntity * entity=[[MsgListEntity alloc]init];
//    entity.otherid=otherid;
//    entity.list_msg=msg;
//    entity.list_time=msg_time;
//    entity.readnum=isread;
//    
//    [self saveAndUpdateConversation:entity];
//    
//}
//
//
//-(NSMutableArray<BaseMsg *> *)getAllMsgWithOtherId:(NSString *)otherid{
//    BaseMsg * msg;
//    NSMutableArray<BaseMsg *> * arr=[[NSMutableArray alloc]init];
//    [_db open];
//    
//    FMResultSet *resultSet= [_db executeQuery:@"SELECT * FROM msgtable where otherid = ? order by msg_time asc",otherid];
//    while ([resultSet next]) {
//        msg=[[BaseMsg alloc]init];
//        NSString *msg_type=[resultSet stringForColumn:@"msg_type"];
//        NSString *msg_isor=[resultSet stringForColumn:@"msg_isor"];
//        NSString *msg_second=[resultSet stringForColumn:@"msg_second"];
//        NSString *msg_time=[resultSet stringForColumn:@"msg_time"];
//        NSString *otherid=[resultSet stringForColumn:@"otherid"];
//        NSString *msg_content=[resultSet stringForColumn:@"msg_content"];
//        NSString *video_Url=[resultSet stringForColumn:@"videoUrl"];
//        NSString *lc_voiceUrl=[resultSet stringForColumn:@"lc_voiceUrl"];
//        NSString *msg_id=[NSString stringWithFormat:@"%i",[resultSet intForColumn:@"msg_id"]];
//        
//        msg.msg_id=msg_id;
//        msg.msg_time=msg_time;
//        msg.msg_isor=msg_isor;
//        msg.msg_second=msg_second;
//        msg.msg_content=msg_content;
//        msg.otherid=otherid;
//        msg.msg_info_type=msg_type;
//        msg.videoUrl=video_Url;
//        msg.lc_voiceUrl=lc_voiceUrl;
//        
//        [arr addObject:msg];
//    }
//    [resultSet close];
//    [_db close];
//    
//    //查询所有消息后,清空会话表的未读数
//    [self clearReadNum:otherid];
//    
//    
//    return arr;
//}
@end
