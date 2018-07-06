//
//  WMAssistantNavigationController.m
//

#import "WMAssistantNavigationController.h"

@interface WMAssistantNavigationController ()

@end

@implementation WMAssistantNavigationController

//支持旋转
- (BOOL)shouldAutorotate {
    return NO;
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft;
}

// 一开始的方向  很重要
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft;
}


@end
