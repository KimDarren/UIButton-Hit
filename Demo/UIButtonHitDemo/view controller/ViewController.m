//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    Version 2, December 2004
//
//    Copyright (C) 2013-2015 KIM TAE JUN <korean.darren@gmail.com>
//
//    Everyone is permitted to copy and distribute verbatim or modified
//    copies of this license document, and changing it is allowed as long
//    as the name is changed.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//    0. You just DO WHAT THE FUCK YOU WANT TO.

#import "ViewController.h"

// Extension
#import "UIButton+HitExtension.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic) UIButton *demoButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Initialize message label
    _messageLabel = [[UILabel alloc] init];
    _messageLabel.text = @"You should touch (or click in simulator) nearside of button below.";
    _messageLabel.textColor = [UIColor blackColor];
    _messageLabel.numberOfLines = 0;
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    
    // Initialize demo button
    _demoButton = [[UIButton alloc] init];
    _demoButton.clipsToBounds = YES;
    _demoButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.4f];
    _demoButton.layer.cornerRadius = 6.0f;
    [_demoButton setTitle:@"DEMO BUTTON" forState:UIControlStateNormal];
    [_demoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_demoButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_demoButton addTarget:self action:@selector(showAlertWithButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // =============================================
    //          THE IMPORTANT LINE BELOW :D
    // =============================================
    _demoButton.hitEdgeInsets = UIEdgeInsetsMake(-100.0f, -30.0f, -100.0f, -30.0f);
    
    [self.view addSubview:_demoButton];
    [self.view addSubview:_messageLabel];
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
    
    _messageLabel.frame = CGRectMake(0, 0, viewWidth, 100.0f);
}

#pragma mark - Action

- (void)showAlertWithButton:(UIButton *)demoButton
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@"It works!"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Close"
                                                          style:UIAlertActionStyleDefault
                                                        handler:nil];
    [alertController addAction:closeAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
