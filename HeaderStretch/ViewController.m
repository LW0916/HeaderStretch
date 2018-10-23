//
//  ViewController.m
//  HeaderStretch
//
//  Created by lwmini on 2018/10/23.
//  Copyright © 2018年 lw. All rights reserved.
//

#import "ViewController.h"
#import "LWStretchViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.center = self.view.center;
    [btn setTitle:@"点击跳转" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btnClick:(UIButton *)sender{
    [self.navigationController pushViewController:[[LWStretchViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
