//
//  ListInf.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/26.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ListInf.h"

@interface ListInf ()

@end

@implementation ListInf

@synthesize statName;
@synthesize govOrg;
@synthesize statisticsName;
@synthesize title;
@synthesize cycle;
@synthesize surveyDate;
@synthesize openDate;
@synthesize smallArea;

- (void)debug {
    NSLog(@"statName: %@",statName);
    NSLog(@"govOrg: %@",govOrg);
    NSLog(@"statisticsName: %@",statisticsName);
    NSLog(@"title: %@",title);
    NSLog(@"cycle: %@", cycle);
    NSLog(@"surveyDate: %@",surveyDate);
    NSLog(@"openDate: %@",openDate);
    NSLog(@"smallArea: %@",smallArea);
}


@end
