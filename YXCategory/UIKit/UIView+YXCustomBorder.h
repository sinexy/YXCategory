//
//  UIView+YXCustomBorder.h
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/10.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, YXExcludePoint) {
    YXExcludePointStart = 1 << 0,
    YXExcludePointEnd = 1 << 1,
    YXExcludePointAll = ~0UL,
};

typedef NS_OPTIONS(NSUInteger, YXBorderPosition) {
    YXBorderPositionLeft = 1 << 0,
    YXBorderPositionTop = 1 << 1,
    YXBorderPositionRight = 1 << 2,
    YXBorderPositionBottom = 1 << 3,
    YXBorderPositionAll = ~0UL,
};


@interface UIView (YXCustomBorder)

/**
 * 为该控件添加一个顶部边框
 @param position 位置
 @param color   边框颜色
 @param borderWidth     边框粗细
 */
- (void)yx_addBorderWithPosition:(YXBorderPosition)position color:(UIColor *)color width:(CGFloat)borderWidth;

/**
 * 为该控件添加一个顶部边框
 @param position 位置
 @param color   边框颜色
 @param borderWidth     边框粗细
 */
- (void)yx_addBorderWithPosition:(YXBorderPosition)position color:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(YXExcludePoint)edge;

/**
 * 移除边框
 @param position 位置
 */
- (void)yx_removeBorderWithPosition:(YXBorderPosition)position;

@end

NS_ASSUME_NONNULL_END
