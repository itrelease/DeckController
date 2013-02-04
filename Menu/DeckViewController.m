//
//  MenuViewController.m
//  Menu
//
//  Created by Anton Byrna on 2/4/13.
//  Copyright (c) 2013 Anton Byrna. All rights reserved.
//

#import "DeckViewController.h"
#import <objc/runtime.h>

static char DeckControllerPropertyKey;

@interface UIViewController (DeckController_Internal)

// internal setter for the menuController property on UIViewController
- (void)setDeckController:(DeckViewController *)deckController;

@end

@implementation UIViewController (DeckController_Internal)

- (void)setDeckController:(DeckViewController *)deckController
{
    objc_setAssociatedObject(self, &DeckControllerPropertyKey, deckController, OBJC_ASSOCIATION_ASSIGN);
}

@end

@implementation UIViewController (DeckController)

@dynamic deckController;

- (DeckViewController *)deckController
{
    return objc_getAssociatedObject(self, &DeckControllerPropertyKey);
}

@end

// ==========================

@interface DeckViewController ()

@property (nonatomic, strong) UIViewController *menuViewController;
@property (nonatomic, assign, readwrite) BOOL menuOpen;

@end

@implementation DeckViewController

#pragma mark - Init methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return [self initWithMenuViewController:nil activeViewController:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self initWithMenuViewController:nil activeViewController:nil];
}

- (id)initWithMenuViewController:(UIViewController *)menuViewController activeViewController:(UIViewController *)activeViewController
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.menuViewController = menuViewController;
        self.activeViewController = activeViewController;
    }
    return self;
}

#pragma mark - Public methods

- (void)openMenuAnimated:(BOOL)animated
{
    CGRect frame = self.menuViewController.view.frame;
    frame.origin.y = 0;
    
    self.menuOpen = YES;
        
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.menuViewController.view.frame = frame;
        }];
    } else {
        self.menuViewController.view.frame = frame;
    }
}

- (void)closeMenuAnimated:(BOOL)animated
{
    CGRect frame = self.menuViewController.view.frame;
    frame.origin.y = -frame.size.height;
    
    self.menuOpen = NO;
    
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.menuViewController.view.frame = frame;
        }];
    } else {
        self.menuViewController.view.frame = frame;
    }
}

#pragma mark - Setter methods

- (void)setMenuViewController:(UIViewController *)menuViewController
{
    _menuViewController = menuViewController;
    [_menuViewController setDeckController:self];
    
    [self closeMenuAnimated:NO];
    
    [self.view addSubview:_menuViewController.view];
    [self addChildViewController:_menuViewController];
    [_menuViewController didMoveToParentViewController:self];
}

- (void)setActiveViewController:(UIViewController *)activeViewController
{
    if (_activeViewController != nil) {
        [_activeViewController willMoveToParentViewController:nil];
        [_activeViewController.view removeFromSuperview];
        [_activeViewController removeFromParentViewController];
    }
        
    _activeViewController = activeViewController;
    if ([_activeViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *topViewController = ((UINavigationController *)_activeViewController).topViewController;
        [topViewController setDeckController:self];
    } else {
        [_activeViewController setDeckController:self];
    }
    
    CGRect frame = _activeViewController.view.frame;
    frame.size.height = self.view.frame.size.height;
    _activeViewController.view.frame = frame;
    
    NSLog(@"############# %@", NSStringFromCGRect(_activeViewController.view.frame));
    
    [self.view insertSubview:_activeViewController.view belowSubview:_menuViewController.view];
    [self addChildViewController:_activeViewController];
    [_activeViewController didMoveToParentViewController:self];
}

#pragma mark - View lifecycle

- (void)loadView
{
    CGRect frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);
    
    self.view = [[UIView alloc] initWithFrame:frame];
    self.view.backgroundColor = [UIColor greenColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.autoresizesSubviews = YES;
    self.view.clipsToBounds = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
