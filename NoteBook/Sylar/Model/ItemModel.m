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
    
}
@end
//////////////////////////////////////////////////////////////////
@implementation ItemModel

- (id) init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void) setTitle:(NSString *)title
{
    if (!_titleOnNoteList)
    {
        _titleOnNoteList = title.copy;
    }
    _title = title;
}


@end
