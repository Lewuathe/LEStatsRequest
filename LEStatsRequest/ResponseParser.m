//
//  ResponseParser.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/25.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ResponseParser.h"

#define THIS_TAG(TAG_NAME) [elementName isEqualToString:TAG_NAME]

@interface ResponseParser () {
    id _typeObject;
    ApiType _type;
    
    // Common tag
    BOOL isStatus;
    BOOL isErrorMsg;
    BOOL isDate;
    
    // List API response tag
    BOOL isListInf;
    BOOL isStatName;
    BOOL isGovOrg;
    BOOL isStatisticsName;
    BOOL isTitle;
    BOOL isCycle;
    BOOL isSurveyDate;
    BOOL isOpenDate;
    BOOL isSmallArea;
    // List API response object
    NSMutableArray *_listInfList;
    ListInf *_currentListInf;
    
}

@end

@implementation ResponseParser

static NSString *const STATUS_TAG    = @"STATUS";
static NSString *const ERROR_MSG_TAG = @"ERROR_MSG";
static NSString *const DATE_TAG      = @"DATE";

// List API response tag name
static NSString *const LIST_INF_TAG        = @"LIST_INF";
static NSString *const STAT_NAME_TAG       = @"STAT_NAME";
static NSString *const GOV_ORG_TAG         = @"GOV_ORG";
static NSString *const STATISTICS_NAME_TAG = @"STATISTICS_NAME";
static NSString *const TITLE_TAG           = @"TITLE";
static NSString *const CYCLE_TAG           = @"CYCLE";
static NSString *const SURVEY_DATE_TAG     = @"SURVEY_DATE";
static NSString *const OPEN_DATE_TAG       = @"OPEN_DATE";
static NSString *const SMALL_AREA_TAG      = @"SMALL_AREA";

- (ResponseParser*)initWithType:(ApiType)type {
    self = [super init];
    if (self != nil) {
        // Setting api type, list meta and data.
        _type = type;
    }
    return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
//    NSLog(@"parserDidStartDocument");
    
    isStatus       = NO;
    isErrorMsg     = NO;
    isDate         = NO;
    
    switch (_type) {
        case LIST:
            _listInfList = [NSMutableArray array];
            break;
        default:
            break;
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
//    NSLog(@"parserDidEndDocument");
    NSLog(@"count: %d",[_listInfList count]);
    [[_listInfList objectAtIndex:0] debug];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
//    NSLog(@"didStartElement");
    if(THIS_TAG(STATUS_TAG)) {
        isStatus = YES;
    }
    else if(THIS_TAG(ERROR_MSG_TAG)) {
        isErrorMsg = YES;
    }
    else if(THIS_TAG(DATE_TAG)) {
        isDate = YES;
    }
    
    switch (_type) {
        case LIST:
            if (THIS_TAG(LIST_INF_TAG)) {
                // Start LIST_INF element
                isListInf = YES;
                _currentListInf = [[ListInf alloc] init];
                // Set data set id previously
                _currentListInf.identity = [attributeDict objectForKey:@"id"];
            }
            else if (THIS_TAG(STAT_NAME_TAG)) {
                isStatName = YES;
            }
            else if (THIS_TAG(GOV_ORG_TAG)) {
                isGovOrg = YES;
            }
            else if (THIS_TAG(STATISTICS_NAME_TAG)) {
                isStatisticsName = YES;
            }
            else if (THIS_TAG(TITLE_TAG)) {
                isTitle = YES;
            }
            else if (THIS_TAG(CYCLE_TAG)) {
                isCycle = YES;
            }
            else if (THIS_TAG(SURVEY_DATE_TAG)) {
                isSurveyDate = YES;
            }
            else if (THIS_TAG(OPEN_DATE_TAG)) {
                isOpenDate = YES;
            }
            else if (THIS_TAG(SMALL_AREA_TAG)) {
                isSmallArea = YES;
            }
            break;
            
        default:
            break;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
//    NSLog(@"didEndDocument");
    if(THIS_TAG(STATUS_TAG)) {
        isStatus = NO;
    }
    else if(THIS_TAG(ERROR_MSG_TAG)) {
        isErrorMsg = NO;
    }
    else if(THIS_TAG(DATE_TAG)) {
        isDate = NO;
    }
    
    switch (_type) {
            // In the case of List API
        case LIST:
            if (THIS_TAG(LIST_INF_TAG)) {
                isListInf = NO;
                [_listInfList addObject:_currentListInf];
            }
            else if (THIS_TAG(STAT_NAME_TAG)) {
                isStatName = NO;
            }
            else if (THIS_TAG(GOV_ORG_TAG)) {
                isGovOrg = NO;
            }
            else if (THIS_TAG(STATISTICS_NAME_TAG)) {
                isStatisticsName = NO;
            }
            else if (THIS_TAG(TITLE_TAG)) {
                isTitle = NO;
            }
            else if (THIS_TAG(CYCLE_TAG)) {
                isCycle = NO;
            }
            else if (THIS_TAG(SURVEY_DATE_TAG)) {
                isSurveyDate = NO;
            }
            else if (THIS_TAG(OPEN_DATE_TAG)) {
                isOpenDate = NO;
            }
            else if (THIS_TAG(SMALL_AREA_TAG)) {
                isSmallArea = NO;
            }
            break;
            
        default:
            break;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//    NSLog(@"foundCharacters");
    if(isStatus) {
        NSLog(@"STATUS: %@",string);
    }
    else if(isErrorMsg) {
        NSLog(@"ERROR_MSG: %@",string);
    }
    else if(isDate) {
        NSLog(@"DATE: %@", string);
    }
    
    switch (_type) {
        case LIST:
            if (isListInf) {
                if (isStatName) {
                    _currentListInf.statName = string;
                }
                else if (isGovOrg) {
                    _currentListInf.govOrg = string;
                }
                else if (isStatisticsName) {
                    _currentListInf.statisticsName = string;
                }
                else if (isTitle) {
                    _currentListInf.title = string;
                }
                else if (isCycle) {
                    _currentListInf.cycle = string;
                }
                else if (isSurveyDate) {
                    _currentListInf.surveyDate = string;
                }
                else if (isOpenDate) {
                    _currentListInf.openDate = string;
                }
                else if (isSmallArea) {
                    _currentListInf.smallArea = string;
                }
            }
            break;
            
        default:
            break;
    }
}

- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue {
//    NSLog(@"foundAttributeDeclarationWithName");

}

@end
