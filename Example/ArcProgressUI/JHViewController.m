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
    [ArtTool logArcToo:self.view];
//    let podBundle = NSBundle(forClass: FrameworkVC.self)
//    [self setWindow];
}

-(void)setWindow
{
    NSBundle *podbundle = [NSBundle bundleForClass:[ArtTool class]];
     NSURL *bundleURL = [podbundle URLForResource:@"ArcProgressUI" withExtension:@"bundle"];
     NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
     UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:bundle];
     JHViewController *loginVC = [story instantiateInitialViewController];
    UIWindow *ww = [[UIApplication sharedApplication] windows].firstObject;
    ww.rootViewController = loginVC;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
