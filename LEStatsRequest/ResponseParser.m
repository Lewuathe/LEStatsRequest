//
//  ResponseParser.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/25.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ResponseParser.h"



@interface ResponseParser () {
    // Common tag
    BOOL isStatus;
    BOOL isErrorMsg;
    BOOL isDate;
}

@end

@implementation ResponseParser

static NSString *const STATUS_TAG    = @"STATUS";
static NSString *const ERROR_MSG_TAG = @"ERROR_MSG";
static NSString *const DATE_TAG      = @"DATE";

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidStartDocument");
    
    isStatus       = NO;
    isErrorMsg     = NO;
    isDate         = NO;
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidEndDocument");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(@"didStartElement");
    if([elementName isEqualToString:STATUS_TAG]) {
        isStatus = YES;
    }
    else if([elementName isEqualToString:ERROR_MSG_TAG]) {
        isErrorMsg = YES;
    }
    else if([elementName isEqualToString:DATE_TAG]) {
        isDate = YES;
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"didEndDocument");
    if([elementName isEqualToString:STATUS_TAG]) {
        isStatus = NO;
    }
    else if([elementName isEqualToString:ERROR_MSG_TAG]) {
        isErrorMsg = NO;
    }
    else if([elementName isEqualToString:DATE_TAG]) {
        isDate = NO;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"foundCharacters");
    if(isStatus) {
        NSLog(@"STATUS: %@",string);
    }
    else if(isErrorMsg) {
        NSLog(@"ERROR_MSG: %@",string);
    }
    else if(isDate) {
        NSLog(@"DATE: %@", string);
    }
    
}

- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue {
    NSLog(@"foundAttributeDeclarationWithName");
}

@end
