//
//  ItemModel.m
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
//////////////////////////////////////////////////////////////////
#import "ItemModel.h"
//////////////////////////////////////////////////////////////////
@interface ItemModel()
{
    NSString* m_title_on_list;
}
@end
//////////////////////////////////////////////////////////////////
@implementation ItemModel

- (id) init
{
    self = [super init];
    if (self)
    {
        m_title_on_list = @"12345";
    }
    return self;
}

- (NSString*) titleOnNoteList
{
    NSString* rt = [NSString stringWithFormat:@"abc+%@", m_title_on_list];
    return rt;
}

@end
