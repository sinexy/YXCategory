//
//  UIImage+YXCategory.h
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/15.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YXCategory)

+ (nullable UIImage *)yx_imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

+ (nullable UIImage *)yx_imageWithColor:(UIColor *)color;

+ (nullable UIImage *)yx_imageWithColor:(UIColor *)color size:(CGSize)size;

- (nullable UIImage *)yx_imageByRoundCornerRadius:(CGFloat)radius;

- (nullable UIImage *)yx_imageByResizeToSize:(CGSize)size;

- (nullable UIImage *)yx_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

- (nullable UIImage *)yx_imageByRotateLeft90;

- (nullable UIImage *)yx_imageByRotateRight90;

- (nullable UIImage *)yx_imageByRotate180;
@end

NS_ASSUME_NONNULL_END
