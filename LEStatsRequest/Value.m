//
//  Value.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/28.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "Value.h"

@implementation Value

@synthesize tab;
@synthesize cat01;
@synthesize cat02;
@synthesize cat03;
@synthesize cat04;
@synthesize cat05;
@synthesize cat06;
@synthesize cat07;
@synthesize cat08;
@synthesize cat09;
@synthesize cat10;
@synthesize cat11;
@synthesize cat12;
@synthesize cat13;
@synthesize cat14;
@synthesize cat15;
@synthesize area;
@synthesize time;
@synthesize unit;
@synthesize v;

- (void)debug{
    NSLog(@"---------- Value ------------");
    NSLog(@"tab: %@",tab);
    NSLog(@"cat01: %@", cat01);
    NSLog(@"area: %@",area);
    NSLog(@"time: %@", time);
    NSLog(@"unit: %@",unit);
    NSLog(@"v: %@",v);
}

@end
