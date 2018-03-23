//  ViewController.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "ViewController.h"
#import "ProgressView.h"
#import "ZFImageView.h"
#import "myImageView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ProgressView *preogressView;
@property (weak, nonatomic) IBOutlet UILabel *precentLabel;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet ZFImageView *zfImageView;
@property (weak, nonatomic) IBOutlet UIImageView *clipimageView;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //绘制文字
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //设置文字颜色
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    //设置字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    //设置文字的空心颜色和宽度
    dict[NSStrokeWidthAttributeName] = @3;
    dict[NSStrokeColorAttributeName] = [UIColor yellowColor];
    //创建阴影对象
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor  = [UIColor greenColor];
    shadow.shadowOffset = CGSizeMake(4, 4);
    shadow.shadowBlurRadius = 3;
    dict[NSShadowAttributeName] = shadow;
    //创建富文本
    NSAttributedString *strArr = [[NSAttributedString alloc]initWithString:@"abcdeghijklmnopqrst" attributes:dict];
    self.myLabel.attributedText = strArr;
    self.zfImageView.image = [UIImage imageNamed:@"2"];
    //裁剪图片为眼角
    myImageView *tool = [[myImageView alloc]init];
    UIImage *image =  [tool getRectWithImage:[UIImage imageNamed:@"2"]];
    self.clipimageView.image = image;
}
//改变progressview的值
- (IBAction)onCllickChangeBtn:(UISlider *)sender {
    self.precentLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    self.preogressView.progress = sender.value;
}
//截屏的方法
- (IBAction)onClickJiePingBtn:(UIButton *)sender {
    CGRect rect = [UIScreen mainScreen].bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(currentContext, - CGRectGetMinX(rect), - CGRectGetMinY(rect));
    [self.view.layer renderInContext:currentContext];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self saveImageToPhotoAlbum:snapshotImage];
    // 截图动画
    UIImageView *screenImageView = [[UIImageView alloc] initWithImage:snapshotImage];
    [self.view addSubview:screenImageView];
    [UIView animateWithDuration:0.5 animations:^{
        screenImageView.transform = CGAffineTransformScale(self.view.transform, 0.5, 0.5);
    } completion:^(BOOL finished) {
        [screenImageView removeFromSuperview];
        //[MBProgressHUD showSuccess:@"截图保存成功！" toView:self.view];
        NSLog(@"保存成功了");
    }];
    
}


#pragma - 保存至相册
- (void)saveImageToPhotoAlbum:(UIImage *)savedImage {
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}
// 指定回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil;
    if(error != NULL){
        msg = @"保存图片失败";
    }else{
        msg = @"保存图片成功";
    }
    NSLog(@"%@",msg);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
