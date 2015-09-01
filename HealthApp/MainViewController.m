//
//  MainViewController.m
//  HealthApp
//
//  Created by AKI on 2015/9/1.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"MainViewController:%@",self.mDic);
    
    [self showHUD];
    
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:5.0f];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//
//-(IBAction)btnClick:(id)sender{
//    
//    [self toViewController:self withIdentifier:@"ViewController"withParameters:@{@"C":@[@"A",@"B"]}];
//    
//}
@end
