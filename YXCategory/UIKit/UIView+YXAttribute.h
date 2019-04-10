//
//  UIView+YXAttribute.h
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/10.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
