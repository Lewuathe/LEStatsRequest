//
//  ResponseParser.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/25.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ResponseParser.h"


#define THIS_TAG(TAG_NAME) [elementName isEqualToString:TAG_NAME]
#define GET_ATTRIB(ATTRIB_NAME) [ResponseParser getAttrib:attributeDict withName:ATTRIB_NAME]

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
    
    // Meta API response object
    BOOL isTableInf;
    BOOL isClassObj;
    BOOL isClass;
    NSMutableArray *_metaInfList;
    TableInf *_metaTableInf;
    ClassInf *_metaClassInf;
    ClassObj *_currentClassObj;
    ClassMeta *_currentClassMeta;
    
    // Data API response object
    BOOL isTotalNumber;
    BOOL isFromNumber;
    BOOL isToNumber;
    BOOL isNextKey;
    BOOL isDataInf;
    BOOL isNote;
    BOOL isValue;
    TableInf *_dataTableInf;
    ClassInf *_dataClassInf;
    DataInf  *_dataDataInf;
    
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

// Meta API response tag name
static NSString *const TABLE_INF_TAG       = @"TABLE_INF";
static NSString *const CLASS_INF_TAG       = @"CLASS_INF";
static NSString *const CLASS_OBJ_TAG       = @"CLASS_OBJ";
static NSString *const CLASS_TAG           = @"CLASS";
// Meta API response attribute name
static NSString *const ATTRIB_IDENTITY     = @"id";
static NSString *const ATTRIB_NAME         = @"name";
static NSString *const ATTRIB_DESCRIPTION  = @"description";
static NSString *const ATTRIB_CODE         = @"code";
static NSString *const ATTRIB_LEVEL        = @"level";
static NSString *const ATTRIB_UNIT         = @"unit";
static NSString *const ATTRIB_ADDINFO      = @"addInfo";

// Data API response tag name
static NSString *const TOTAL_NUMBER_TAG    = @"TOTAL_TAG";
static NSString *const FROM_NUMBER_TAG     = @"FROM_NUMBER";
static NSString *const TO_NUMBER_TAG       = @"TO_NUMBER";
static NSString *const NEXT_KEY_TAG        = @"NEXT_KEY";
static NSString *const DATA_INF_TAG        = @"DATA_INF";
static NSString *const NOTE_TAG            = @"NOTE";
static NSString *const VALUE_TAG           = @"VALUE";



- (ResponseParser*)initWithType:(ApiType)type {
    self = [super init];
    if (self != nil) {
        // Setting api type, list meta and data.
        _type = type;
    }
    return self;
}

+ (NSString*)getAttrib:(NSDictionary*)dictionary withName:(NSString*)name {
    if ([[dictionary allKeys] containsObject:name]) {
        return [dictionary objectForKey:name];
    }
    else {
        return @"-";
    }
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
        case META:
            _metaTableInf = [[TableInf alloc] init];
            _metaClassInf = [[ClassInf alloc] init];
            break;
        case DATA:
            _dataTableInf = [[TableInf alloc] init];
            _dataClassInf = [[ClassInf alloc] init];
            _dataDataInf  = [[DataInf alloc] init];
            break;
        default:
            break;
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
//    NSLog(@"parserDidEndDocument");
    /*
    for (int i = 0; i < [_listInfList count]; i++) {
        [[_listInfList objectAtIndex:i] debug];
    }
     */
    
    /*
    for (int i = 0; i < [_metaClassInf.classObjList count]; i++) {
        ClassObj *tmp = [_metaClassInf.classObjList objectAtIndex:i];
        for (int j = 0; j < [tmp.classMetaList count]; j++) {
            [[tmp.classMetaList objectAtIndex:j] debug];
        }
    }
     */

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
    
    
    // Respective API tags
    switch (_type) {
        case LIST:
            if (THIS_TAG(LIST_INF_TAG)) {
                // Start LIST_INF element
                isListInf = YES;
                _currentListInf = [[ListInf alloc] init];
                // Set data set id previously
                _currentListInf.identity = GET_ATTRIB(ATTRIB_IDENTITY);
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
            
        case META:
            if (THIS_TAG(TABLE_INF_TAG)) {
                isTableInf = YES;
                _metaTableInf.identity = GET_ATTRIB(ATTRIB_IDENTITY);
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
            else if (THIS_TAG(SURVEY_DATE_TAG)) {
                isSurveyDate = YES;
            }
            else if (THIS_TAG(CLASS_OBJ_TAG)) {
                isClassObj = YES;
                _currentClassObj = [[ClassObj alloc] init];
                _currentClassObj.identity    = GET_ATTRIB(ATTRIB_IDENTITY);
                _currentClassObj.name        = GET_ATTRIB(ATTRIB_NAME);
                _currentClassObj.description = GET_ATTRIB(ATTRIB_DESCRIPTION);
            }
            else if (THIS_TAG(CLASS_TAG)) {
                isClass = YES;
                _currentClassMeta = [[ClassMeta alloc] init];
                _currentClassMeta.code    = GET_ATTRIB(ATTRIB_CODE);
                _currentClassMeta.name    = GET_ATTRIB(ATTRIB_NAME);
                _currentClassMeta.level   = GET_ATTRIB(ATTRIB_LEVEL);
                _currentClassMeta.unit    = GET_ATTRIB(ATTRIB_UNIT);
                _currentClassMeta.addInfo = GET_ATTRIB(ATTRIB_ADDINFO);
            }
            break;
        case DATA:
            if (THIS_TAG(TABLE_INF_TAG)) {
                isTableInf = YES;
                _dataTableInf.identity = GET_ATTRIB(ATTRIB_IDENTITY);
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
            else if (THIS_TAG(SURVEY_DATE_TAG)) {
                isSurveyDate = YES;
            }
            else if (THIS_TAG(TOTAL_NUMBER_TAG)) {
                isTotalNumber = YES;
            }
            else if (THIS_TAG(TO_NUMBER_TAG)) {
                isToNumber = YES;
            }
            else if (THIS_TAG(FROM_NUMBER_TAG)) {
                isFromNumber = YES;
            }
            else if (THIS_TAG(NEXT_KEY_TAG)) {
                isNextKey = YES;
            }
            else if (THIS_TAG(CLASS_OBJ_TAG)) {
                isClassObj = YES;
                _currentClassObj = [[ClassObj alloc] init];
                _currentClassObj.identity    = GET_ATTRIB(ATTRIB_IDENTITY);
                _currentClassObj.name        = GET_ATTRIB(ATTRIB_NAME);
                _currentClassObj.description = GET_ATTRIB(ATTRIB_DESCRIPTION);
            }
            else if (THIS_TAG(CLASS_TAG)) {
                isClass = YES;
                _currentClassMeta = [[ClassMeta alloc] init];
                _currentClassMeta.code    = GET_ATTRIB(ATTRIB_CODE);
                _currentClassMeta.name    = GET_ATTRIB(ATTRIB_NAME);
                _currentClassMeta.level   = GET_ATTRIB(ATTRIB_LEVEL);
                _currentClassMeta.unit    = GET_ATTRIB(ATTRIB_UNIT);
                _currentClassMeta.addInfo = GET_ATTRIB(ATTRIB_ADDINFO);
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
        case META:
            if (THIS_TAG(TABLE_INF_TAG)) {
                isTableInf = NO;
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
            else if (THIS_TAG(SURVEY_DATE_TAG)) {
                isSurveyDate = NO;
            }
            else if (THIS_TAG(CLASS_OBJ_TAG)) {
                isClassObj = NO;
                [_metaClassInf appendClassObj:_currentClassObj];
            }
            else if (THIS_TAG(CLASS_TAG)) {
                isClass = NO;
                [_currentClassObj appendClassMeta:_currentClassMeta];
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
        case META:
            if (isTableInf) {
                if (isStatName) {
                    _metaTableInf.statName = string;
                }
                else if (isGovOrg) {
                    _metaTableInf.govOrg = string;
                }
                else if (isStatisticsName) {
                    _metaTableInf.statisticsName = string;
                }
                else if (isTitle) {
                    _metaTableInf.title = string;
                }
                else if (isSurveyDate) {
                    _currentListInf.surveyDate = string;
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
