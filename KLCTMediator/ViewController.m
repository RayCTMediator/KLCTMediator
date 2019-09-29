//
//  ViewController.m
//  KLCTMediator
//
//  Created by WKL on 2019/9/28.
//  Copyright © 2019 Ray. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
//#import "AViewController.h"
#import <AProject_Category/CTMediator+A.h>

@interface ViewController ()
@property (nonatomic, strong) UIButton *pushAViewControllerButton;


@end

@implementation ViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.pushAViewControllerButton];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.pushAViewControllerButton sizeToFit];
    [self.pushAViewControllerButton  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

#pragma mark - event response
- (void)didTappedPushAViewControllerButton:(UIButton *)button
{
//    AViewController *viewController = [[AViewController alloc] init];
    UIViewController *viewController = [[CTMediator sharedInstance] A_aViewController];

    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - getters and setters
- (UIButton *)pushAViewControllerButton
{
    if (_pushAViewControllerButton == nil) {
        _pushAViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushAViewControllerButton setTitle:@"push A view controller" forState:UIControlStateNormal];
        [_pushAViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_pushAViewControllerButton addTarget:self action:@selector(didTappedPushAViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushAViewControllerButton;
}

@end
