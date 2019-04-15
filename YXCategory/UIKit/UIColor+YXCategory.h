//
//  UIColor+YXCategory.h
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/15.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YXCategory)

+ (UIColor *)yx_colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

+ (UIColor *)yx_colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)algha;

+ (UIColor *)yx_colorWithHexString:(NSString *)hexStr;

@end

NS_ASSUME_NONNULL_END
