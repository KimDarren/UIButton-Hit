//
//  ViewController.m
//  UIButtonHitDemo
//
//  Created by KimTae jun on 2015. 11. 13..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "ViewController.h"

// Extension
#import "UIButton+HitExtension.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *demoButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _demoButton = [[UIButton alloc] init];
    _demoButton.clipsToBounds = YES;
    _demoButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.4f];
    _demoButton.layer.cornerRadius = 6.0f;
    _demoButton.hitEdgeInsets = UIEdgeInsetsMake(-30.0f, -30.0f, -30.0f, -30.0f);
    
    [_demoButton setTitle:@"DEMO BUTTON" forState:UIControlStateNormal];
    [_demoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:_demoButton];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat viewWidth = CGRectGetWidth(self.view.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.view.bounds);
    CGFloat buttonWidth = 150.0f;
    CGFloat buttonHeight = 50.0f;
    
    _demoButton.frame = CGRectMake((viewWidth - buttonWidth)/2.0f,
                                   (viewHeight - buttonHeight)/2.0f,
                                   buttonWidth,
                                   buttonHeight);
}

@end
