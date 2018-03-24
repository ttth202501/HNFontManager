//
//  HNFontManager.m
//  SmartN
//
//  Created by Hu,Haining on 2018/3/21.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "HNFontManager.h"

@interface HNFontManager()

@property (nonatomic, strong) NSArray *fontTypes;

@end

@implementation HNFontManager

@synthesize currentLevel = _currentLevel;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static HNFontManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[HNFontManager alloc] init];
        }
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        _currentLevel = -1;
    }
    
    return self;
}

- (NSUInteger)currentLevel {
    return _currentLevel;
}

- (void)setCurrentLevel:(NSUInteger)currentLevel {
    _currentLevel = currentLevel;
    
    [[NSUserDefaults standardUserDefaults] setObject:@(currentLevel) forKey:Key_HNFont_Changed];
    [[NSNotificationCenter defaultCenter] postNotificationName:Notify_HNFont_Changed object:nil];
}

- (NSUInteger)totalLevel {
    return self.fontTypes.count;
}

- (NSArray *)fontTypes {
    if (!_fontTypes) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString *filePath = [bundle pathForResource:@"HNFontLevel" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
        _fontTypes = [[NSArray alloc] initWithArray:arr];
    }
    
    return _fontTypes;
}

@end
