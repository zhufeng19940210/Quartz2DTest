//
//  ZFImageView.m
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
//

#import "ZFImageView.h"

@implementation ZFImageView

-(void)setImage:(UIImage *)image{
    
    _image =  image;
    
    [self setNeedsDisplay];

}

-(instancetype)initWithImage:(UIImage *)image{
    if (self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)]) {
        _image = image;
    }
    return self;
}

-(void)drawRect:(CGRect)rect{

    [_image drawInRect:rect];
}

@end
