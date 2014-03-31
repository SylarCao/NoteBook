//
//  ChangPasswordViewController.m
//  NoteBook
//
//  Created by Sylar on 3/31/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////
#import "ChangPasswordViewController.h"
#import "CommonTools.h"
#import "MJPasswordView.h"
#import "PasswordHelper.h"
///////////////////////////////////////////////////////////////////////////
typedef NS_ENUM(NSInteger, enChangePassordState)
{
    en_change_password_state_old_password = 1,
    en_change_password_state_new = 2,
    en_change_password_state_confirm = 3,
    en_change_password_incorrect = 4,
};
///////////////////////////////////////////////////////////////////////////
extern float c_securyView_title_font_size;
extern float c_securyView_title_height;
///////////////////////////////////////////////////////////////////////////
@interface ChangPasswordViewController ()
<MJPasswordDelegate>
{
    enChangePassordState  m_state;
    UILabel              *m_label_hint;
    MJPasswordView       *m_password_view;
    NSString             *m_temp_password;
}
@end
///////////////////////////////////////////////////////////////////////////
@implementation ChangPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        m_state = en_change_password_state_old_password;
        [self SetInitialValue];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) SetInitialValue
{
    [self SetNavi];
    [self SetPageView];
    [self RefreshState];
}

- (void) SetNavi
{
    // title
    [self SetNaviTitle:LocalizedString(@"ChangePassword")];
    
    // right item
    UIButton *forget_passord = [self GetNaviButtonWithTitle:LocalizedString(@"ForgetPassowrd")];
    [forget_passord addTarget:self action:@selector(BtnForgetPassword) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* right_item = [[UIBarButtonItem alloc] initWithCustomView:forget_passord];
    [self.navigationItem setRightBarButtonItem:right_item];
    
}

- (void) SetPageView
{
    float navi_height = [CommonTools GetNaviStatusBarHeight];
    
    // label
    float label_height = c_securyView_title_height;
    CGRect frame_label = CGRectMake(0, 0, kSCREEN_WIDTH, label_height);
    m_label_hint = [[UILabel alloc] initWithFrame:frame_label];
    m_label_hint.text = @"texttt";
    m_label_hint.textAlignment = NSTextAlignmentCenter;
    m_label_hint.font = [UIFont systemFontOfSize:c_securyView_title_font_size];
    [self.view addSubview:m_label_hint];
    
    // passordd view
    CGRect frame_password = CGRectMake((kSCREEN_WIDTH - kPasswordViewSideLength)/2, 0, kPasswordViewSideLength, kPasswordViewSideLength);
    m_password_view =[[MJPasswordView alloc] initWithFrame:frame_password];
    m_password_view.delegate = self;
    [m_password_view setP_image:[UIImage imageNamed:@"password"]];
    [m_password_view setP_image_highlighted:[UIImage imageNamed:@"password_highlighted"]];
    [self.view addSubview:m_password_view];
    
    [CommonTools AutoLayoutVerticleView:self.view WithSubviews:[NSArray arrayWithObjects:m_label_hint, m_password_view, nil] TopEdge:navi_height-20 BottomEdge:20 NeedCenter:YES];
    
    // test
    m_label_hint.backgroundColor =[UIColor redColor];
}

- (void) BtnForgetPassword
{
    NSLog(@"forget password");
}

- (void) RefreshState
{
    NSString *hint = nil;
    if (m_state == en_change_password_state_old_password)
    {
        hint = LocalizedString(@"InputOldPassword");
    }
    else if (m_state == en_change_password_state_new)
    {
        hint = LocalizedString(@"InputNewPassword");
    }
    else if (m_state == en_change_password_state_confirm)
    {
        hint = LocalizedString(@"InputConfirmPassowrd");
    }
    else if (m_state == en_change_password_incorrect)
    {
        hint = LocalizedString(@"OldPasswordIncorrect");
    }
    m_label_hint.text = hint;
}

- (void) Confirm:(BOOL)correct
{
    if (correct)
    {
        [self ShowPopViewWithText:LocalizedString(@"ChangePassordSuccess") Complete:^(BOOL complete) {
            [self BtnBack];
        }];
    }
    else
    {
        [self ShowPopViewWithText:LocalizedString(@"ConfirmError") Complete:^(BOOL complete) {
            m_state = en_change_password_state_old_password;
            [self RefreshState];
        }];
    }
}


// delegate
- (void)passwordView:(MJPasswordView*)passwordView withPassword:(NSString*)password
{
    if (m_state == en_change_password_state_old_password || m_state == en_change_password_incorrect)
    {
        BOOL correct = [PasswordHelper CheckLoginPassword:password];
        if (correct)
        {
            m_state = en_change_password_state_new;
            [self RefreshState];
        }
        else
        {
            m_state = en_change_password_incorrect;
            [self RefreshState];
        }
    }
    else if (m_state == en_change_password_state_new)
    {
        m_temp_password = password;
        m_state = en_change_password_state_confirm;
        [self RefreshState];
    }
    else if (m_state == en_change_password_state_confirm)
    {
        BOOL same = [m_temp_password isEqualToString:password];
        [PasswordHelper SetLoginPassword:password];
        [self Confirm:same];
    }
}


@end