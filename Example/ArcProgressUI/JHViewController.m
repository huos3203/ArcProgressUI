//
//  JHViewController.m
//  ArcProgressUI
//
//  Created by huo3203@hotmail.com on 06/20/2018.
//  Copyright (c) 2018 huo3203@hotmail.com. All rights reserved.
//

#import "JHViewController.h"
#import "ArcProgressView.h"
#import "ArtTool.h"
@interface JHViewController ()

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [ArcProgressView installTo:self.view];
    [ArtTool logArcToo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
