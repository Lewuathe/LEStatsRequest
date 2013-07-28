//
//  ResponseParser.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/25.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListInf.h"
#import "TableInf.h"

#import "ClassInf.h"
#import "ClassObj.h"
#import "ClassMeta.h"


typedef enum ApiType :NSInteger{
    LIST,
    META,
    DATA
} ApiType;

@interface ResponseParser : NSObject <NSXMLParserDelegate> {
    NSArray *listInfList;
}

- (ResponseParser*)initWithType:(ApiType)type;

@end
