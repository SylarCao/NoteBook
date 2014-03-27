//
//  AVOHelper.m
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
//////////////////////////////////////////////////////////////////////////////
#import "AVOHelper.h"
#import "OpenUDID.h"
#import "CommonTools.h"
//////////////////////////////////////////////////////////////////////////////
# define kAVOHelperBecomeActiveTimes         @"kAVOHelperBecomeActiveTimes"
# define kAVOHelperBecomeActiveUploadTime0   @"kAVOHelperBecomeActiveUploadTime0"
# define kAVOBecomeActiveInterval            3600
//////////////////////////////////////////////////////////////////////////////
@interface AVOHelper()
{
    NSString* m_udid;
}
@end
//////////////////////////////////////////////////////////////////////////////
@implementation AVOHelper

+ (instancetype) Share
{
    static AVOHelper* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AVOHelper alloc] init];
    });
    return instance;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        m_udid = [OpenUDID value];
    }
    return self;
}

- (void) RegisterIfNot
{
    AVQuery* qqq = [AVQuery queryWithClassName:@"CUser"];
    [qqq whereKey:@"UDID" equalTo:m_udid];
    [qqq findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if ((!error) && (objects.count == 0))
        {
            [self RegisterWithUdid];
        }
    }];
}

- (void) RegisterWithUdid
{
    AVObject* obj = [AVObject objectWithClassName:@"CUser"];
    [obj setObject:m_udid forKey:@"UDID"];
    [obj saveEventually:nil];
}

- (void) UploadBecomeActivesIfNeed
{
    [self AddOneBecomeActiveTime0];
    NSDate* last_upload_time = [[NSUserDefaults standardUserDefaults] objectForKey:kAVOHelperBecomeActiveUploadTime0];
    if (last_upload_time)
    {
        if (abs([last_upload_time timeIntervalSinceDate:[NSDate date]]) > kAVOBecomeActiveInterval)
        {
            [self UploadBecomeActives];
        }
    }
}

- (void) UploadBecomeActives
{
    AVObject* obj = [AVObject objectWithClassName:@"CUserBecomeActive"];
    [obj setObject:m_udid forKey:@"UDID"];
    NSMutableArray* actives = [[NSUserDefaults standardUserDefaults] objectForKey:kAVOHelperBecomeActiveTimes];
    [obj setObject:actives forKey:@"ActiveTimes"];
    [obj saveEventually:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:kAVOHelperBecomeActiveUploadTime0];
            [actives removeAllObjects];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }];
}

- (void) AddOneBecomeActiveTime0
{
    NSDate *now = [NSDate date];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arr = [user objectForKey:kAVOHelperBecomeActiveTimes];
    if (arr)
    {
        [arr addObject:[CommonTools GetStringFromDate:now]];
    }
    else
    {
        arr = [[NSMutableArray alloc] initWithObjects:[CommonTools GetStringFromDate:now], nil];
        [user setObject:arr forKey:kAVOHelperBecomeActiveTimes];
        [user setObject:now forKey:kAVOHelperBecomeActiveUploadTime0];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
