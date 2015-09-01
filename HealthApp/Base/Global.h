//
//  Global.h
//  HealthApp
//
//  Created by AKI on 2015/9/1.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject
{
    NSMutableDictionary *languageDic;
    
    
}

@property (nonatomic,assign) int LangInt;

+(Global *)sharedInstance;
-(void)setDictionary;
-(NSString *)LocalString:(NSString *)key;

@end
