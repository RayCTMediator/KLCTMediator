//
//  BViewController.m
//  KLCTMediator
//
//  Created by WKL on 2019/9/29.
//  Copyright © 2019 Ray. All rights reserved.
//

#import "BViewController.h"
#import <Masonry.h>

@interface BViewController ()
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation BViewController

#pragma mark - life cycle
- (instancetype)initWithContentText:(NSString *)contentText
{
    self = [super init];
    if (self) {
        self.contentLabel.text = contentText;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentLabel];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.contentLabel sizeToFit];
 
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

#pragma mark - getters and setters
- (UILabel *)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blueColor];
    }
    return _contentLabel;
}



@end
