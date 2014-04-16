//
//  SettingFontSizeCell.m
//  NoteBook
//
//  Created by Sylar on 4/15/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////
#import "SettingFontSizeCell.h"
////////////////////////////////////////////////////////////////
@implementation SettingFontSizeCell

+ (NSString *) GetCellId
{
    NSString *rt = @"SettingFontSizeCell_id";
    return rt;
}
//
//- (void)awakeFromNib
//{
//    [super awakeFromNib];
//    [self SetInitialValue];
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//}
//
//- (void) SetInitialValue
//{
//    // segment
//    [m_seg_font_size setTitle:LocalizedString(@"Small") forSegmentAtIndex:0];
//    [m_seg_font_size setTitle:LocalizedString(@"Middle") forSegmentAtIndex:1];
//    [m_seg_font_size setTitle:LocalizedString(@"Big") forSegmentAtIndex:2];
//    [m_seg_font_size addTarget:self action:@selector(FontChange:) forControlEvents:UIControlEventValueChanged];
//    enSettingFontSize font_size = [[SettingHelper Share] GetFontSize];
//    m_seg_font_size.selectedSegmentIndex = [self ConvertFontSizeToSegmentIndex:font_size];
//    
//    
//    // label
//    m_label_font_size.text = LocalizedString(@"SettingFontSize");
//}
//
//- (void) FontChange:(UISegmentedControl *)segment
//{
//    int index = segment.selectedSegmentIndex;
//    [[SettingHelper Share] SetFontSize:[self ConvertSegmentIndexToFontSize:index]];
//}
//
//- (enSettingFontSize) ConvertSegmentIndexToFontSize:(int)index
//{
//    enSettingFontSize rt = en_setting_font_size_middle;
//    if (index == 0)
//    {
//        rt = en_setting_font_size_small;
//    }
//    else if (index == 1)
//    {
//        rt = en_setting_font_size_middle;
//    }
//    else if (index == 2)
//    {
//        rt = en_setting_font_size_big;
//    }
//    return rt;
//}
//
//- (int) ConvertFontSizeToSegmentIndex:(enSettingFontSize)fontSize
//{
//    int rt = 1;
//    if (fontSize == en_setting_font_size_small)
//    {
//        rt = 0;
//    }
//    else if (fontSize == en_setting_font_size_middle)
//    {
//        rt = 1;
//    }
//    else if (fontSize == en_setting_font_size_big)
//    {
//        rt = 2;
//    }
//    return rt;
//}




@end
