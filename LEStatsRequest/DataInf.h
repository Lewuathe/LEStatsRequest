//
//  DataInf.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/28.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "Value.h"

@interface DataInf : NSObject{
    NSArray *noteList;
    NSArray *valueList;
}

@property (nonatomic) NSArray *noteList;
@property (nonatomic) NSArray *valueList;

- (NSArray*)appendNoteList:(Note*)note;
- (NSArray*)appendValueList:(Value*)value;


@end
