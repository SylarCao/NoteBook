//
//  NoteListViewCell.h
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoteListViewController;
@class ItemModel;

@interface NoteListViewCell : UICollectionViewCell

@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) ItemModel  *data;

+ (NSString *) GetCellId;

- (void) SetWithTitle:(NSString *)_labelTitle;

- (void) SetLabelFontSize:(int)_fontSize;

- (void) SetEditing:(BOOL)_editing;

@end
