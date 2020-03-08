//
//  NRCChatTools.m
//  NeighbourChitchat
//
//  Created by incomes on 2019/10/04.
//  Copyright © 2019 bubbles. All rights reserved.
//

#import "NRCChatTools.h"

@implementation NRCChatTools
+ (void)saveImageToLocal:(UIImage*)image imageName:(NSString*)imageName {
    //首先,需要获取沙盒路径

    NSString *picPath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),imageName];

    NSLog(@"将图片保存到本地  %@",picPath);

    NSData *imgData = UIImageJPEGRepresentation(image,0.5);
    [imgData writeToFile:picPath atomically:YES];
}

//保存图到本地并且获取图片路径
+ (NSString *)getImagePathAndSaveImage:(UIImage *)image {
    
    NSString *imageName = [self timeInterval];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),imageName];
    NSData *imgData = UIImageJPEGRepresentation(image,0.5);
    [imgData writeToFile:filePath atomically:YES];
    return filePath;
}

//将图片从本地删除
+ (void)RemoveImageToLocalKeys:(NSString*)key {
    NSString *picPath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),key];
    NSLog(@"将图片从本地删除  %@",picPath);
    [[NSFileManager defaultManager] removeItemAtPath:picPath error:nil];
}




+ (NSString *)chat_fileNameOfMessage:(YIMMessage *)message {
    
    if (message.messageBody.messageType == YIMMessageBodyType_File) {
        YIMMessageBodyFile *tMessage = (YIMMessageBodyFile *)message.messageBody;
        NSString *fileName = tMessage.fileName;
        return fileName.length == 0 ? @"" : fileName;
    } else if (message.messageBody.messageType == YIMMessageBodyType_Voice) {
        
        YIMMessageBodyAudio *vioceMessage = (YIMMessageBodyAudio *)message.messageBody;
        
        NSLog(@"vioceMessage = %d", vioceMessage.audioTime);
        
        NSString *imageName = [self timeInterval];
        int randomNum = arc4random_uniform(100);
        NSString *voiceName = [NSString stringWithFormat:@"%@%d", imageName, randomNum];
        return [NSString stringWithFormat:@"%@.wav", voiceName];
    } else {
        return @"";
    }
}

//图片用
+ (NSString *)chat_savePath:(NSString *)fileName {
    if (fileName.length == 0) {
        NSLog(@"******savaPath的文件名称不能为空");
    }
    NSString *picPath = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),fileName];
    return picPath;
}


//语音路径
+ (NSString *)chatVoiceSavePath:(NSString *)fileName {
    NSString *picPath = [NSString stringWithFormat:@"%@/Library/Caches/AudioRecord/%@",NSHomeDirectory(),fileName];
    return picPath;
}

//时间处理
+ (NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *currentTimeString = [formatter stringFromDate:[NSDate date]];
    return currentTimeString;
}

+ (NSString *)timeInterval {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString * strTime = [NSString stringWithFormat:@"%d", (int)[[formatter dateFromString:[self getCurrentTimes]] timeIntervalSince1970]];
    return strTime;
    
}

+ (NSString*)getCurrentTimes2{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
    NSString *currentTimeString = [formatter stringFromDate:[NSDate date]];
    return currentTimeString;
}

+ (NSString *)timeInterval2WithString:(NSString *)dateString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
    NSString * strTime = [NSString stringWithFormat:@"%d", (int)[[formatter dateFromString:dateString] timeIntervalSince1970]];
    return strTime;
    
}

 /**
  *  转化时间
  *  几天前，几分钟前
  */
+ (NSString *)updateTimeForTimeInterval:(NSInteger)timeInterval {
     // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
     NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
     // 创建歌曲时间戳(后台返回的时间 一般是13位数字)
     NSTimeInterval createTime = timeInterval;
     // 时间差
     NSTimeInterval time = currentTime - createTime;
     if (time < 60) {
         return @"刚刚";
     }
     NSInteger minutes = time / 60;
     if (minutes < 60) {
         
         return [NSString stringWithFormat:@"%ld分钟前", minutes];
     }
     // 秒转小时
     NSInteger hours = time / 3600;
     if (hours < 24) {
         return [NSString stringWithFormat:@"%ld小时前",hours];
     }
     // 秒转天数
     NSInteger days = time / 3600 / 24;
     if (days < 30) {
         return [NSString stringWithFormat:@"%ld天前",days];
     }
     // 秒转月
     NSInteger months = time / 3600 / 24 / 30;
     if (months < 12) {
         return [NSString stringWithFormat:@"%ld月前",months];
     }
     // 秒转年
     NSInteger years = time / 3600 / 24 / 30 / 12;
     return [NSString stringWithFormat:@"%ld年前",years];
}

@end
