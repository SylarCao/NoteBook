//
//  NoteListDetailedViewController.h
//  NoteBook
//
//  Created by Sylar on 3/26/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultViewController.h"
@class ItemModel;

@interface NoteListDetailedViewController : DefaultViewController

+ (id) CreateWithData:(ItemModel *)_data;

@end
