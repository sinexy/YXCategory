//
//  UIView+YXSnapshot.h
//  YXCategoryDemo
//
//  Created by yunxin bai on 2019/4/11.
//  Copyright © 2019 yunxin bai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YXSnapshot)

/**
 * 把一个 view 变成 image
 */
- (nullable UIImage *)yx_snapshotImage;

/**
 * 把一个 view 变成 pdf
 */
- (nullable NSData *)yx_snapshotPDF;

@end

NS_ASSUME_NONNULL_END
