//
//  AVOHelper.h
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVODefines.h"

@interface AVOHelper : NSObject

+ (instancetype) Share;

- (void) RegisterIfNot;

- (void) UploadBecomeActivesIfNeed;

@end




/*
 
 last_login_time    :     object of NSDate
 
 become_active_time :     array of NSString (@{"string1", "string2", ...})
 
 
 
 
 */
