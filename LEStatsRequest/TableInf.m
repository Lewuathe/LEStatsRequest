//
//  TableInf.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "TableInf.h"

@implementation TableInf

@synthesize identity;
@synthesize statName;
@synthesize govOrg;
@synthesize statisticsName;
@synthesize title;
@synthesize surveyDate;

@synthesize totalNumber;
@synthesize fromNumber;
@synthesize toNumber;
@synthesize nextKey;

- (void)debug {
    NSLog(@"------ TableInf --------");
    NSLog(@"identity: %@",identity);
    NSLog(@"statName: %@",statName);
    NSLog(@"govOrg: %@",govOrg);
    NSLog(@"statisticsName: %@",statisticsName);
    NSLog(@"title: %@",title);
    NSLog(@"surveyDate: %@",surveyDate);
    
    NSLog(@"totalNumber: %@",toNumber);
    NSLog(@"fromNumber: %@",fromNumber);
    NSLog(@"toNumber: %@",toNumber);
    NSLog(@"nextKey: %@",nextKey);
}


@end
