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
    UIViewController *VC = [ArtTool VCFromStoryBoard:StaticScoreStyle];
    [self presentViewController:VC animated:YES completion:nil];
}

- (IBAction)ibAddStaticScoreAction:(id)sender {
    UIViewController *VC = [ArtTool VCFromStoryBoard:AddStaticScoreStyle];
    [self presentViewController:VC animated:YES completion:nil];
}
- (IBAction)ibaDyScoreAction:(id)sender {
    UIViewController *VC = [ArtTool VCFromStoryBoard:DynamicScoreStyle];
    [self presentViewController:VC animated:YES completion:nil];
}
- (IBAction)ibDyRiskAction:(id)sender {
    UIViewController *VC = [ArtTool VCFromStoryBoard:DynamicRiskScoreStyle];
    [self presentViewController:VC animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
