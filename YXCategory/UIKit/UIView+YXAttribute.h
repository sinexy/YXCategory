//
//  UIView+YXAttribute.h
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/10.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, YXGradientLayerDirection) {
    YXGradientLayerDirectionLeftToRight = 1,
    YXGradientLayerDirectionRightToLeft = 2,
    YXGradientLayerDirectionTopToBottom = 3,
    YXGradientLayerDirectionBottomToTop = 4,
    YXGradientLayerDirectionTopLeftToBottomRight = 5,
    YXGradientLayerDirectionBottomLeftToTopRight = 6,
    YXGradientLayerDirectionBottomRightToTopLeft = 7,
    YXGradientLayerDirectionTopRightToBottomLeft = 8,
};

@interface UIView (YXAttribute)

/** 当前视图的 x 值 */
@property (nonatomic, assign) CGFloat yx_x;
/** 当前视图的 y 值 */
@property (nonatomic, assign) CGFloat yx_y;
/** 当前视图的最大 x 值，相当于 x+width */
@property (nonatomic, assign) CGFloat yx_maxX;
/** 当前视图的最大 y 值，相当于 y+height  */
@property (nonatomic, assign) CGFloat yx_maxY;
/** 当前视图的 width 值 */
@property (nonatomic, assign) CGFloat yx_width;
/** 当前视图的 height 值 */
@property (nonatomic, assign) CGFloat yx_height;
/** 当前视图的 横坐标中心点 值 */
@property (nonatomic, assign) CGFloat yx_centerX;
/** 当前视图的 纵坐标中心点 值 */
@property (nonatomic, assign) CGFloat yx_centerY;
/** 当前视图的 size */
@property (nonatomic, assign) CGSize yx_size;
/** 当前视图的 origin */
@property (nonatomic, assign) CGPoint yx_origin;

/** 该 view 的控制器，可能为空 */
@property (nonatomic, strong, readonly) UIViewController *yx_viewController;

/**
 便捷设置 view 的阴影
 
 @param color  阴影颜色
 @param offset 阴影偏移
 @param radius 阴影弧度
 */
- (void)yx_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 * @biref   设置渐变色
 * @warning 此方法在布局后调用
 * @warning 在所有属性设置完成后再调用该方法，按钮文字的设置放在该方法之后调用，否则不起作用
 * @param direction 渐变方向
 * @param startColor 开始颜色
 * @param endColor 结束颜色
 */
- (void)yx_setGradientLayerWithDirection:(YXGradientLayerDirection)direction startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 * 移除所有子控件
 @warning 不要在 - drawRect: 中调用此方法
 */
- (void)yx_removeAllSubViews;
@end

NS_ASSUME_NONNULL_END
