//
//  HNFontDefine.h
//  SmartN
//
//  Created by Hu,Haining on 2018/3/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#ifndef HNFontDefine_h
#define HNFontDefine_h

typedef UIFont * (^HNFontChange)(NSInteger fontLevel);
HNFontChange hn_font(NSUInteger originFont, ...);

#endif /* HNFontDefine_h */
