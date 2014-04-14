//
//  ReminderViewCell.m
//  NoteBook
//
//  Created by Sylar on 4/4/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
///////////////////////////////////////////////////////////////
#import "ReminderViewCell.h"
#import "ReminderHelper.h"
#import "CommonTools.h"
#import "CommonActionSheet.h"
///////////////////////////////////////////////////////////////
@interface ReminderViewCell()
{
    IBOutlet UIImageView *m_red_dot;
    IBOutlet UILabel     *m_title;
    UILocalNotification  *m_local_notification;
}
@end
///////////////////////////////////////////////////////////////
@implementation ReminderViewCell

+ (NSString *) GetCellId
{
    NSString *rt = @"ReminderViewCell_id";
    return rt;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self SetInitialValue];
}

- (NSArray *) SetRightButtons
{
    NSMutableArray *rt = [[NSMutableArray alloc] init];
    [rt sw_addUtilityButtonWithColor:[UIColor darkGrayColor] title:LocalizedString(@"Done")];
    [rt sw_addUtilityButtonWithColor:[UIColor redColor] title:LocalizedString(@"Delete")];
    return rt;
}

- (void) SetInitialValue
{
    m_red_dot.hidden = YES;
}

- (void) SetWithData:(UILocalNotification *)notification
{
    m_local_notification = notification;
    
    // title
    m_title.text = [notification.userInfo objectForKey:kReminderTitle];
    
    //red dot
    BOOL start = [ReminderHelper CheckNotificationBegin:notification];
    BOOL done = [ReminderHelper CheckNotificationDone:notification];
    BOOL hide = (!start) || done;
    m_red_dot.hidden = hide;
}

- (void) HideRedDot
{
    m_red_dot.hidden = YES;
}

- (void) SwapDone
{
    if ([ReminderHelper CheckNotificationBegin:m_local_notification] && (![ReminderHelper CheckNotificationDone:m_local_notification]))
    {
        UILocalNotification *new_noti = m_local_notification.copy;
        NSMutableDictionary *user_info = [m_local_notification.userInfo mutableCopy];
        [user_info setObject:@"1" forKey:kReminderDone];
        new_noti.userInfo = user_info;
        new_noti.repeatInterval = NSCalendarUnitYear;
        [[UIApplication sharedApplication] cancelLocalNotification:m_local_notification];
        [[UIApplication sharedApplication] scheduleLocalNotification:new_noti];
        m_local_notification = new_noti;
    }
}

- (UILocalNotification *) SwapDelete
{
    UILocalNotification *rt = nil;
    if ([ReminderHelper CheckNotificationDone:m_local_notification])
    {
        [[UIApplication sharedApplication] cancelLocalNotification:m_local_notification];
        rt = m_local_notification;
    }
    return rt;
}

- (void) test
{
    NSArray *aa = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *each in aa)
    {
        NSLog(@"each = %@", each.userInfo);
    }
}

//{
//    m_editing = NO;
//    
//    m_rect_show = m_right_arrow.frame;
//    m_rect_hide = m_rect_show;
//    m_rect_hide.origin.x = m_rect_show.origin.x+m_rect_show.size.width;
//    m_rect_mid = m_rect_show;
//    m_rect_mid.origin.x = m_rect_show.origin.x-20;
//}

//- (void) BtnDelete
//{
//    if ([_parentView respondsToSelector:@selector(cbFromCellDelete:)])
//    {
//        [_parentView cbFromCellDelete:self];
//    }
//}

//- (void) SetEndEditing
//{
//    if (m_editing)
//    {
//        m_editing = NO;
//        [UIView animateWithDuration:0.15 animations:^{
//            m_btn_delete.frame = m_rect_hide;
//        }];
//    }
//}

//- (void) GestureSwipeLeft
//{
//    if (m_editing)
//    {
//        return;
//    }
//    m_editing = YES;
//    [UIView animateWithDuration:0.15 animations:^{
//        m_btn_delete.frame = m_rect_mid;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.08 delay:0.05 options:0 animations:^{
//            m_btn_delete.frame = m_rect_show;
//        } completion:^(BOOL finished) {
//            if (finished)
//            {
//                if ([_parentView respondsToSelector:@selector(cbFromCellEditing:)])
//                {
//                    [_parentView cbFromCellEditing:self];
//                }
//            }
//        }];
//    }];
//}

@end
