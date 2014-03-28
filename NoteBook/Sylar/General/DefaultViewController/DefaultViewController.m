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
#import "CommonTools.h"
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
//    UIImage* bkg = [UIImage imageNamed:@"btn_bkg"];
//    UIImage* bkg_highlighted = [UIImage imageNamed:@"btn_bkg_highlighted"];
//    UIImage* close = [UIImage imageNamed:@"close"];
//    UIImage *arrow = [UIImage imageNamed:@"navi_back"];
//    UIImage* test1 = [UIImage imageNamed:@"test1"];
//    UIImage* test2 = [UIImage imageNamed:@"test2"];
//    UIImage* ii = [test2 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 16, 0, 5) resizingMode:UIImageResizingModeStretch];
//    
//    
//    UIImageView* imv = [[UIImageView alloc] initWithImage:arrow];
//    [imv setFrame:CGRectMake(0, 0, arrow.size.width, arrow.size.height)];
//    UIBarButtonItem *rt = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
////    rt.customView = imv;
////    rt.image = bkg;
////    rt.customView = [[UIImageView alloc] initWithImage:bkg];
////    rt = [[UIBarButtonItem alloc] initWith];
////    [rt setBackButtonBackgroundImage:bkg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
////    rt.width = -20;
////    [rt setBackButtonBackgroundImage:bkg_highlighted forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
////    self.navigationItem.backBarButtonItem = rt;
////    return;
//    UIBarButtonItem* bb = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:NULL];
////    bb.width = -20;
//    [bb setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor darkTextColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
//    [bb setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor lightTextColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateHighlighted];
////    UITextAttributeTextColor
////    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"navi_back"]];
////    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"navi_back"]];
//    [bb setBackButtonBackgroundImage:ii forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
////    bb.image = arrow;
////    bb.title = @" ";
////    [self.navigationItem.]
////    bb.width = 20;
////    [self.navigationController.navigationBar setBackIndicatorImage:arrow];
////    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:arrow];
//    [self.navigationItem setBackBarButtonItem:bb];
////    self.navigationItem.backBarButtonItem = bb;
}

- (void) SetNaviTitle:(NSString *)_naviTitle
{
    self.navigationItem.title = _naviTitle;
}

- (UIButton *) GetNaviButtonWithTitle:(NSString *)_naviTitle
{
    UIButton *rt = [UIButton buttonWithType:UIButtonTypeCustom];
    [rt setFrame:CGRectMake(0, 0, 60, 36)];
    [rt setTitle:_naviTitle forState:UIControlStateNormal];
    [rt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rt setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [rt setBackgroundImage:[CommonTools GetResizeImageWithName:@"btn_bkg"] forState:UIControlStateNormal];
    [rt setBackgroundImage:[CommonTools GetResizeImageWithName:@"btn_bkg_highlighted"] forState:UIControlStateHighlighted];
    return rt;
}

- (void) SetNaviBackItem
{
    UIImage* back_normal = [UIImage imageNamed:@"navi_back"];
    UIImage* back_HL = [UIImage imageNamed:@"navi_back_highlighted"];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, back_normal.size.width/2, 0, back_normal.size.width/2-2);
    UIImage *back_normal_resize = [back_normal resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    UIImage *back_HL_resize = [back_HL resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:NULL];
    [back setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    [back setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor clearColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateHighlighted];
    [back setBackButtonBackgroundImage:back_normal_resize forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [back setBackButtonBackgroundImage:back_HL_resize forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [self.navigationItem setBackBarButtonItem:back];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
}

- (void) SetNaviBackItemWithTitle:(NSString *)_backTitle  // deprecate
{
    UIImage *back = [UIImage imageNamed:@"back_bkg"];
    UIImage *back_HL = [UIImage imageNamed:@"back_bkg_HL"];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 16, 0, 5);
    UIImage *back_resize = [back resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    UIImage *back_HL_resize = [back_HL resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    UIBarButtonItem* bb = [[UIBarButtonItem alloc] initWithTitle:_backTitle style:UIBarButtonItemStylePlain target:nil action:NULL];
    [bb setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor darkTextColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    [bb setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateHighlighted];
    [bb setBackButtonBackgroundImage:back_resize forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [bb setBackButtonBackgroundImage:back_HL_resize forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [self.navigationItem setBackBarButtonItem:bb];
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
