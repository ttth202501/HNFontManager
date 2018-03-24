//
//  HNFont.m
//  SmartN
//
//  Created by Hu,Haining on 2018/3/21.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "HNFont.h"
#import "HNFontManager.h"

@implementation HNFont

HNFontChange hn_font(NSUInteger originFont, ...) {
    NSMutableArray *fontArr = [NSMutableArray new];
    [fontArr addObject:@(originFont)];
    
    va_list args;
    va_start(args, originFont);
    
    NSInteger otherValue;
    int i = 0;
    NSUInteger count = [HNFontManager shareInstance].totalLevel;
    while ((otherValue = va_arg(args, NSInteger)) && i < count) {
        [fontArr addObject:@(otherValue)];
        ++i;
    }
    
    va_end(args);
    
    return ^(NSInteger fontLevel) {
        NSUInteger normalSize = [[fontArr firstObject] integerValue];
        if (fontLevel == -1) {  //init value
            return [UIFont systemFontOfSize:normalSize];
        }else if (fontLevel + 1 < fontArr.count) {
            NSInteger levelOffset = [[fontArr objectAtIndex:fontLevel + 1] integerValue];
            
            return [UIFont systemFontOfSize:normalSize + levelOffset];
        }else{
            return [UIFont systemFontOfSize:16];
        }
    };
}

@end
