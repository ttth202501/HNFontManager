//
//  UILabel+FontChange.h
//  SmartN
//
//  Created by Hu,Haining on 2018/3/22.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNFontDefine.h"

@interface UILabel (FontChange)

@property (nonatomic, setter=hn_setFont:, copy) HNFontChange hn_font;

@end
