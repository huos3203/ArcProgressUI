//
//  JHViewController.m
//  ArcProgressUI
//
//  Created by huo3203@hotmail.com on 06/20/2018.
//  Copyright (c) 2018 huo3203@hotmail.com. All rights reserved.
//

#import "JHViewController.h"
#import "ArtTool.h"
@interface JHViewController ()

@end

@implementation JHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ArtTool logArcToo:self.view];
}
- (IBAction)ibaPushVCAction:(id)sender {
    UIViewController *VC = [ArtTool VCFromStoryBoard];
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
