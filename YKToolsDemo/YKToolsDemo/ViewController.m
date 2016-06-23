//
//  ViewController.m
//  YKToolsDemo
//
//  Created by xiaofans on 16/6/23.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "ViewController.h"
#import "YKTools.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 90, 140, 30)];
    [self.view addSubview:textField];
    self.textField = textField;
    textField.placeholder = @"请输入内容";
    textField.layer.borderColor = [UIColor blueColor].CGColor;
    textField.layer.borderWidth = 1.0;
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(120, 150, 100, 30)];
    btn1.backgroundColor = [UIColor  redColor];
    [btn1 setTitle:@"剔除空格" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(trimPlaceClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 210, 100, 30)];
    btn2.backgroundColor = [UIColor  redColor];
    [btn2 setTitle:@"显示警告" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(120, 270, 100, 30)];
    btn3.backgroundColor = [UIColor orangeColor];
    [btn3 setTitle:@"下载数据" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(getDataClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)trimPlaceClick:(UIButton *)sender {
    NSString *newStr = [YKTools trimSpace:self.textField.text];
    self.textField.text = newStr;
}

- (void)getDataClick:(UIButton *)sender {
    
    NSString *url = @"http://applebbx.sj.91.com/api/?cuid=3428d2caf0eb10eeb75f39d9d3ed91cdaaf5a419&act=1&imei=612976FF-5EC4-4E9C-9C8F-A5689CB586C9&spid=2&osv=8.4.1&dm=iPhone7,2&sv=3.1.3&nt=10&mt=1&pid=2";
    
    [YKTools get:url params:nil success:^(id json) {
        NSLog(@"下载成功，数据为:%@", json);
    } failure:^(NSError *error) {
        NSLog(@"下载失败，错误信息为:%@", error);
    }];
    
}

- (void)btnClick:(UIButton *)sender {
    
    [YKTools showAlertView:self title:@"友情提示" message:@"你要关闭这个吗？" cancelButtonTitle:@"关闭" otherButtonTitle:@"取消" confirm:^{
        NSLog(@"点击取消按钮");
    } cancle:^{
        NSLog(@"点击关闭按钮");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
