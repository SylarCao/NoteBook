//
//  DataModel.h
//  NoteBook
//
//  Created by Sylar on 3/25/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ItemModel;

@interface DataModel : NSObject

+ (instancetype) Share;

- (int) GetItemCount;

- (ItemModel *) GetItemAtIndex:(int)_index;

- (void) MoveItemAtIndex:(int)_fromIndex To:(int)_toIndex;

- (void) AddItem:(ItemModel *)_item;

- (void) RemoveItem:(ItemModel *)_item;

- (void) SynchronizeWithEditingItem:(ItemModel *)_model;

- (void) Synchronize;

@end
