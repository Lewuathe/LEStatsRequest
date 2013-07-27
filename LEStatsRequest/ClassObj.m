//
//  ClassObj.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ClassObj.h"

@interface ClassObj () {
    NSMutableArray *_classMetaList;
}

@end

@implementation ClassObj

@synthesize identity;
@synthesize name;
@synthesize description;

- (ClassObj*)init {
    self = [super init];
    if (self != nil) {
        _classMetaList = [NSMutableArray array];
    }
    return self;
}

- (NSArray*)appendClassMeta:(ClassMeta *)classMeta {
    [_classMetaList addObject:classMeta];
    
    // Convert to immutable class for user
    classMetaList = _classMetaList;
    
    return classMetaList;
}


- (void)debug {
    NSLog(@"------ ClassObj ---------");
    NSLog(@"identity: %@",identity);
    NSLog(@"name: %@",name);
    NSLog(@"description: %@",description);
}

@end
