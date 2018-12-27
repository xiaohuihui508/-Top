//
//  ViewController.m
//  弹出框Top
//
//  Created by isoft on 2018/12/26.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "ViewController.h"
#import "RTMaskPopups.h"
#import "RTTopView.h"

@interface ViewController ()<RTTopViewDelegate>

@property (nonatomic, strong) RTMaskPopups *popups;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn addTarget:self action:@selector(btnWithAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}

- (void)btnWithAction:(UIButton *)sender {
    NSLog(@"点击按钮");
    RTTopView *v= [[RTTopView alloc] init];
    v.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    v.delegate = self;
    _popups = [RTMaskPopups popupsWithMaskStyle:MaskStyleBlackTranslucent aView:v];
    _popups.presentationStyle = PresentationStyleTop;
    [_popups presentInView:self.view animated:YES completion:NULL];
}


- (void)closeBtnWithAction:(UIButton *)sender {
    [_popups dismissAnimated:YES completion:nil];
}

@end
