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

#import "objc/runtime.h"


@interface CTMediator (Te)


-(void)getName;
@end


@implementation CTMediator (Te)

-(void)getName{
    
    NSLog(@"dd") ;
}

@end

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
    
    
    CTMediator *mdeia = [CTMediator sharedInstance] ;
    
    
    unsigned int outCount;

    
    objc_property_t *properties =   class_copyMethodList([CTMediator class],&outCount);
    
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //通过property_getName函数获得属性的名字
        NSString * propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@ ",propertyName) ;

//        //通过property_getAttributes函数可以获得属性的名字和@encode编码
//        NSString * propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        
//         NSLog(@"%@ == %@",propertyName,propertyAttribute) ;
        
    }
    
    
    
    
    [[CTMediator sharedInstance]getName];
//    [[CTMediator sharedInstance]A_aViewController];
//    AViewController *viewController = [[AViewController alloc] init];
    UIViewController *viewController = [[CTMediator sharedInstance] getAViewController];

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
