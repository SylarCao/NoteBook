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

    
//    UILabel* label = [[UILabel alloc] init];
//    [label setFrame:CGRectMake(100, 100, 100, 100)];
//    [label setBackgroundColor:[UIColor redColor]];
//    NSString* ss = NSLocalizedString(@"demo", "");
//    [label setText:ss];
//    [self.view addSubview:label];
}

- (void) SetInitialValue
{
    NSLog(@"do override me");
}

@end
