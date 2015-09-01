//
//  ViewController.m
//  HealthApp
//
//  Created by AKI on 2015/9/1.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import "ViewController.h"
#import "Global.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ViewController:%@",self.mDic);

    NSLog(@"view did Load");
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:mRect(0, 0, 100, 100)];
    
    [img setBackgroundColor:RGBCOLOR(125, 125, 125)];
    
    [self.view addSubview:img];
    
    btnSetTitle(btn1,@"A");
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnClick:(id)sender{
    
    NSArray *mArray = @[@"1",@"2",@"3"];
    
    
    [self alert:@"test" msg:@"OK" toView:@"MainViewController" withParameter:@{@"myValue":mArray}];
    
    
}

@end
