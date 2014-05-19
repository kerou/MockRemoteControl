//
//  EJBDvrViewController.h
//  EJB_MockRemoteControl2
//
//  Created by eric's work on 5/12/14.
//  Copyright (c) 2014 Eric Beasley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EJBDvrViewController : UIViewController <UIActionSheetDelegate>


- (IBAction)powerToggled:(UISwitch *)sender;
- (IBAction)playPressed:(UIButton *)sender;
- (IBAction)stopPressed:(UIButton *)sender;
- (IBAction)rewindPressed:(UIButton *)sender;
- (IBAction)forwardPressed:(UIButton *)sender;
- (IBAction)pausePressed:(UIButton *)sender;
- (IBAction)recordPressed:(UIButton *)sender;

- (void)changeStatus;
- (void)notAllowed;

@end
