//
//  ClassMeta.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassMeta : NSObject{
    NSString *code;
    NSString *name;
    NSString *level;
    NSString *unit;
    NSString *addInfo;
}

@property (nonatomic) NSString *code;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *level;
@property (nonatomic) NSString *unit;
@property (nonatomic) NSString *addInfo;

- (void)debug;

@end
