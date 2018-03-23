//
//  myImageView.h
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface myImageView : NSObject
//裁剪图片的方法
-(UIImage *)getRectWithImage:(UIImage *)rectImage;
//截屏的方法
@end
