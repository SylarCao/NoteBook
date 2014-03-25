//
//  CommonTools.h
//  NoteBook
//
//  Created by Sylar on 3/12/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonDefines.h"

@interface CommonTools : NSObject

//+ (NSTimeInterval) GetTime0;


/* convert NSDate to NSString 
 */
+ (NSString *) GetStringFromDate:(NSDate *)_date; // @"yyyy-MM-dd-HH-mm"
+ (NSString *) GetStringFromDate:(NSDate *)_date WithFormate:(NSDateFormatter *)_formatter;

/* auto layout
 * subview之间的gap平均分配
 * 所有subviews的height加起来应该小于等于parentView的height */
+ (void) AutoLayoutVerticleView:(UIView*)_parentView WithSubviews:(NSArray*)_subViews TopEdge:(float)_topEdge BottomEdge:(float)_bottomEdge NeedCenter:(BOOL)_center;

@end
