//  DrawView.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "DrawView.h"
#import "DrawPath.h"
@interface DrawView()
@property (nonatomic,strong)DrawPath *path;
@property (nonatomic,strong)NSMutableArray *pathArray;
@end
@implementation DrawView
-(NSMutableArray *)pathArray{
    if (!_pathArray) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}
-(void)setImage:(UIImage *)image{
    _image = image;
    [self.pathArray addObject:image];
    [self setNeedsDisplay];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}
-(void)setUp{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}
-(void)pan:(UIGestureRecognizer *)pan{
    CGPoint purT = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        //创建路径了
        _path = [[DrawPath alloc]init];
        //设置_path的宽度
        _path.lineWidth = _lineWidth;
        //路径的颜色
        _path.pathColor = _pathColor;
        //开始的路径
        [_path moveToPoint:purT];
        //保存到数据
        [_pathArray addObject:_path];
    }
    // 手指一直在拖动
    // 添加线到当前触摸点
    [_path addLineToPoint:curP];
    // 重绘
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    for (DrawPath *path in self.pathArray) {
        if ([path isKindOfClass:[UIImage class]]) {
            //绘制图片
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
            // 画线
            [path.pathColor set];
            [path stroke];
        }
    }
}
@end
