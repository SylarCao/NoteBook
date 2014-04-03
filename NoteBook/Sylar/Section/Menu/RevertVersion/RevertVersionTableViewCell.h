//
//  RevertVersionTableViewCell.h
//  NoteBook
//
//  Created by Sylar on 4/1/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LocalVersionItem;

@interface RevertVersionTableViewCell : UITableViewCell

+ (NSString *) GetCellId;

- (void) SetWithData:(LocalVersionItem *)item;

@end
