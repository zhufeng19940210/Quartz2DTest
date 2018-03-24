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
    if (pan.state == ) {
        <#statements#>
    }
}

-(void)drawRect:(CGRect)rect{
    
}
@end
