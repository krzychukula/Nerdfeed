//
//  CoursesViewController.m
//  Nerdfeed
//
//  Created by Krzysztof Kula on 28/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "CoursesViewController.h"

@interface CoursesViewController ()

@property (nonatomic) NSURLSession *session;

@end

@implementation CoursesViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"Courses";
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
    }
    NSLog(@"initWithStyle");
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"get num of rows");
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
