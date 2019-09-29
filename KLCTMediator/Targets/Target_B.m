//
//  Target_B.m
//  KLCTMediator
//
//  Created by WKL on 2019/9/29.
//  Copyright © 2019 Ray. All rights reserved.
//

#import "Target_B.h"
#import "BViewController.h"

@implementation Target_B

- (UIViewController *)Action_viewController:(NSDictionary *)params
{
    NSString *contentText = params[@"contentText"];
    BViewController *viewController = [[BViewController alloc] initWithContentText:contentText];
    return viewController;
}

@end
