//
//  LEStatsRequest.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/24.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "LEStatsRequest.h"
#import "R9HTTPRequest.h"

@interface LEStatsRequest (){
    NSString *_appId;
}

@end

@implementation LEStatsRequest

static NSString *const host             = @"statdb.nstac.go.jp";
static NSString *const getStatsListPath = @"/api/1.0b/app/getStatsList";
static NSString *const getMetaInfoPath  = @"/api/1.0b/app/getMetaInfo";
static NSString *const getStatsDataPath = @"/api/1.0b/app/getStatsData";

- (LEStatsRequest*)initWithAppId:(NSString *)appId{
    self = [super init];
    if (self != nil) {
        _appId = appId;
    }
    return self;
}

+ (NSString*)unfoldParams:(NSDictionary*)params withAppId:(NSString*)appId {
    NSString *appIdString = [NSString stringWithFormat:@"?appId=%@",appId];
    NSMutableString *paramString = [NSMutableString string];
    [paramString appendString:appIdString];
    
    NSArray *keys = [params allKeys];
    for (int i = 0; i < [keys count]; i++) {
        NSString *param;
        NSString *key   = [keys objectAtIndex:i];
        NSString *value = [params objectForKey:key];
        param = [NSString stringWithFormat:@"&%@=%@", key, value];
        [paramString appendString:param];
    }
    return paramString;
}

- (void)list:(NSDictionary *)params{
    NSString *paramString = [LEStatsRequest unfoldParams:params withAppId:_appId];
    NSString *url = [NSString stringWithFormat:@"http://%@%@%@", host, getStatsListPath, paramString];
    NSLog(@"Test url: %@", url);
    R9HTTPRequest *request = [[R9HTTPRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setTimeoutInterval:360];
    [request setFailedHandler:^(NSError *error){
        NSLog(@"Error: %@", error);
    }];
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        NSLog(@"Success: %@", responseString);
    }];
   [request startRequest];
}

- (void)meta:(NSDictionary *)params{
    
}

- (void)search:(NSDictionary *)params{
    
}

@end
