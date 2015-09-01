//
//  TLTransitionAnimator.h
//  EVYG_ZIWEI
//
//  Created by DongDong Zeng on 2013-10-26.
//  Copyright (c) 2013 evanyanagi. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface TLTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isPresenting) BOOL presenting;

@end