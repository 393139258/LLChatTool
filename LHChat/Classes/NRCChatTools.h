//
//  NRCChatTools.h
//  NeighbourChitchat
//
//  Created by incomes on 2019/10/04.
//  Copyright © 2019 bubbles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YIMClient.h"


@interface NRCChatTools : NSObject

//相册图片发送处理
//保存图片到本地
+ (void)saveImageToLocal:(UIImage*)image imageName:(NSString*)imageName;
//保存图到本地并且获取图片路径
+ (NSString *)getImagePathAndSaveImage:(UIImage *)image;


//-----图片消息处理
//获取文件类型的名称（名称+扩展）
+ (NSString *)chat_fileNameOfMessage:(YIMMessage *)message;
//获取到消息图片后， 需要设置存储路径
+ (NSString *)chat_savePath:(NSString *)fileName;

+ (NSString *)chatVoiceSavePath:(NSString *)fileName;

//时间处理----
+ (NSString *)timeInterval;
+ (NSString*)getCurrentTimes2;
+ (NSString *)timeInterval2WithString:(NSString *)dateString;

+ (NSString *)updateTimeForTimeInterval:(NSInteger)timeInterval;

@end

