//
//  ViewController.m
//  ScollLabelDemo
//
//  Created by 曾洪磊 on 2019/5/13.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import "ViewController.h"
#import "CYBScrollLabel.h"
#import "CYBTextView.h"
#import "CYBLunBoView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //无限滚动View
    CYBScrollLabel *label = [[CYBScrollLabel alloc]initWithFrame:CGRectMake(50, 50, 200, 40)];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"我是一只狼11111";
    [self.view addSubview:label];
    [label startScoll];
    
    //自定义textView
    CYBTextView *textView = [[CYBTextView alloc]initWithFrame:CGRectMake(50, 100, 200, 70)];
    textView.placeholder = @"我是占位字符我是占位字符我是占位字符我是占位字符";
    textView.placeholderColor = [UIColor redColor];
    textView.font = [UIFont systemFontOfSize:14];
    textView.layer.cornerRadius = 4;
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textView.clipsToBounds = YES;
    [self.view addSubview:textView];
    
    CYBLunBoView *lun = [[CYBLunBoView alloc]initWithFrame:CGRectMake(50, 200, 200, 30)];
    lun.texts = @[@"111111111111111111",@"22222222222222222222",@"333333333333333",@"4444444444444",@"5555555555555",@"666666666666",@"777777777777"];
    [self.view addSubview:lun];
}

@end
