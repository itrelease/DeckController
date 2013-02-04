//
//  TestViewController.m
//  Menu
//
//  Created by Anton Byrna on 2/4/13.
//  Copyright (c) 2013 Anton Byrna. All rights reserved.
//

#import "TestViewController.h"
#import "DeckViewController.h"

@interface TestViewController ()

@property (nonatomic, weak) IBOutlet UIButton *toggleMenuButton;

@end

@implementation TestViewController

#pragma mark - IBAction methods

- (IBAction)toggleMenuButtonTouchUpInside:(id)sender
{
    if (self.deckController.isMenuOpen) {
        [self.deckController closeMenuAnimated:YES];
    } else {
        [self.deckController openMenuAnimated:YES];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Test View Controller WILL APPEAR: %@", NSStringFromCGRect(self.view.frame));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"Test View Controller DID APPEAR: %@", NSStringFromCGRect(self.view.frame));
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"Test View Controller DISAPPEAR");
}

- (void)dealloc
{
    NSLog(@"Test View Controller DEALLOC");
}

@end
