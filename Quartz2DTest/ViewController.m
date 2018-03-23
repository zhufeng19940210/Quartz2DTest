//  ViewController.m
//  Quartz2DTest
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "ViewController.h"
#import "ProgressView.h"
#import "ZFImageView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ProgressView *preogressView;
@property (weak, nonatomic) IBOutlet UILabel *precentLabel;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet ZFImageView *zfImageView;
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
}
//改变progressview的值
- (IBAction)onCllickChangeBtn:(UISlider *)sender {
    self.precentLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    self.preogressView.progress = sender.value;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
