//  HuaViewController.m
//  Quartz2DTest
//
//  Created by bailing on 2018/3/23.
//  Copyright © 2018年 zhufeng. All rights reserved.
#import "HuaViewController.h"
#import "zfDrawView.h"
@interface HuaViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet zfDrawView *drawView;
@end
@implementation HuaViewController
//清屏
- (IBAction)onClickClearBtn:(UIButton *)sender {
    [self.drawView clear];
}
//撤销
- (IBAction)onClickCancelBtn:(UIButton *)sender {
    [self.drawView undo];
}
//橡皮擦
- (IBAction)onClickEarseBtn:(UIButton *)sender {
    self.drawView.pathColor = [UIColor whiteColor];
}
//照片
- (IBAction)onClickPictureBtn:(UIButton *)sender {
    // 弹出系统的相册
    // 选择控制器（系统相册）
    UIImagePickerController *picekerVc = [[UIImagePickerController alloc] init];
    // 设置选择控制器的来源
    // UIImagePickerControllerSourceTypePhotoLibrary 相册集
    // UIImagePickerControllerSourceTypeSavedPhotosAlbum:照片库
    picekerVc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 设置代理
    picekerVc.delegate = self;
    // modal
    [self presentViewController:picekerVc animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
// 当用户选择一张图片的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 获取选中的照片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 把选中的照片画到画板上
    
    self.drawView.image = image;
    
    // dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
}
//保存
- (IBAction)onClickSaveBtn:(UIButton *)sender {
    //截屏
    //开启上下文的功能
    UIGraphicsBeginImageContextWithOptions(self.drawView.frame.size, NO , 0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 渲染图层
    [self.drawView.layer renderInContext:ctx];
    
    // 获取上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 保存画板的内容放入相册
    // image:写入的图片
    // completionTarget图片保存监听者
    // 注意：以后写入相册方法中，想要监听图片有没有保存完成，保存完成的方法不能随意乱写
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

// 监听保存完成，必须实现这个方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"保存图片成功");
}

//滑动的slider
- (IBAction)onClickSliderBtn:(UISlider *)sender {
    self.drawView.lineWidth = sender.value;
}
//第一个Button
- (IBAction)onClickFirstBtn:(UIButton *)sender {
    self.drawView.pathColor = sender.backgroundColor;
}
//第二个Button
- (IBAction)onClickSecondBtn:(UIButton *)sender {
    self.drawView.pathColor = sender.backgroundColor;
}
//第三个Button
- (IBAction)onClickThirdBtn:(UIButton *)sender {
    self.drawView.pathColor = sender.backgroundColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
