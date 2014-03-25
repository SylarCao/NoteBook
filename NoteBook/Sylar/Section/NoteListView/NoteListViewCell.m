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
    UILabel* m_test_label;
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

- (void) SetInitialValue
{
    static int i=0;
    i++;
    NSLog(@"\n i = %d", i);
    
    [self setBackgroundColor:[UIColor greenColor]];
    
    m_test_label = [[UILabel alloc] init];
    [m_test_label setFrame:self.bounds];
    [self addSubview:m_test_label];
    [m_test_label setText:[NSString stringWithFormat:@"%d", i]];

}


- (void) SetTest
{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
