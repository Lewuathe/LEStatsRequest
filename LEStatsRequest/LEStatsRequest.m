//
//  LEStatsRequest.m
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/24.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import "LEStatsRequest.h"
#import "ResponseParser.h"

typedef void(^LEResponseHandler)(StatsResponse*);

@interface LEStatsRequest (){
    NSString *_appId;
    ResponseParser *_responseParser;
    LEResponseHandler _responseHandler;
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

- (void)list:(NSDictionary *)params withHandler:(void (^)(StatsResponse *))handler{
    _responseHandler = handler;
    NSString *paramString = [LEStatsRequest unfoldParams:params withAppId:_appId];
    NSString *url = [NSString stringWithFormat:@"http://%@%@%@", host, getStatsListPath, paramString];

    _responseParser = [[ResponseParser alloc] initWithType:LIST];
    _responseParser.delegate = self;
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    [parser setDelegate:_responseParser];
    [parser parse];
    
}

- (void)meta:(NSDictionary *)params withHandler:(void (^)(StatsResponse *))handler{
    _responseHandler = handler;
    NSString *paramString = [LEStatsRequest unfoldParams:params withAppId:_appId];
    NSString *url = [NSString stringWithFormat:@"http://%@%@%@", host, getMetaInfoPath, paramString];
    
    _responseParser = [[ResponseParser alloc] initWithType:META];
    _responseParser.delegate = self;
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    [parser setDelegate:_responseParser];
    [parser parse];
    
}

- (void)data:(NSDictionary *)params withHandler:(void (^)(StatsResponse *))handler{
    _responseHandler = handler;
    NSString *paramString = [LEStatsRequest unfoldParams:params withAppId:_appId];
    NSString *url = [NSString stringWithFormat:@"http://%@%@%@", host, getStatsDataPath, paramString];
    
    _responseParser = [[ResponseParser alloc] initWithType:DATA];
    _responseParser.delegate = self;
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    [parser setDelegate:_responseParser];
    [parser parse];
}


- (void)parseDidFinished:(StatsResponse *)response {

    _responseHandler(response);
}


@end
