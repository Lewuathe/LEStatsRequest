//
//  DataInf.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/28.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "DataInf.h"

@interface DataInf(){
    NSMutableArray *_noteList;
    NSMutableArray *_valueList;
}

@end

@implementation DataInf

@synthesize noteList;
@synthesize valueList;

- (DataInf*)init {
    self = [super init];
    if (self != nil) {
        _noteList = [NSMutableArray array];
        _valueList = [NSMutableArray array];
    }
    return self;
}

- (NSArray*)appendNoteList:(Note *)note {
    [_noteList addObject:note];
    noteList = _noteList;
    return noteList;
}

- (NSArray*)appendValueList:(Value *)value {
    [_valueList addObject:value];
    valueList = _valueList;
    return valueList;
}

@end
