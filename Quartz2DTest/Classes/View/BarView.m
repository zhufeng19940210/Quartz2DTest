//  BarView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.

#import "BarView.h"

@implementation BarView

-(NSArray *)arrRandom{
    int total = 100;
    int temp  = 0;
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < arc4random_uniform(10); i++) {
        temp = arc4random_uniform(100)+1;
        [array addObject:@(temp)];
        //解决办法当为100的时候
        if (temp == total) {
            break;
        }
        total -= temp;
    }
    if (total) {
        [array addObject:@(total)];
    }
    return  array;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    //重绘,系统会先创建与view相关联的上下文，然后再调用drawRect
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    NSArray *array = [self arrRandom];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    for (int i = 0; i<array.count; i++) {
        w = rect.size.width / (2 * array.count - 1);
        x = 2 * w * i;
        h = [array[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[self colorRandom]set];
        [path fill];
    }
}
//随机颜色了
-(UIColor *)colorRandom{
    CGFloat r = arc4random_uniform(256)/255.0f;
    CGFloat g = arc4random_uniform(256)/255.0f;
    CGFloat b = arc4random_uniform(256)/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
