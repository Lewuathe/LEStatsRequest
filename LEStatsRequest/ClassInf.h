//
//  ClassInf.h
//  LEStatsRequest
//
//  Created by Sasaki Kai on 2013/07/27.
//  Copyright (c) 2013年 Sasaki Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassObj.h"

@interface ClassInf : NSObject {
    NSArray *classObjList;
}

@property (nonatomic) NSArray *classObjList;

- (NSArray*)appendClassObj:(ClassObj*)classObj;

@end
