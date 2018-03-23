//
//  myImageView.m
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
//

#import "myImageView.h"

@implementation myImageView
//裁剪的方法
-(UIImage *)getRectWithImage:(UIImage *)rectImage{
    //开启一个上下文
    UIGraphicsBeginImageContextWithOptions(rectImage.size, NO, 0);
    //size:上下文尺寸
    //opaque:不透明。一般是透明的，所以设置为NO
    //scale:缩放，如果不缩放，设置为0就好
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, rectImage.size.width, rectImage.size.height)];
    // 把圆形路径设置裁剪区域（将区域外的内容裁剪掉，是现实区域内的内容）
    [path addClip];
    //绘制图片（先设置裁剪区域，再裁剪，才会有效果）
    [rectImage drawAtPoint:CGPointZero];
    // 从上下文中内容生成一张图片
    rectImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文（一定不要忘了关闭自己开启的上下文）
    UIGraphicsEndImageContext();
    //返回图片了
    return rectImage;
}
@end
