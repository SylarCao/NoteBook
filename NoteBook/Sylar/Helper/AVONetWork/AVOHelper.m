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
    long time0 = [CommonTools GetTime0];
    NSString* slast_upload_time = [[NSUserDefaults standardUserDefaults] objectForKey:kAVOHelperBecomeActiveUploadTime0];
    if (slast_upload_time)
    {
        long last_upload_time = [slast_upload_time integerValue];
        if (time0-last_upload_time > kAVOBecomeActiveInterval)
        {
            [self UploadBecomeActives];
        }
    }
    else
    {
        NSString* stime0 = [NSString stringWithFormat:@"%ld", time0];
        [[NSUserDefaults standardUserDefaults] setObject:stime0 forKey:kAVOHelperBecomeActiveUploadTime0];
        [[NSUserDefaults standardUserDefaults] synchronize];
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
            NSString* time0 = [NSString stringWithFormat:@"%ld", (long)[CommonTools GetTime0]];
            [[NSUserDefaults standardUserDefaults] setObject:time0 forKey:kAVOHelperBecomeActiveUploadTime0];
            [actives removeAllObjects];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }];
}

- (void) AddOneBecomeActiveTime0
{
    long time0 = [CommonTools GetTime0];
    NSString* stime0 = [NSString stringWithFormat:@"%ld", time0];
    NSMutableArray* arr = [[NSUserDefaults standardUserDefaults] objectForKey:kAVOHelperBecomeActiveTimes];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] initWithObjects:stime0, nil];
        [[NSUserDefaults standardUserDefaults] setObject:arr forKey:kAVOHelperBecomeActiveTimes];
        [[NSUserDefaults standardUserDefaults] setObject:stime0 forKey:kAVOHelperBecomeActiveUploadTime0];
    }
    else
    {
        [arr addObject:stime0];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
