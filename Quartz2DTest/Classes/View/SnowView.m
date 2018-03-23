//  SnowView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
//

#import "SnowView.h"
static CGFloat _snowY = 0;
@implementation SnowView

-(void)drawRect:(CGRect)rect
{
   //如果以后想绘制东西到view上面，必须在drawRect方法里面，不管有没有手动获取到上下文
   //修改雪花的y值
    UIImage *image = [UIImage imageNamed:@"2"];
    [image drawAtPoint:CGPointMake(50, _snowY)];
    _snowY += 10;
    if (_snowY > rect.size.height) {
        _snowY = 0;
    }
}
// 如果在绘图的时候需要用到定时器，通常
// NSTimer很少用于绘图，因为调度优先级比较低，并不会准时调用
-(void)awakeFromNib{
    [super awakeFromNib];
    CADisplayLink *link =  [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    //添加到主队列去循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
//timeChange
-(void)timeChange{
    [self setNeedsDisplay];
}
@end
