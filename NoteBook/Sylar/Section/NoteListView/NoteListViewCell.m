//
//  NoteListViewCell.m
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
//////////////////////////////////////////////////////
#import "NoteListViewCell.h"
//////////////////////////////////////////////////////
const NSString* c_note_list_view_cell_id = @"c_note_list_view_cell_id";
//////////////////////////////////////////////////////
@interface NoteListViewCell()
{
    UILabel *m_title;
}
@end
//////////////////////////////////////////////////////
@implementation NoteListViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self SetInitialValue];
    }
    return self;
}

+ (NSString *) GetCellId
{
    NSString *rt = @"c_note_list_view_cell_id";
    return rt;
}

- (void) SetInitialValue
{
    m_title = [[UILabel alloc] init];
    m_title.frame = self.contentView.bounds;
    m_title.backgroundColor = [UIColor greenColor];
    m_title.text = @"text";
    m_title.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:m_title];
}


- (void) SetWithTitle:(NSString *)_labelTitle
{
    m_title.text = _labelTitle;
}



@end
