//  DrawView.h
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import <UIKit/UIKit.h>
@interface DrawView : UIView
@property (nonatomic,strong)UIColor *pathColor;
@property (nonatomic,strong)NSInteger lineWidth;
@property (nonatomic,strong)UIImage *image;
//请屏幕
-(void)clear;
//撤销
-(void)undo;
@end
