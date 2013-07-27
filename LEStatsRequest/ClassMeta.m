//
//  ClassMeta.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "ClassMeta.h"

@implementation ClassMeta 

@synthesize code;
@synthesize name;
@synthesize level;
@synthesize unit;
@synthesize addInfo;


- (void)debug {
    NSLog(@"--------- ClassMeta -----------");
    NSLog(@"code: %@",code);
    NSLog(@"name: %@",name);
    NSLog(@"level: %@",level);
    NSLog(@"unit: %@",unit);
    NSLog(@"addInfo: %@",addInfo);
}

@end
