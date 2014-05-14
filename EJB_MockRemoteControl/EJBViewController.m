//
//  EJBViewController.m
//  EJB_MockRemoteControl
//
//  Created by Eric on 05/02/14.
//  Copyright (c) 2014 Eric Beasley. All rights reserved.
//

#import "EJBViewController.h"

@interface EJBViewController ()

@end

@implementation EJBViewController

@synthesize powerStatus;
@synthesize powerSwitch;
@synthesize volumeLabel;
@synthesize channelOutput;
@synthesize currentChannel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentChannel = [[NSString alloc] init];
    [self didTogglePower];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (IBAction)powerToggled:(UISwitch *)sender
{
    [self didTogglePower];
}


- (IBAction)volumeSliderChanged:(UISlider *)sender
{
    int level = lroundf(sender.value);
    self.volumeLabel.text = [NSString stringWithFormat:@"%d", level];
}


- (IBAction)chButtonPressed:(UIButton *)sender
{
    if ([currentChannel length] == 2) {
        currentChannel = @"";
    }
    currentChannel = [currentChannel stringByAppendingFormat:@"%@", [sender currentTitle]];
    if ([currentChannel isEqualToString:@"00"]) {
        currentChannel = @"01";
    }
    channelOutput.text = currentChannel;
}


- (IBAction)channelUp:(UIButton *)sender
{
    if ([channelOutput.text isEqual: @"99"]) {
        currentChannel = @"1";
    } else {
        currentChannel = [NSString stringWithFormat:@"%d", [currentChannel intValue]+1];
    }
    
    if ([currentChannel intValue] < 10) {
        currentChannel = [NSString stringWithFormat:@"0%@", currentChannel];
    }
    channelOutput.text = currentChannel;
}


- (IBAction)channelDown:(UIButton *)sender
{
    if ([channelOutput.text isEqual: @"01"]) {
        currentChannel = @"99";
    } else {
        currentChannel = [NSString stringWithFormat:@"%d", [currentChannel intValue]-1];
    }
   
    if ([currentChannel intValue] < 10) {
        currentChannel = [NSString stringWithFormat:@"0%@", currentChannel];
    }
        channelOutput.text = currentChannel;
}


- (IBAction)favoritesPressed:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            currentChannel = @"32";
            break;
        case 1:
            currentChannel = @"62";
             break;
        case 2:
            currentChannel = @"09";
            break;
    }
    channelOutput.text = currentChannel;
}


- (void)didTogglePower
{
    for (int i=1000; i<=1013; ++i) {
        ((UIControl *)[self.view viewWithTag:i]).enabled = self.powerSwitch.isOn;
    }
    
    if (self.powerSwitch.isOn) {
        self.powerStatus.text = @"On";
    } else {
        self.powerStatus.text = @"Off";
    }
}

@end
