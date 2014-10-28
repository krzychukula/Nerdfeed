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
@property (nonatomic, copy) NSArray *courses;

@end

@implementation CoursesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"Courses";
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
        [self fetchFeed];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSDictionary *course = self.courses[indexPath.row];
    cell.textLabel.text = course[@"title"];
    
    return cell;
}

- (void)fetchFeed
{
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session
                                      dataTaskWithRequest:req
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                         
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                 options:0
                                                                                                   error:nil];
                                            self.courses = json[@"courses"];
                                            NSLog(@"%@", self.courses);
                                            
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                [self.tableView reloadData];
                                            });
                                                         
                                    }];
    [dataTask resume];
}


@end
