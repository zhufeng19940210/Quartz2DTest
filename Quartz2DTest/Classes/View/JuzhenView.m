//
//  JuzhenView.m
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
//

#import "JuzhenView.h"

@implementation JuzhenView

-(void)drawRect:(CGRect)rect{
    //1.获取view的layer图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    [[UIColor redColor] set];
    //3.注意点，矩阵注意点
    //注意:矩阵操作必须要在添加路径之前
    //  平移
    CGContextTranslateCTM(ctx, 100, 50);
    // 缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    // 旋转
    CGContextRotateCTM(ctx, M_PI_4);
    //3.添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor redColor] set];

    // 4.渲染上下文
    CGContextFillPath(ctx);
    
}

@end
