//
//  NoteListDetailedViewController.m
//  NoteBook
//
//  Created by Sylar on 3/26/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////
#import "NoteListDetailedViewController.h"
#import "ItemModel.h"
#import "CommonTools.h"
////////////////////////////////////////////////////////////////////////////////////
@interface NoteListDetailedViewController ()
{
    ItemModel    *m_data;
    UITextField  *m_title;
    UITextView   *m_content;
}
@end
////////////////////////////////////////////////////////////////////////////////////
@implementation NoteListDetailedViewController

+ (id) CreateWithData:(ItemModel *)_data
{
    id rt = [[NoteListDetailedViewController alloc] initWithData:_data];
    return rt;
}

- (id) initWithData:(ItemModel *)_data
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        m_data = _data;
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
    [self SetNaviBar];
    [self SetTextView];
}

- (void) SetNaviBar
{
    // back
    UIImage* back_normal = [UIImage imageNamed:@"navi_back"];
    UIImage* back_highlight = [UIImage imageNamed:@"navi_back_highlighted"];
    UIButton* back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, back_normal.size.width, back_normal.size.height);
    [back setImage:back_normal forState:UIControlStateNormal];
    [back setImage:back_highlight forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(BtnBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* left_item = [[UIBarButtonItem alloc] initWithCustomView:back];
    [self.navigationItem setLeftBarButtonItem:left_item animated:YES];
    
    // title
    m_title = [[UITextField alloc] init];
    m_title.frame = CGRectMake(0, 0, 100, 40);
    m_title.text = m_data.title;
    self.navigationItem.titleView = m_title;
}

- (void) SetTextView
{
    m_content = [[UITextView alloc] init];
    int navi_height = [CommonTools GetNaviStatusBarHeight];
    int edge = 5;
    m_content.frame = CGRectMake(5, navi_height+edge, kSCREEN_WIDTH-2*edge, kSCREEN_HEIGHT-navi_height-2*edge);
    m_content.font = [UIFont systemFontOfSize:14];
    m_content.textContainerInset = UIEdgeInsetsMake(5, 3, 5, 3);
    [m_content.layer setBorderWidth:2];
    [m_content.layer setCornerRadius:5];
    [m_content.layer setBorderColor:[CommomColor GetBorderColor].CGColor];
    
    [self.view addSubview:m_content];
    
    
}


@end
