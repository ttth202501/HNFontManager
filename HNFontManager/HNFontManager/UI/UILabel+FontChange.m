//
//  UILabel+FontChange.m
//  SmartN
//
//  Created by Hu,Haining on 2018/3/22.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "UILabel+FontChange.h"
#import "NSObject+FontChange.h"

@interface UILabel()

@property (nonatomic, strong) NSMutableDictionary<NSString *, HNFontChange> *configer;

@end

@implementation UILabel (FontChange)

- (void)hn_setFont:(HNFontChange)font {
    objc_setAssociatedObject(self, @selector(hn_font), font, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    self.font = font(self.hn_manager.currentLevel);
    
    [self.configer setObject:[font copy] forKey:@"setFont:"];
}

- (HNFontChange)hn_font {
    return objc_getAssociatedObject(self, @selector(hn_font));
}

@end
