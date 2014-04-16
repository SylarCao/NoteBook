//
//  SettingViewController.m
//  NoteBook
//
//  Created by Sylar on 4/15/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////
#import "SettingViewController.h"
#import "CommonTools.h"
#import "SettingFontSizeCell.h"
#import "SettingPasswordCell.h"
#import "SettingFontSizeViewController.h"
////////////////////////////////////////////////////////////////////////
# define kSettingIndexFontSize   0
# define kSettingIndexPassword   1
////////////////////////////////////////////////////////////////////////
@interface SettingViewController ()
<UITableViewDataSource, UITableViewDelegate>

@end
////////////////////////////////////////////////////////////////////////
@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    [self SetTableView];
}

- (void) SetNavi
{
    [self SetNaviTitle:LocalizedString(@"Setting")];
    
    [self SetNaviBackItem];
}

- (void) SetTableView
{
    int navi_height = [CommonTools GetNaviStatusBarHeight];
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, navi_height, kSCREEN_WIDTH, kSCREEN_HEIGHT-navi_height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor clearColor];
    table.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"SettingPasswordCell" bundle:nil]forCellReuseIdentifier:[SettingPasswordCell GetCellId]];
    [table registerClass:[SettingFontSizeCell class] forCellReuseIdentifier:[SettingFontSizeCell GetCellId]];
}

// delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *rt = nil;
    int row = indexPath.row;
    
    if (row == kSettingIndexPassword)
    {
        rt = [tableView dequeueReusableCellWithIdentifier:[SettingPasswordCell GetCellId] forIndexPath:indexPath];
    }
    else if (row == kSettingIndexFontSize)
    {
        rt = [tableView dequeueReusableCellWithIdentifier:[SettingFontSizeCell GetCellId] forIndexPath:indexPath];
        [(SettingFontSizeCell *)rt SetWithTitle:LocalizedString(@"SettingFontSize")];
    }
    return rt;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    BOOL rt = NO;
    int row = indexPath.row;
    if (row == kSettingIndexFontSize)
    {
        rt = YES;
    }
    return rt;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int row = indexPath.row;
    if (row == kSettingIndexFontSize)
    {
        SettingFontSizeViewController *ss = [[SettingFontSizeViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:ss animated:YES];
    }
}

@end
