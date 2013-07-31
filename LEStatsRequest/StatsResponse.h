//
//  StatsResponse.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/31.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseParser.h"
#import "ListInf.h"
#import "TableInf.h"
#import "ClassInf.h"
#import "DataInf.h"


@interface StatsResponse : NSObject {
    NSInteger type;
    NSString *status;
    NSString *errorMsg;
    NSString *date;
    
    // List API response object
    NSArray *listListInf;
    
    // Meta API response object
    TableInf *metaTableInf;
    ClassInf *metaClassInf;
    
    TableInf *dataTableInf;
    ClassInf *dataClassInf;
    DataInf  *dataDataInf;
    
}

@property (nonatomic) NSInteger type;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *errorMsg;
@property (nonatomic) NSString *date;

@property (nonatomic) NSArray *listListInf;
@property (nonatomic) TableInf *metaTableInf;
@property (nonatomic) ClassInf *metaClassInf;
@property (nonatomic) TableInf *dataTableInf;
@property (nonatomic) ClassInf *dataClassInf;
@property (nonatomic) DataInf  *dataDataInf;

- (StatsResponse*)initWithType:(NSInteger)apiType;

@end
