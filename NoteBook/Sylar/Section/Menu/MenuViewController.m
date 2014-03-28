//
//  MenuViewController.m
//  NoteBook
//
//  Created by Sylar on 3/28/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////
#import "MenuViewController.h"
///////////////////////////////////////////////////////////////////////////
@interface MenuViewController ()

@end
///////////////////////////////////////////////////////////////////////////
@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self SetInitialValue];
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO ;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO ;
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
}

- (void) SetNavi
{
    UIImage* back_normal = [UIImage imageNamed:@"navi_back"];
    UIImage* back_highlight = [UIImage imageNamed:@"navi_back_highlighted"];
    UIButton* back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, back_normal.size.width, back_normal.size.height);
    [back setImage:back_normal forState:UIControlStateNormal];
    [back setImage:back_highlight forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(BtnBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* left_item = [[UIBarButtonItem alloc] initWithCustomView:back];
    [self.navigationItem setRightBarButtonItem:left_item];
}
@end
