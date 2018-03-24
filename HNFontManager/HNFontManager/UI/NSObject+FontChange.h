//
//  NSObject+FontChange.h
//  SmartN
//
//  Created by Hu,Haining on 2018/3/22.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "HNFontManager.h"
#import "HNFont.h"

@interface NSObject (FontChange)

@property (nonatomic, strong, readonly) HNFontManager *hn_manager;
@property (nonatomic, strong) NSMutableDictionary<NSString *, HNFontChange> *configer;

@end
