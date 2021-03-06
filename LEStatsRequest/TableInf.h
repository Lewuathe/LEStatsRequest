//
//  TableInf.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableInf : NSObject {
    NSString *identity;
    NSString *statName;
    NSString *govOrg;
    NSString *statisticsName;
    NSString *title;
    NSString *surveyDate;
    
    // For data search API
    NSString *totalNumber;
    NSString *fromNumber;
    NSString *toNumber;
    NSString *nextKey;
    
}

@property (nonatomic) NSString *identity;
@property (nonatomic) NSString *statName;
@property (nonatomic) NSString *govOrg;
@property (nonatomic) NSString *statisticsName;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *surveyDate;

@property (nonatomic) NSString *totalNumber;
@property (nonatomic) NSString *fromNumber;
@property (nonatomic) NSString *toNumber;
@property (nonatomic) NSString *nextKey;

- (void)debug;

@end
