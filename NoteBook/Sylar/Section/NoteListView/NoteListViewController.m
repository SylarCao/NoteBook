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
#import "PasswordViewController.h"
#import "DataModel.h"
#import "NoteListDetailedViewController.h"

// test
//#import "OpenUDID.h"
//#import "AVODefines.h"
//#import "CommonTools.h"
#import "ItemModel.h"
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
@interface NoteListViewController ()
<UICollectionViewDataSource_Draggable, UICollectionViewDelegate>
{
    UICollectionView* m_collection_view;
//    int m_cell_number;
}
@end
/////////////////////////////////////////////////////////////////////
@implementation NoteListViewController

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

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [m_collection_view reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) SetInitialValue
{
//    m_cell_number = [[DataModel Share] GetItemCount];
    [self SetNaviBar];
    [self SetCollectionView];
}

- (void) SetNaviBar
{
    [self SetNaviTitle:LocalizedString(@"NoteListTitle")];
}

- (void) SetCollectionView
{
    DraggableCollectionViewFlowLayout* layout = [[DraggableCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    float navi = [CommonTools GetNaviStatusBarHeight];
    CGRect collection_frame = CGRectMake(0, navi, kSCREEN_WIDTH, kSCREEN_HEIGHT-navi);
    m_collection_view = [[UICollectionView alloc] initWithFrame:collection_frame collectionViewLayout:layout];
    [m_collection_view setDraggable:YES];
    [m_collection_view setBackgroundColor:[UIColor clearColor]];
    [m_collection_view setDelegate:self];
    [m_collection_view setDataSource:self];
    [self.view addSubview:m_collection_view];
    
    [m_collection_view registerClass:[NoteListViewCell class] forCellWithReuseIdentifier:[NoteListViewCell GetCellId]];
}


// delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[DataModel Share] GetItemCount]+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteListViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NoteListViewCell GetCellId] forIndexPath:indexPath];
    if (indexPath.row == [[DataModel Share] GetItemCount])
    {
        [cell SetWithTitle:LocalizedString(@"AddNewOne")];
    }
    else
    {
        NSString *title = [[DataModel Share] GetItemAtIndex:indexPath.row].title;
        [cell SetWithTitle:title];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemModel *item = [[DataModel Share] GetItemAtIndex:indexPath.row];
    if (item == nil)
    {
        item = [[ItemModel alloc] init];
        [[DataModel Share] AddItem:item];
    }
    NoteListDetailedViewController* nn = [NoteListDetailedViewController CreateWithData:item];
    [self.navigationController pushViewController:nn animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
//    NSLog(@"move from %d to %d", fromIndexPath.row, toIndexPath.row);
    [[DataModel Share] MoveItemAtIndex:fromIndexPath.row To:toIndexPath.row];
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [[DataModel Share] GetItemCount])
        return NO;
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    int cell_number = [[DataModel Share] GetItemCount];
    if (indexPath.row == cell_number)
        return NO;
    if (toIndexPath.row == cell_number)
        return NO;
    return YES;
}




// test


- (void) test
{
//    ItemModel* ii = [[ItemModel alloc] init];
////    int a = ii.bb;
////    NSLog(@"a = %d", a);
//    NSLog(@"");
////    ii.titleOnNoteList = @"ddd";
//    
//    NSString* ss = ii.titleOnNoteList;
//    NSLog(@"ss = %@", ss);
//    NSLog(@"");
    
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
