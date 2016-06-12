//
//  ViewController.m
//  ImageAddLogo
//
//  Created by admin on 16/6/12.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/06e7cf7bf02d
//iOS开发技巧----给图片添加水印




#import "ViewController.h"
@interface ViewController ()
@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic)UIImage *img;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64)];
    self.img=[UIImage imageNamed:@"ns_1.jpg"];
    [self.imgView setImage:self.img];
    self.imgView.backgroundColor= [UIColor redColor];
    [self.view addSubview:self.imgView];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
    //开启位图
    UIGraphicsBeginImageContextWithOptions(self.img.size, NO, 0);
    //绘制原生的图片
    [self.img drawAtPoint:CGPointZero];
    //给原生的图片添加文字
    NSString *str = @"AlezJi";
    //创建字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:40];
    [str drawAtPoint:CGPointMake(100, 40) withAttributes:dict];
    //生成一张图片给我们,从上下文中获取图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文（自己开启的自己关闭）
    UIGraphicsEndImageContext();
    
    self.imgView.image =newImg;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
