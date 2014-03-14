//
//  NoteListViewController.m
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//
/////////////////////////////////////////////////////////////////////
#import "NoteListViewController.h"
#import "CommonTools.h"
#import "UICollectionView+Draggable.h"
#import "DraggableCollectionViewFlowLayout.h"
#import "NoteListViewCell.h"

// test
//#import "OpenUDID.h"
//#import "AVODefines.h"
//#import "CommonTools.h"
#import "ItemModel.h"
/////////////////////////////////////////////////////////////////////
@interface NoteListViewController ()
<UICollectionViewDataSource_Draggable, UICollectionViewDelegate>
{
    UICollectionView* m_collection_view;
    int m_cell_number;
}
@end
/////////////////////////////////////////////////////////////////////
@implementation NoteListViewController

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
    [self test];
    m_cell_number = 10;
    [self SetNaviBar];
    [self SetCollectionView];
}

- (void) SetNaviBar
{
    
}

- (void) SetCollectionView
{
    DraggableCollectionViewFlowLayout* layout = [[DraggableCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    
    float navi_bar_height = self.navigationController.navigationBar.frame.size.height;
    CGRect collection_frame = CGRectMake(0, navi_bar_height, kSCREEN_WIDTH, kSCREEN_HEIGHT-navi_bar_height);
    m_collection_view = [[UICollectionView alloc] initWithFrame:collection_frame collectionViewLayout:layout];
    [m_collection_view setDraggable:NO];
    [m_collection_view setBackgroundColor:[UIColor clearColor]];
    [m_collection_view setDelegate:self];
    [m_collection_view setDataSource:self];
    [self.view addSubview:m_collection_view];
    
    [m_collection_view registerClass:[NoteListViewCell class] forCellWithReuseIdentifier:@"id12345"];
}


// delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return m_cell_number;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteListViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"id12345" forIndexPath:indexPath];
    [cell SetTest];
    
    return cell;
}





- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == m_cell_number-1)
        return NO;
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    if (indexPath.row == m_cell_number-1)
        return NO;
    if (toIndexPath.row == m_cell_number-1)
        return NO;
    return YES;
}




- (void) test
{
    ItemModel* ii = [[ItemModel alloc] init];
//    int a = ii.bb;
//    NSLog(@"a = %d", a);
    NSLog(@"");
//    ii.titleOnNoteList = @"ddd";
    
    NSString* ss = ii.titleOnNoteList;
    NSLog(@"ss = %@", ss);
    NSLog(@"");
    
//    NSString* udid = [OpenUDID value];
//    
//    int tt = [CommonTools GetTime0];
//    
//    NSLog(@"time0 = %d", tt);
    
//    AVQuery* qqq = [AVQuery queryWithClassName:@"CUser"];
//    [qqq whereKey:@"UDID" equalTo:udid];
//    [qqq findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        NSLog(@"");
//    }];
    
//    AVObject* obj = [AVObject objectWithClassName:@"CUser"];
//    [obj setObject:udid forKey:@"UDID"];
//    [obj saveEventually:^(BOOL succeeded, NSError *error) {
//        NSLog(@"");
//    }];
    
//    NSString* path = NSHomeDirectory();
//    NSLog(@"path = %@", path);
//    
//    long time0 = [CommonTools GetTime0];
//    NSString* stime0 = [NSString stringWithFormat:@"%ld", time0];
//    NSMutableArray* arr = [[NSUserDefaults standardUserDefaults] objectForKey:@"actives"];
//    if (!arr)
//    {
//        arr = [[NSMutableArray alloc] initWithObjects:stime0, nil];
//        [[NSUserDefaults standardUserDefaults] setObject:arr forKey:@"actives"];
//    }
//    else
//    {
//        [arr addObject:stime0];
//    }
//    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
