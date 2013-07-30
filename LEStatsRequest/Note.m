//
//  Note.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/28.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize noteChar;
@synthesize n;

- (void)debug{
    NSLog(@"--------- Note ----------");
    NSLog(@"noteChar: %@", noteChar);
    NSLog(@"n: %@",n);
}
@end
