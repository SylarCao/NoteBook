//
//  SettingPasswordCell.m
//  NoteBook
//
//  Created by Sylar on 4/15/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
////////////////////////////////////////////////////////////
#import "SettingPasswordCell.h"
#import "CommonTools.h"
#import "SettingHelper.h"
////////////////////////////////////////////////////////////
@interface SettingPasswordCell()
{
    IBOutlet UILabel   *m_label;
    IBOutlet UISwitch  *m_switch;
}
@end
////////////////////////////////////////////////////////////
@implementation SettingPasswordCell

+ (NSString *) GetCellId
{
    NSString *rt = @"SettingPasswordCell_id";
    return rt;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self SetInitialValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) SetInitialValue
{
    // label
    m_label.text = LocalizedString(@"PasswordOn");
    
    // switch
    m_switch.on = [[SettingHelper Share] CheckPasswordOn];
    [m_switch addTarget:self action:@selector(PasswordChange:) forControlEvents:UIControlEventValueChanged];
}

- (void) PasswordChange:(UISwitch *)switcher
{
    BOOL on_off = switcher.isOn;
    [[SettingHelper Share] SetPasswordOnOff:on_off];
}

@end
