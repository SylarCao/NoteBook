//
//  PasswordViewController.m
//  NoteBook
//
//  Created by Sylar on 3/25/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////
#import "PasswordViewController.h"
#import "MJPasswordView.h"
#import "CommonTools.h"
////////////////////////////////////////////////////////////////////////////////////
const float c_securyView_title_height = 70;
////////////////////////////////////////////////////////////////////////////////////
@interface PasswordViewController ()
<MJPasswordDelegate>
{
    UILabel*   m_label_title;
}
@end
////////////////////////////////////////////////////////////////////////////////////
@implementation PasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    // title label
    m_label_title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, c_securyView_title_height)];
    [m_label_title setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
    [m_label_title setText:@"请输入密码"];
    [m_label_title setFont:[UIFont systemFontOfSize:30]];
    [m_label_title setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:m_label_title];
    
    // password view
    CGRect frame = CGRectMake((kSCREEN_WIDTH - kPasswordViewSideLength)/2, 0, kPasswordViewSideLength, kPasswordViewSideLength);
    MJPasswordView* password_view = [[MJPasswordView alloc] initWithFrame:frame];
    [password_view setDelegate:self];
    [password_view setP_image:[UIImage imageNamed:@"password"]];
    [password_view setP_image_highlighted:[UIImage imageNamed:@"password_highlighted"]];
    //    [password_view setCircleFillColour:[UIColor colorWithPatternImage:[UIImage imageNamed:@"settings"]]];
    //    [password_view setCircleFillColourHighlighted:[UIColor colorWithPatternImage:[UIImage imageNamed:@"close"]]];
    [self.view addSubview:password_view];
    
    // auto layout
    [CommonTools AutoLayoutVerticleView:self.view WithSubviews:[NSArray arrayWithObjects:m_label_title, password_view, nil] TopEdge:0 BottomEdge:20 NeedCenter:YES];
}


// delegate
- (void)passwordView:(MJPasswordView*)passwordView withPassword:(NSString*)password
{
    NSLog(@"password = %@", password);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
