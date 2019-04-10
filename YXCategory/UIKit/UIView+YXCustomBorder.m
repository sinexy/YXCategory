//
//  UIView+YXCustomBorder.m
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/10.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import "UIView+YXCustomBorder.h"

typedef NS_ENUM(NSInteger, EdgeType) {
    TopBorder = 10000,
    LeftBorder = 20000,
    BottomBorder = 30000,
    RightBorder = 40000
};

@implementation UIView (YXCustomBorder)

- (void)yx_removeBorderWithPosition:(YXBorderPosition)position {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (position) {
            case YXBorderPositionTop: {
                if (subView.tag == TopBorder) {
                    [subView removeFromSuperview];
                }
            }
                break;
            case YXBorderPositionRight: {
                if (subView.tag == RightBorder) {
                    [subView removeFromSuperview];
                }
            }
                
                break;
            case YXBorderPositionBottom: {
                if (subView.tag == BottomBorder) {
                    [subView removeFromSuperview];
                }
            }
                
                break;
            case YXBorderPositionLeft: {
                if (subView.tag == LeftBorder) {
                    [subView removeFromSuperview];
                }
            }
                
                break;
            default: {
                if (subView.tag == TopBorder|| subView.tag == LeftBorder || subView.tag == BottomBorder || subView.tag == RightBorder) {
                    [subView removeFromSuperview];
                }
            }
                break;
        }

    }];
}

- (void)yx_addBorderWithPosition:(YXBorderPosition)position color:(UIColor *)color width:(CGFloat)borderWidth {
    [self yx_addBorderWithPosition:position color:color width:borderWidth excludePoint:0 edgeType:0];
}

- (void)yx_addBorderWithPosition:(YXBorderPosition)position color:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(YXExcludePoint)edge {
    [self _yx_addBorderWithPosition:position color:color width:borderWidth excludePoint:point edgeType:edge];
}

- (void)_yx_addBorderWithPosition:(YXBorderPosition)position color:(UIColor *)color width:(CGFloat)borderWidth excludePoint:(CGFloat)point edgeType:(YXExcludePoint)edge {
    [self yx_removeBorderWithPosition:position];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;


    [self addSubview:border];
    
    CGFloat startPoint = 0.f;
    CGFloat endPoint = 0.f;
    if (edge & YXExcludePointStart) {
        startPoint += point;
    }
    if (edge & YXExcludePointEnd) {
        endPoint += point;
    }
    
    switch (position) {
        case YXBorderPositionLeft: {
            border.tag = LeftBorder;
            if (border.translatesAutoresizingMaskIntoConstraints) {
                CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
                border.frame = CGRectMake(0.0, startPoint, borderWidth, borderLength);
            }
            
            // AutoLayout
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
        }
            
            break;
        case YXBorderPositionRight: {
            border.tag = RightBorder;
            if (border.translatesAutoresizingMaskIntoConstraints) {
                CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
                border.frame = CGRectMake(self.bounds.size.width - borderWidth, startPoint, borderWidth, borderLength);
                return;
            }
            
            // AutoLayout
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
        }
            
            break;
        case YXBorderPositionTop: {
            border.tag = TopBorder;
            if (border.translatesAutoresizingMaskIntoConstraints) {
                CGFloat borderLength = self.bounds.size.width - endPoint - startPoint;
                border.frame = CGRectMake(startPoint, 0.0, borderLength, borderWidth);
                return;
            }
            // AutoLayout
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
        }
            
            break;
        case YXBorderPositionBottom: {
            border.tag = BottomBorder;
            if (border.translatesAutoresizingMaskIntoConstraints) {
                CGFloat borderLength = self.bounds.size.width - startPoint - endPoint;
                border.frame = CGRectMake(startPoint, self.bounds.size.height - borderWidth, borderLength, borderWidth);
                return;
            }
            
            // AutoLayout
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:borderWidth]];
        }
            
            break;
        default: {
            [self _yx_addBorderWithPosition:YXBorderPositionTop color:color width:borderWidth excludePoint:point edgeType:edge];
            [self _yx_addBorderWithPosition:YXBorderPositionRight color:color width:borderWidth excludePoint:point edgeType:edge];
            [self _yx_addBorderWithPosition:YXBorderPositionBottom color:color width:borderWidth excludePoint:point edgeType:edge];
            [self _yx_addBorderWithPosition:YXBorderPositionLeft color:color width:borderWidth excludePoint:point edgeType:edge];
        }
            break;
    }

}


@end
