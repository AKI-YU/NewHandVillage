//
//  VC_Base.m
//  HealthApp
//
//  Created by AKI on 2015/9/1.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import "VC_Base.h"
#import "TLTransitionAnimator.h"
#import "GiFHUD.h"

@interface VC_Base ()<UIViewControllerTransitioningDelegate>

@end

static NSString* activeStoryBoardName;

@implementation VC_Base
@synthesize mDic;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"BASE did Load");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



-(void)toViewController:(id)sender withIdentifier:(NSString*) identifier
{
    [self toViewController:self withIdentifier:identifier withParameters:nil];
}

-(void)toViewController:(id)sender withIdentifier:(NSString*) identifier withParameters:(NSDictionary *)para
{   
    UIStoryboard *board = [UIStoryboard storyboardWithName:[VC_Base getActiveStoryBoardName] bundle:nil];
    VC_Base *viewController= [board instantiateViewControllerWithIdentifier:identifier];
    viewController.transitioningDelegate = self;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.mDic = para;
    [self presentViewController:viewController animated:YES completion:nil];
    viewController = nil;
    
}

+(void) setActiveStoryBoardName :(NSString*) storyBoardName
{
    activeStoryBoardName = storyBoardName;
}

+(NSString*) getActiveStoryBoardName
{
    return activeStoryBoardName;
}



- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    TLTransitionAnimator *animator = [TLTransitionAnimator new];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TLTransitionAnimator *animator = [TLTransitionAnimator new];
    return animator;
}


#pragma mark ----------Alert------------------

-(void)alert:(NSString *)msg{
    [self alert:@"" msg:msg];
}
-(void)alert:(NSString *)title msg:(NSString *)msg{
    [self alert:title msg:msg btn1:@"確認"];
}

-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName{
    [self alert:title msg:msg btn1:btnName btn2:nil];
}

-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName btn2:(NSString *)btnName2{
    [self alert:title msg:msg btn1:btnName btn2:btnName2 toView:nil];
}

-(void)alert:(NSString *)msg toView:(NSString *)identifier{
    
    [self alert:@"" msg:msg btn1:@"確認" btn2:nil toView:identifier withParameter:nil];
}

-(void)alert:(NSString *)msg toView:(NSString *)identifier withParameter:(NSDictionary *)parameter{
    [self alert:@"" msg:msg btn1:@"確認" btn2:nil toView:identifier withParameter:parameter];
}

-(void)alert:(NSString *)title msg:(NSString *)msg toView:(NSString *)identifier{
    [self alert:title msg:msg btn1:@"確認" btn2:nil toView:identifier withParameter:nil];
}

-(void)alert:(NSString *)title msg:(NSString *)msg toView:(NSString *)identifier withParameter:(NSDictionary *)parameter{
    
    [self alert:title msg:msg btn1:@"確認" btn2:nil toView:identifier withParameter:parameter];
}


-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName btn2:(NSString *)btnName2 toView:(NSString *)identifier{
    
    [self alert:title msg:msg btn1:btnName btn2:btnName2 toView:nil withParameter:nil];
}


-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName btn2:(NSString *)btnName2 toView:(NSString *)identifier withParameter:(NSDictionary *)parameter{

    if(btnName==nil){
        btnName = @"確認";
    }
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:msg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:btnName
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                            
                             if(identifier!=nil){
                                 [self toViewController:self withIdentifier:identifier withParameters:parameter];
                             }
                         }];
    
    
    [alert addAction:ok];
    
    if(btnName2!=nil){
    
        UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"取消"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                                 
                             }];
        
        
        [alert addAction:cancel];
    }
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark ----------HUD------------------

-(void)showHUD{
    
    [GiFHUD setGifWithImageName:@"loading.gif"];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [GiFHUD show];
}


-(void)hideHUD{
    
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    [GiFHUD dismiss];
}



@end
