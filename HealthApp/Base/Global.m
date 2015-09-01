//
//  Global.m
//  HealthApp
//
//  Created by AKI on 2015/9/1.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import "Global.h"

@implementation Global
@synthesize LangInt;

#pragma mark -------------------------------------------
#pragma mark Singleton
static Global *myInstance = nil;

+(Global *)sharedInstance{
    
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
    }
    return myInstance;
}

#pragma mark -------------------------------------------


-(void)setDictionary{
    
    languageDic = [[NSMutableDictionary alloc] init];
    
    
    [languageDic setObject:@"A|甲|一 " forKey:@"A"];
    
    [languageDic setObject:@"B|乙|二" forKey:@"B"];
    
    
    
}

-(NSString *)LocalString:(NSString *)key{
    
    if([[languageDic objectForKey:key] rangeOfString:@"|"].location==NSNotFound){
        return key;
    }
    
    return [[[languageDic objectForKey:key] componentsSeparatedByString:@"|"] objectAtIndex:LangInt];
}



@end
