//  DrawView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "DrawView.h"
@implementation DrawView
-(void)drawRect:(CGRect)rect{
    // 超出裁剪区域的内容全部裁剪掉
    // 注意：裁剪必须放在绘制之前
//    UIRectClip(CGRectMake(0, 0, 50, 50));
//    UIImage *image =  [UIImage imageNamed:@"1"];
//    // 默认绘制的内容尺寸跟图片尺寸一样大
//    //[image drawAtPoint:CGPointZero];
//    //[image drawInRect:rect];
//    [image drawAsPatternInRect:rect];
      //绘制整个图片
      //[self drawAllImage];
      //绘制文字
      // [self drawText];
      // 绘制文字
    [self attrText];
}
//绘制一整张的图片
-(void)drawAllImage{
    UIImage *image = [UIImage imageNamed:@"1"];
    // 默认绘制的内容尺寸跟图片尺寸一样大
    [image drawAtPoint:CGPointZero];
    // 绘图
    [image drawAsPatternInRect:self.bounds];
}
//绘制全部的文字
-(void)drawText{
    NSString *text = @"asfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdfasfdsfsdf";
    [text drawInRect:self.bounds withAttributes:nil];
}

//绘制文字
- (void)attrText{
    //绘制的文字
    NSString *str = @"asfdsfsdf";
    // 文字的起点
    // Attributes：文本属性
    
    NSMutableDictionary *textDict = [NSMutableDictionary dictionary];
    
    // 设置文字颜色
    textDict[NSForegroundColorAttributeName] = [UIColor redColor];
    
    // 设置文字字体
    textDict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    
    // 设置文字的空心颜色和宽度
    
    textDict[NSStrokeWidthAttributeName] = @6;
    
    textDict[NSStrokeColorAttributeName] = [UIColor yellowColor];
    // 创建阴影对象
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowOffset = CGSizeMake(4, 4);
    shadow.shadowBlurRadius = 3;
    textDict[NSShadowAttributeName] = shadow;
    // 富文本:给普通的文字添加颜色，字体大小
    [str drawAtPoint:CGPointZero withAttributes:textDict];
}
@end
