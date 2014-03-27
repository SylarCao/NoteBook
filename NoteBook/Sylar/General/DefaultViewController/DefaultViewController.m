//
//  DefaultViewController.m
//  NoteBook
//
//  Created by Sylar on 3/11/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
/////////////////////////////////////////////////////////////////////
#import "DefaultViewController.h"
#import "CommomColor.h"
#import "PasswordViewController.h"
#import "NoteListViewController.h"
/////////////////////////////////////////////////////////////////////
@interface DefaultViewController ()

@end
/////////////////////////////////////////////////////////////////////
@implementation DefaultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self SetInitialValued];
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self Once];
        });
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

- (void) Once
{
    NSString *path = NSHomeDirectory();
    NSLog(@"home = %@", path);
}

- (void) SetInitialValued
{
    [self.view setBackgroundColor:[CommomColor GetBkgColor]];
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        UILabel* lb = [[UILabel alloc] init];
        [self.view addSubview:lb];
//    });
}

- (void) SetNaviBackItemTitle:(NSString *)_naviBack
{
    UIImage* bkg = [UIImage imageNamed:@"btn_bkg"];
    UIImage* bkg_highlighted = [UIImage imageNamed:@"btn_bkg_highlighted"];
    UIImage *arrow = [UIImage imageNamed:@"navi_back"];
    
    UIImageView* imv = [[UIImageView alloc] initWithImage:bkg];
    [imv setFrame:CGRectMake(0, 0, 50, 30)];
    UIBarButtonItem *rt = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
//    rt.customView = imv;
//    rt.image = bkg;
//    rt.customView = [[UIImageView alloc] initWithImage:bkg];
//    rt = [[UIBarButtonItem alloc] initWith];
//    [rt setBackButtonBackgroundImage:bkg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    rt.width = -20;
//    [rt setBackButtonBackgroundImage:bkg_highlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = rt;
    return;
    UIBarButtonItem* bb = [[UIBarButtonItem alloc] initWithCustomView:imv];
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"navi_back"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"navi_back"]];
//    bb.image = arrow;
    bb.title = @" ";
//    [self.navigationItem.]
    bb.width = 20;
    self.navigationItem.backBarButtonItem = bb;
}

- (void) SetNaviTitle:(NSString *)_naviTitle
{
    self.navigationItem.title = _naviTitle;
}

- (void) BtnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) ShowPasswordView
{
    PasswordViewController* pp = [[PasswordViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:pp animated:YES completion:nil];
}

- (UIButton*) GetButtonWithTitle:(NSString*)_pTitle
{
    UIButton* rt = [UIButton buttonWithType:UIButtonTypeCustom];
    [rt setTitle:_pTitle forState:UIControlStateNormal];
    [rt.layer setBorderColor:[UIColor blueColor].CGColor];
    [rt.layer setBorderWidth:2];
    [rt.layer setCornerRadius:10];
    [rt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rt setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
    return rt;
}


@end
