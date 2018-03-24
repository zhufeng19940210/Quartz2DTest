//
//  UIImage+Image.h
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.

#import <UIKit/UIKit.h>
@interface UIImage (Image)
// 图片裁剪
+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;
// 图片裁剪
+ (UIImage *)imageWithClipImage:(UIImage *)image;
// 截屏的方法
+ (UIImage *)imageWithCaputureView:(UIView *)view;
@end
