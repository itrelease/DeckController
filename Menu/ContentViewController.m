//
//  ViewController.m
//  Menu
//
//  Created by Anton Byrna on 2/4/13.
//  Copyright (c) 2013 Anton Byrna. All rights reserved.
//

#import "ContentViewController.h"
#import "DeckViewController.h"

@interface ContentViewController ()

@property (nonatomic, weak) IBOutlet UIButton *toggleMenuButton;

@end

@implementation ContentViewController

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
    NSLog(@"Content View Controller WILL APPEAR: %@", NSStringFromCGRect(self.view.frame));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"Content View Controller DID APPEAR: %@", NSStringFromCGRect(self.view.frame));
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"Content View Controller DISAPPEAR");
}

- (void)dealloc
{
    NSLog(@"Content View Controller DEALLOC");
}

@end
