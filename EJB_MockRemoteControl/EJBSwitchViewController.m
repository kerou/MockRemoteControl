//
//  EJBSwitchViewController.m
//  EJB_MockRemoteControl2
//
//  Created by Eric on 5/12/14.
//  Copyright (c) 2014 Eric Beasley. All rights reserved.
//

#import "EJBSwitchViewController.h"

#import "EJBDvrViewController.h"
#import "EJBTvViewController.h"

@interface EJBSwitchViewController ()

@property (strong, nonatomic) EJBDvrViewController *dvrViewController;
@property (strong, nonatomic) EJBTvViewController *tvViewController;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButton;

@end

@implementation EJBSwitchViewController

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
    self.tvViewController = [self.storyboard
                             instantiateViewControllerWithIdentifier:
                             @"tvRemote"];
    [self.view insertSubview:self.tvViewController.view atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (!self.tvViewController.view.superview) {
        self.tvViewController = nil;
    } else {
        self.dvrViewController = nil;
    }
}

-(IBAction)switchViews:(id)sender
{
    self.barButton.title = @"test";
    if(!self.dvrViewController.view.superview) {
        if (!self.dvrViewController) {
            self.dvrViewController = [self.storyboard
                                      instantiateViewControllerWithIdentifier:@"dvrRemote"];
        }
        [self.tvViewController.view removeFromSuperview];
        [self.view insertSubview:self.dvrViewController.view atIndex:0];
        self.barButton.title = @"Switch to TV";

    } else {
        if (!self.tvViewController) {
            self.tvViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tvRemote"];
        }
        [self.dvrViewController.view removeFromSuperview];
        [self.view insertSubview:self.tvViewController.view atIndex:0];
        self.barButton.title = @"Switch to DVR";
    }
}


@end
