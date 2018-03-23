//
//  PieView.m
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
//

#import "PieView.h"

@implementation PieView

-(NSArray *)arrRandom{
    int totoal = 100;
    NSMutableArray *array = [NSMutableArray array];
    int temp = 0 ;
    //遍历循环去取出数据
    int fengfengStr  = arc4random_uniform(10);
    
    NSLog(@"fengfengStr:%d",fengfengStr);
    
    for (int i = 0; i< fengfengStr ; i++) {
         // 100  1~100
         temp = arc4random_uniform(totoal) + 1;
        NSLog(@"temp:%d",temp);
         //随机出来的临时值等于总值，直接退出循环，因为已经把总数分配完毕，没必要在分配。
        [array addObject:@(temp)];
        //当随机数刚好是100直接退出了
        if (temp == totoal) {
            break;
        }
         totoal -= temp;
    }
    NSLog(@"totoal:%d",totoal);
    if (totoal) {
        [array addObject:@(totoal)];
    }
    return array;
}
//随机颜色
-(UIColor *)colorRandom{
    // 0 ~ 255 / 255
    // OC:0 ~ 1
    CGFloat r = arc4random_uniform(256)/255.0f;
    CGFloat g = arc4random_uniform(256)/255.0f;
    CGFloat b = arc4random_uniform(256)/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
//真正去画图
-(void)draw{
    CGFloat raduis = self.bounds.size.width * 0.5;
    CGPoint center = CGPointMake(raduis, raduis);
    
    CGFloat startA = 0;
    CGFloat angle  = 0;
    CGFloat endA   = 0;
    //第一个扇形
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:raduis startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path addLineToPoint:center];
    // 描边和填充通用
    [[UIColor redColor] set];
    //关闭
    [path fill];
    
    // 第二个扇形
    startA = endA;
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:raduis startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path1 addLineToPoint:center];
    // 描边和填充通用
    [[UIColor greenColor] set];
    [path1 fill];
    
    // 第二个扇形
    startA = endA;
    angle = 50 / 100.0 * M_PI * 2;
    endA = startA + angle;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:raduis startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path2 addLineToPoint:center];
    // 描边和填充通用
    [[UIColor blueColor] set];
    [path2 fill];
}
//开始去点击屏幕的东西了
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    //重绘，系统会先创建与view相关联的上下文，然后再调用drawRect
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    //获取看有多少个分区
    NSArray *array = [self arrRandom];
    CGFloat raduis = rect.size.width * 0.5;
    CGPoint center = CGPointMake(raduis, raduis);
    
    CGFloat startA = 0;
    CGFloat angle  = 0;
    CGFloat endA   = 0;
    
    for (int i = 0; i< array.count; i++) {
        startA = endA;
        angle = [array[i] integerValue] / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:raduis startAngle:startA endAngle:endA clockwise:YES];
        //添加一根到中心的线
        [path addLineToPoint:center];
        
        [[self colorRandom] set];
        
        [path fill];
    }
}

@end
