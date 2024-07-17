//
//  SceneDelegate.m
//  CompactSplitView
//
//  Created by Jinwoo Kim on 7/17/24.
//

#import "SceneDelegate.h"
#import "UISplitViewController+AlwaysExpanded.h"

@interface SceneDelegate ()
@end

@implementation SceneDelegate

- (void)dealloc {
    [_window release];
    [super dealloc];
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    
    UISplitViewController *splitViewController = [[UISplitViewController alloc] initWithStyle:UISplitViewControllerStyleTripleColumn];
    
    UIViewController *orangeViewController = [UIViewController new];
    UIViewController *cyanViewController = [UIViewController new];
    UIViewController *pinkViewController = [UIViewController new];
    
    orangeViewController.view.backgroundColor = UIColor.systemOrangeColor;
    cyanViewController.view.backgroundColor = UIColor.systemCyanColor;
    pinkViewController.view.backgroundColor = UIColor.systemPinkColor;
    
    [splitViewController setViewController:orangeViewController forColumn:UISplitViewControllerColumnPrimary];
    [splitViewController setViewController:cyanViewController forColumn:UISplitViewControllerColumnSecondary];
    [splitViewController setViewController:pinkViewController forColumn:UISplitViewControllerColumnSupplementary];
    
    [orangeViewController release];
    [cyanViewController release];
    [pinkViewController release];
    
    splitViewController.displayModeButtonVisibility = UISplitViewControllerDisplayModeButtonVisibilityNever;
    splitViewController.cs_alwaysExpanded = YES;
    
    window.rootViewController = splitViewController;
    [splitViewController release];
    
    self.window = window;
    [window makeKeyAndVisible];
    [window release];
}

@end
