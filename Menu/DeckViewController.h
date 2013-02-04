//
//  MenuViewController.h
//  Menu
//
//  Created by Anton Byrna on 2/4/13.
//  Copyright (c) 2013 Anton Byrna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeckViewController : UIViewController

@property (nonatomic, readonly, getter = isMenuOpen) BOOL menuOpen;
@property (nonatomic, strong) UIViewController *activeViewController;

- (id)initWithMenuViewController:(UIViewController *)menuViewController activeViewController:(UIViewController *)activeViewController;

- (void)openMenuAnimated:(BOOL)animated;

- (void)closeMenuAnimated:(BOOL)animated;

@end


// category on UIViewController to provide access to the menuController in the
// contained view controllers, a la UINavigationController.
@interface UIViewController (DeckController)

@property (nonatomic, readonly) DeckViewController *deckController;

@end
