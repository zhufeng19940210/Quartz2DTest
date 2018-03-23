//  LineView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved
#import "LineView.h"

@implementation LineView
//绘图的步骤:
//1.获取上下文
//2.创建路径(描述路径)
//3.把路径添加到上下文
//4.渲染上下文
// 通常在这个方法里面绘制图形
// 为什么要再drawRect里面绘图，只有在这个方法里面才能获取到跟View的layer相关联的图形上下文
// 什么时候调用:当这个View要显示的时候才会调用drawRect绘制图形，
// 注意：rect是当前控件的bounds
-(void)drawRect:(CGRect)rect{
    //1.只有这个方法才能获取到view的layer相关的图形的上下文
    //2.view将要显示当地时候调用
    //3.rect是当前控件的bounds
    //[self Test];
    //[self Test2];
    //[self drawLine];
    //[self Test3];
    //[self Test4];
    [self Test7];
}
//1.最简单的画图的工具
-(void)Test{
    NSLog(@"最简单的画图功能");
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    //设置起点
    CGContextMoveToPoint(ctx, 50, 50);
    //设置终点
    CGContextAddQuadCurveToPoint(ctx, 150, 20, 250, 50);
    //渲染上下文
    CGContextStrokePath(ctx);
}
//2.
-(void)Test2{
    NSLog(@"画图2");
    //1.获取上下文
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    //2.描述路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 150, 50);
    //3.设置起点
    CGContextMoveToPoint(ctx, 80, 60);
    // 默认下一根线的起点就是上一根线终点
    CGContextAddLineToPoint(ctx, 100, 200);
    //设置绘图状态之前一定要做渲染操作
    //设置颜色
    [[UIColor redColor] setStroke];
    //线宽
    CGContextSetLineWidth(ctx, 5);
    //设置连接是样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    //设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //渲染上下文
    CGContextStrokePath(ctx);
}
//最原始的绘图方式
-(void)drawLine{
    //1.获取上下文
    // 目前使用的上下文都是UIGraphics
    // CGContextRef Ref:引用，CG:目前使用的类型和函数，一般都是其使用CG
    //获取上文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    //添加一根线都某个点
    CGPathAddLineToPoint(path, NULL, 200, 200);
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path);
    //4.渲染上下文
    CGContextStrokePath(ctx);
}
//第二种绘图的方法
-(void)Test3{
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.创建路径
    // 设置起点
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 200, 200);
    //渲染上下文
    CGContextStrokePath(ctx);
}
//第三种使用贝塞尔曲线画图
-(void)Test4{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    
    [path addLineToPoint:CGPointMake(100, 100)];
    
    path.lineWidth = 10;
    
    [[UIColor redColor] set];
    
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:CGPointMake(0, 0 )];
    
    [path1 addLineToPoint:CGPointMake(30, 60)];
    
    path1.lineWidth = 3;
    
    [[UIColor yellowColor]set];
    
    [path1 stroke];
}
//CGContextRef，CGPath和UIBezierPath 来绘制图片
//CGPath
-(void)Test5{
    //开始绘图

    //开始图像绘图
    UIGraphicsBeginImageContext(self.bounds.size);
    //获取当前CGContextRef
    CGContextRef gc = UIGraphicsGetCurrentContext();

    //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    //左眼
    CGPathAddEllipseInRect(path, &transform, CGRectMake(0, 0, 20, 20));
    //右眼
    CGPathAddEllipseInRect(path, &transform, CGRectMake(80, 0, 20, 20));
    //笑
    CGPathMoveToPoint(path, &transform, 100, 50);
    CGPathAddArc(path, &transform, 50, 50, 50, 0, M_PI, NO);
    //将CGMutablePathRef添加到当前Context内
    CGContextAddPath(gc, path);
    //设置绘图属性
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(gc, 2);
    //执行绘画
    CGContextStrokePath(gc);
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self addSubview:imgView];
    
}
//CGContextRef
-(void)Test6{
    //开始图像绘图
    UIGraphicsBeginImageContext(self.bounds.size);
    //获取当前CGContextRef
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //使用CGContextTranslateCTM函数来转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGContextTranslateCTM(gc, 50, 50);
    //左眼
    CGContextAddEllipseInRect(gc, CGRectMake(0, 0, 20, 20));
    //右眼
    CGContextAddEllipseInRect(gc, CGRectMake(80, 0, 20, 20));
    //笑
    CGContextMoveToPoint(gc, 100, 50);
    CGContextAddArc(gc, 50, 50, 50, 0, M_PI, NO);
    //设置绘图属性
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(gc, 2);
    //执行绘画
    CGContextStrokePath(gc);
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self addSubview:imgView];
}
//UIBezierPath来画图
-(void)Test7{
    //开始去绘图
    UIGraphicsBeginImageContext(self.bounds.size);
    //创建UIBezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    //左眼
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 20, 20)]];
    //右眼
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 0, 20, 20)]];
    //笑
    [path moveToPoint:CGPointMake(100, 50)];
    //
    [path addArcWithCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    //使用applaTranform的东西
    [path applyTransform:CGAffineTransformMakeTranslation(50, 50)];
    //设置绘图属性
    [[UIColor blueColor]setStroke];
    [path setLineWidth:2];
    //执行动画
    [path stroke];
    
    //从context中获取图像,并显示在界面了
    UIImage *img  = UIGraphicsGetImageFromCurrentImageContext();
    //结束的东西
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc]initWithImage:img];
    
    [self addSubview:imageView];
}

@end
