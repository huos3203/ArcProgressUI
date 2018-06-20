//
//  JHViewController.m
//  ArcProgressUI
//
//  Created by huo3203@hotmail.com on 06/20/2018.
//  Copyright (c) 2018 huo3203@hotmail.com. All rights reserved.
//

#import "JHViewController.h"

@interface JHViewController ()

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *viewArr = [[NSBundle mainBundle] loadNibNamed:@"ArcProgressView" owner:nil options:nil];
    UIView *arcView = viewArr.lastObject;
    arcView.backgroundColor = [UIColor redColor];
    [self.view addSubview:arcView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
