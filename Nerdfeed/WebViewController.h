//
//  WebViewController.h
//  Nerdfeed
//
//  Created by Krzysztof Kula on 28/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic) NSURL *URL;

@end
