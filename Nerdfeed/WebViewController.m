//
//  WebViewController.m
//  Nerdfeed
//
//  Created by Krzysztof Kula on 28/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    //if this bar button item does not have a title, it will not apprear at all
    barButtonItem.title = @"Courses";
    
    //Take this bar burron item and put it on the left side of the nav item
    self.navigationItem.leftBarButtonItem = barButtonItem;
}
@end
