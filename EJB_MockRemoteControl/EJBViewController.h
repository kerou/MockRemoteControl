//
//  EJBViewController.h
//  EJB_MockRemoteControl
//
//  Created by Eric on 10/17/13.
//  Copyright (c) 2013 Eric Beasley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EJBViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *powerStatus;
@property (strong, nonatomic) IBOutlet UISwitch *powerSwitch;
@property (strong, nonatomic) IBOutlet UILabel *volumeLabel;
@property (strong, nonatomic) IBOutlet UILabel *channelOutput;
@property (strong, nonatomic) NSString *currentChannel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *remoteButtons;


- (IBAction)powerToggled:(UISwitch *)sender;
- (IBAction)volumeSliderChanged:(UISlider *)sender;
- (IBAction)chButtonPressed:(UIButton *)sender;
- (IBAction)channelUp:(UIButton *)sender;
- (IBAction)channelDown:(UIButton *)sender;


@end
