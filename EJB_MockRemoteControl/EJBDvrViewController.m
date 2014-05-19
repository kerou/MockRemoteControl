//
//  EJBDvrViewController.m
//  EJB_MockRemoteControl2
//
//  Created by eric's work on 5/12/14.
//  Copyright (c) 2014 Eric Beasley. All rights reserved.
//

#import "EJBDvrViewController.h"


@interface EJBDvrViewController ()


@property (weak, nonatomic) NSString *statusBuffer; //holds status to be swapped on condition
@property (strong, nonatomic) IBOutlet UISwitch *powerSwitch;
@property (strong, nonatomic) IBOutlet UILabel *powerStatus;
@property (strong, nonatomic) IBOutlet UILabel *state;

@end

@implementation EJBDvrViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self didTogglePower];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTogglePower
{
    for (int i=1000; i<=1005; i++) {
        ((UIControl *)[self.view viewWithTag:i]).enabled = self.powerSwitch.isOn;
    }
    
    if (_powerSwitch.isOn) {
        _powerStatus.text = @"On";
    }
    else {
        _powerStatus.text = @"Off";
        _state.text = @"Stop";
    }
}

- (IBAction)powerToggled:(UISwitch *)sender
{
    [self didTogglePower];
}


- (IBAction)playPressed:(UIButton *)sender
{
    _statusBuffer = @"Play";
    if ([_state.text isEqualToString:@"Record"]){
        [self notAllowed];
    }
    else {
        _state.text = _statusBuffer;
    }
} //end of playPressed


- (IBAction)stopPressed:(UIButton *)sender
{
    _state.text = @"Stop";
} //end of stopPressed


- (IBAction)rewindPressed:(UIButton *)sender
{
    _statusBuffer = @"Rewind";
    if ([_state.text isEqualToString:@"Play"] ||
        [_state.text isEqualToString:@"F Foward"]) {
        _state.text = _statusBuffer;
    }
    
    else if ([_state.text isEqualToString:@"Pause"] ||
             [_state.text isEqualToString:@"Stop"]){
        [self notAllowed];
    }
} //end of rewindPressed


- (IBAction)forwardPressed:(UIButton *)sender
{
    _statusBuffer = @"F Foward";
    if ([_state.text isEqualToString:@"Play"] ||
        [_state.text isEqualToString:@"Rewind"]) {
        _state.text = _statusBuffer;
    }
    
    else if ([_state.text isEqualToString:@"Pause"] ||
             [_state.text isEqualToString:@"Stop"]) {
        [self notAllowed];
    }
} //end of forwardPressed


- (IBAction)pausePressed:(UIButton *)sender
{
    _statusBuffer = @"Pause";
    if ([_state.text isEqualToString:@"Play"]) {
        _state.text = _statusBuffer;
    }
    
    if ([_state.text isEqualToString:@"F Foward"] ||
        [_state.text isEqualToString:@"Rewind"]) {
        [self notAllowed];
    }
} //end of pausePressed


- (IBAction)recordPressed:(UIButton *)sender
{
    if ([_state.text isEqualToString:@"Stop"]) {
        _state.text = @"Record";
    }
    else if (![_state.text isEqualToString:@"Record"]) {
        _statusBuffer = [sender currentTitle];
        [self notAllowed];
    }
} //recordPressed

- (void)changeStatus
{
    _state.text = _statusBuffer;
}

- (void)notAllowed
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:
                                    @"Do you wish to stop the current mode and switch?"
                                  delegate:self
                                  cancelButtonTitle:@"No, cancel"
                                  destructiveButtonTitle:@"Yes!"
                                  otherButtonTitles: nil];
    [actionSheet showInView:self.view];
} //notAllowed

- (void)actionSheet:(UIActionSheet *)actionSheet
    didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *msg = nil;
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        _state.text = _statusBuffer;
        msg = [NSString stringWithFormat:
               @"Switched to: %@", _state.text];
    } else {
        msg = [NSString stringWithFormat:
               @"Continuing: %@", _state.text];
    }
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@""
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil];
    [alert show];
    
}//end actionSheet


@end
