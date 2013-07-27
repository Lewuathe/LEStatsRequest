//
//  ClassInf.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ClassInf.h"

@interface ClassInf (){
    NSMutableArray *_classObjList;
}

@end

@implementation ClassInf

- (ClassInf*)init{
    self = [super init];
    if (self != nil) {
        _classObjList = [NSMutableArray array];
    }
    return self;
}

- (NSArray*)appendClassObj:(ClassObj *)classObj{
    [_classObjList addObject:classObj];
    classObjList = _classObjList;
    return classObjList;
}

@end
