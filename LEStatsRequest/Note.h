//
//  Note.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/28.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject {
    NSString *noteChar;
    
    NSString *n;
}

@property (nonatomic) NSString *noteChar;
@property (nonatomic) NSString *n;

- (void)debug;


@end
