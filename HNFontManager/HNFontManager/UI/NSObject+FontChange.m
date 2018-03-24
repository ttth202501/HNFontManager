//
//  NSObject+FontChange.m
//  SmartN
//
//  Created by Hu,Haining on 2018/3/22.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "NSObject+FontChange.h"

static char newsTypeKey;
static char contentTypeKey;
static char logJSONDicKey;
static char displayTypeKey;

@implementation NSObject (FontChange)

- (HNFontManager *)hn_manager {
    return [HNFontManager shareInstance];
}

- (NSMutableDictionary<NSString *, HNFontChange> *)configer {
    NSMutableDictionary<NSString *, HNFontChange> *configer = objc_getAssociatedObject(self, &newsTypeKey);
    if (!configer) {
        configer = [[NSMutableDictionary alloc] init];
        
        objc_setAssociatedObject(self, &newsTypeKey, configer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:Notify_HNFont_Changed object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontChanged) name:Notify_HNFont_Changed object:nil];
    }
    
    return configer;
}

//- (void)setConfiger:(NSMutableDictionary<NSString *,HNFontChange> *)configer {
//    objc_setAssociatedObject(self, &newsTypeKey, configer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}

- (void)fontChanged {
    [self.configer enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, HNFontChange  _Nonnull obj, BOOL * _Nonnull stop) {
        SEL sel = NSSelectorFromString(key);
        id result = obj(self.hn_manager.currentLevel);
        [self performSelector:sel withObject:result];
    }];
}

@end
