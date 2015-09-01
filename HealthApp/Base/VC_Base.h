//
//  VC_Base.h
//  HealthApp
//
//  Created by AKI on 2015/9/1.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import <UIKit/UIKit.h>

#define mRect(x,y,w,h) CGRectMake((x),(y),(w),(h))
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#define isTest 1  //1 測試  0 正式

#define btnSetTitle(b,s) [(b) setTitle:[[Global sharedInstance]LocalString:(s)] forState:UIControlStateNormal]

#define testString [NSURL URLWithString:


@interface VC_Base : UIViewController


@property (nonatomic,retain) NSDictionary *mDic;

+(void) setActiveStoryBoardName :(NSString*) storyBoardName;
+(NSString*) getActiveStoryBoardName;



-(void)toViewController:(id)sender withIdentifier:(NSString*) identifier;
-(void)toViewController:(id)sender withIdentifier:(NSString*) identifier withParameters:(NSDictionary *)para;


#pragma mark alert package
#pragma mark ====================================================
-(void)alert:(NSString *)msg;
-(void)alert:(NSString *)title msg:(NSString *)msg;
-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName;
-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName btn2:(NSString *)btnName2;
-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName btn2:(NSString *)btnName2 toView:(NSString *)identifier;
-(void)alert:(NSString *)title msg:(NSString *)msg btn1:(NSString *)btnName btn2:(NSString *)btnName2 toView:(NSString *)identifier withParameter:(NSDictionary *)parameter;
-(void)alert:(NSString *)msg toView:(NSString *)identifier;
-(void)alert:(NSString *)msg toView:(NSString *)identifier withParameter:(NSDictionary *)parameter;
-(void)alert:(NSString *)title msg:(NSString *)msg toView:(NSString *)identifier;
-(void)alert:(NSString *)title msg:(NSString *)msg toView:(NSString *)identifier withParameter:(NSDictionary *)parameter;

#pragma mark ====================================================

#pragma mark Hud
-(void)showHUD;
-(void)hideHUD;

@end

