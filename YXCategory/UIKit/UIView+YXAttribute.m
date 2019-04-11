//
//  UIView+YXAttribute.m
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/10.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import "UIView+YXAttribute.h"

@implementation UIView (YXAttribute)

- (void)setYx_x:(CGFloat)yx_x {
    CGRect frame = self.frame;
    frame.origin.x = yx_x;
    self.frame = frame;
}

- (CGFloat)yx_x {
    return self.frame.origin.x;
}

- (void)setYx_y:(CGFloat)yx_y {
    CGRect frame = self.frame;
    frame.origin.y = yx_y;
    self.frame = frame;
}

- (CGFloat)yx_y {
    return self.frame.origin.y;
}

- (void)setYx_maxX:(CGFloat)yx_maxX {
    CGRect frame = self.frame;
    frame.origin.x = yx_maxX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yx_maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYx_maxY:(CGFloat)yx_maxY {
    CGRect frame = self.frame;
    frame.origin.x = yx_maxY - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yx_maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYx_width:(CGFloat)yx_width {
    CGRect frame = self.frame;
    frame.size.width = yx_width;
    self.frame = frame;
}

- (CGFloat)yx_width {
    return self.frame.size.width;
}

- (void)setYx_height:(CGFloat)yx_height {
    CGRect frame = self.frame;
    frame.size.height = yx_height;
    self.frame = frame;
}

- (CGFloat)yx_height {
    return self.frame.size.height;
}

- (void)setYx_centerX:(CGFloat)yx_centerX {
    self.center = CGPointMake(yx_centerX, self.center.y);
}

- (CGFloat)yx_centerX {
    return self.center.x;
}

- (void)setYx_centerY:(CGFloat)yx_centerY {
    self.center = CGPointMake(self.center.x, yx_centerY);
}

- (CGFloat)yx_centerY {
    return self.center.y;
}

- (void)setYx_origin:(CGPoint)yx_origin {
    CGRect frame = self.frame;
    frame.origin = yx_origin;
    self.frame = frame;
}

- (CGPoint)yx_origin {
    return self.frame.origin;
}

- (void)setYx_size:(CGSize)yx_size {
    CGRect frame = self.frame;
    frame.size = yx_size;
    self.frame = frame;
}

- (CGSize)yx_size {
    return self.frame.size;
}


- (void)yx_setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)yx_setGradientLayerWithDirection:(YXGradientLayerDirection)direction startColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    [self layoutIfNeeded];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0.0,@1.0];
    switch (direction) {
        case YXGradientLayerDirectionLeftToRight: {
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1.0, 0);
        }
            break;
        case YXGradientLayerDirectionRightToLeft: {
            gradientLayer.startPoint = CGPointMake(1.0, 0);
            gradientLayer.endPoint = CGPointMake(0.0, 0);
        }
            break;
        case YXGradientLayerDirectionTopToBottom: {
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(0, 1.0);
        }
            break;
        case YXGradientLayerDirectionBottomToTop: {
            gradientLayer.startPoint = CGPointMake(0, 1.0);
            gradientLayer.endPoint = CGPointMake(0.0, 0);
        }
            break;
        case YXGradientLayerDirectionTopLeftToBottomRight: {
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1.0, 1.0);
        }
            break;
        case YXGradientLayerDirectionBottomRightToTopLeft: {
            gradientLayer.startPoint = CGPointMake(1.0, 1.0);
            gradientLayer.endPoint = CGPointMake(0, 0);
        }
            break;
        case YXGradientLayerDirectionBottomLeftToTopRight: {
            gradientLayer.startPoint = CGPointMake(0, 1.0);
            gradientLayer.endPoint = CGPointMake(1.0, 0);
        }
            break;
        case YXGradientLayerDirectionTopRightToBottomLeft: {
            gradientLayer.startPoint = CGPointMake(1.0, 0);
            gradientLayer.endPoint = CGPointMake(0, 1.0);
        }
            break;
    }

    gradientLayer.frame = self.bounds;
    gradientLayer.cornerRadius = self.layer.cornerRadius;
    
    [self.layer addSublayer:gradientLayer];
}

- (UIViewController *)yx_viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


- (void)yx_removeAllSubViews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
