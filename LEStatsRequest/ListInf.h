//
//  ListInf.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/26.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListInf : NSObject {
    NSString *identity;
    NSString *statName;
    NSString *govOrg;
    NSString *statisticsName;
    NSString *title;
    NSString *cycle;
    NSString *surveyDate;
    NSString *openDate;
    NSString *smallArea;
}

@property (nonatomic) NSString *identity;
@property (nonatomic) NSString *statName;
@property (nonatomic) NSString *govOrg;
@property (nonatomic) NSString *statisticsName;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *cycle;
@property (nonatomic) NSString *surveyDate;
@property (nonatomic) NSString *openDate;
@property (nonatomic) NSString *smallArea;


- (void)debug;

@end
