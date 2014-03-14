//
//  CommonTools.m
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools

+ (NSTimeInterval) GetTime0
{
    NSDate* start = [NSDate date];
    NSTimeInterval rt = [start timeIntervalSince1970];
    return rt;
}

@end
