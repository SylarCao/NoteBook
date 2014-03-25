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

- (void) SetInitialValued
{
    [self.view setBackgroundColor:[CommomColor GetBkgColor]];
}

- (void) SetInitialValue
{
    NSLog(@"do override me");
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
