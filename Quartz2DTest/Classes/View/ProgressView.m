//  ProgressView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "ProgressView.h"
@implementation ProgressView
-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    //重新绘圆弧
    //[self drawRect:self.bounds];
    // 重绘，系统会先创建与view相关联的上下文，然后再调用drawRect
    [self setNeedsDisplay];
}
// 注意：drawRect不能手动调用，因为图形上下文我们自己创建不了，只能由系统帮我们创建，并且传递给我们

-(void)drawRect:(CGRect)rect{
   
    //1.获取贝塞尔路径
    
    CGFloat raduis = rect.size.width * 0.5;
    
    CGPoint center = CGPointMake(raduis, raduis);

    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:raduis-2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    //填充颜色
    [[UIColor redColor]setStroke];
    
    [path stroke];
}
@end
