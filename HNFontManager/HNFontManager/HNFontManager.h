//
//  HNFontManager.h
//  SmartN
//
//  Created by Hu,Haining on 2018/3/21.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum : NSUInteger {
//    FontType_Normal,
//    FontType_Small,
//    FontType_Medium,
//    FontType_Large,
//    FontType_SuperLarge
//} FontType;

static NSString * const Notify_HNFont_Changed = @"Notify_HNFont_Changed";
static NSString * const Key_HNFont_Changed    = @"Key_HNFont_Changed";

@interface HNFontManager : NSObject

@property (nonatomic, assign) NSUInteger currentLevel;
@property (nonatomic, readonly, assign) NSUInteger totalLevel;

+ (instancetype)shareInstance;

@end
