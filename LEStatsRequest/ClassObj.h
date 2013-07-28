//
//  ClassObj.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassMeta.h"

@interface ClassObj : NSObject {
    NSArray *classMetaList;
    
    NSString *identity;
    NSString *name;
    NSString *description;
}

@property (nonatomic) NSString *identity;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *description;

- (NSArray*)appendClassMeta:(ClassMeta*)classMeta;
- (void)debug;

@end
