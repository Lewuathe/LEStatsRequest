//
//  StatsResponse.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/31.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "StatsResponse.h"

@implementation StatsResponse

@synthesize type;
@synthesize status;
@synthesize errorMsg;
@synthesize date;

@synthesize listListInf;
@synthesize metaClassInf;
@synthesize metaTableInf;
@synthesize dataClassInf;
@synthesize dataDataInf;
@synthesize dataTableInf;

- (StatsResponse*)initWithType:(NSInteger)apiType {
    self = [super init];
    if (self != nil) {
        self.type = apiType;
    }
    return self;
}

@end
