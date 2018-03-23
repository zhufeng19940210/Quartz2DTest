//  ShareView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "ShareView.h"

@implementation ShareView
//获取view的layer的图形的上下文
//view将要显示出来的都是调用drwaRect这个方法
//rect获取的是bound
-(void)drawRect:(CGRect)rect{
    //画一个正方形的的图片了
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:50];
//
//    [[UIColor blueColor]setStroke];
//
//    [path setLineWidth:2];
//    //执行动画
//    [path stroke];

    //扇形的方法
    /*
     1.圆弧
     Center: 圆心
     startAngle:弧度
     clockwise: YES: 顺时针 NO:逆时针
     */
    CGPoint center = CGPointMake(100, 100);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
    //添加一根线到圆心
    [path addLineToPoint:center];
    // 封闭路径，关闭路径：从路径的终点到起点
    //[path closePath];
    [[UIColor redColor]setStroke];
    
    //[path stroke];
    
    // 填充：必须是一个完整的封闭路径,默认就会自动关闭路径
    [path fill];
    
    
}

@end
