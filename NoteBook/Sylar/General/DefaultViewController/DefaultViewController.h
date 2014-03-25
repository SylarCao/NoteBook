//
//  DefaultViewController.h
//  NoteBook
//
//  Created by Sylar on 3/11/14.
//  Copyright (c) 2014 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultViewController : UIViewController

- (void) SetInitialValue;

- (void) BtnBack;

- (void) ShowPasswordView;

- (UIButton*) GetButtonWithTitle:(NSString*)_pTitle;

@end
