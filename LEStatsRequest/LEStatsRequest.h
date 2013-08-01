//
//  LEStatsRequest.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/24.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseParser.h"


@interface LEStatsRequest : NSObject <ResponseParserDelegate>


+ (NSString*)unfoldParams:(NSDictionary*)params withAppId:(NSString*)appId;

- (LEStatsRequest*)initWithAppId:(NSString*)appId;
- (void)list:(NSDictionary*)params withHandler:(void (^)(StatsResponse*))handler;
- (void)meta:(NSDictionary*)params withHandler:(void (^)(StatsResponse*))handler;
- (void)data:(NSDictionary*)params withHandler:(void (^)(StatsResponse*))handler;


@end
