//
//  MenuViewController.m
//  Menu
//
//  Created by Anton Byrna on 2/4/13.
//  Copyright (c) 2013 Anton Byrna. All rights reserved.
//

#import "MenuViewController.h"
#import "DeckViewController.h"
#import "ContentViewController.h"
#import "TestViewController.h"
#import "AnotherViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation MenuViewController

#pragma mark - Table methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MenuTableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *controllerClassName = self.controllers[indexPath.row];
    if ([controllerClassName isEqualToString:@"ContentViewController"]) {
        cell.textLabel.text = @"Content View Controller";
    }
    
    else if ([controllerClassName isEqualToString:@"TestViewController"]) {
        cell.textLabel.text = @"Test View Controller";
    }
    
    else if ([controllerClassName isEqualToString:@"AnotherViewController"]) {
        cell.textLabel.text = @"Another View Controller";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *controllerClassName = self.controllers[indexPath.row];
    if ([controllerClassName isEqualToString:@"ContentViewController"]) {
        ContentViewController *contentViewController = [[ContentViewController alloc] initWithNibName:nil bundle:nil];
        self.deckController.activeViewController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    }
    
    else if ([controllerClassName isEqualToString:@"TestViewController"]) {
        TestViewController *testViewController = [[TestViewController alloc] initWithNibName:nil bundle:nil];
        self.deckController.activeViewController = [[UINavigationController alloc] initWithRootViewController:testViewController];
    }
    
    else if ([controllerClassName isEqualToString:@"AnotherViewController"]) {
        self.deckController.activeViewController = [[AnotherViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    [self.deckController closeMenuAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    frame.size.height = 200;
    self.view.frame = frame;
    
    self.controllers = @[NSStringFromClass([ContentViewController class]), NSStringFromClass([TestViewController class]), NSStringFromClass([AnotherViewController class])];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Menu View Controller APPEAR : %@", NSStringFromCGRect(self.view.frame));
}

- (void)dealloc
{
    NSLog(@"Menu View Controller DEALLOC");
}

@end
