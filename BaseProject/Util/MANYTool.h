//
//  MANYTool.h
//  MANY
//
//  Created by soft on 15/10/27.
//  Copyright © 2015年 Main. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MANYTool : NSObject
/**
 *  将日期的字符串转换为NSDate类型
 */
+ (NSDate *)dateFromString:(NSString *)dateStr;
@end