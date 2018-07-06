//
//  BDBSSystemConfigMonoitor.m
//  WoZaiJia
//

#import "BDBSSystemConfigMonoitor.h"

#import "WMAssistantBall.h"/** 监控助手 **/
#import "WMSandBoxViewController.h"

@interface BDBSSystemConfigMonoitor ()

@property (strong, nonatomic) WMAssistantBall *assistantBall;

@end

@implementation BDBSSystemConfigMonoitor

- (WMAssistantBall *)assistantBall {
    if (!_assistantBall) {
        _assistantBall = [[WMAssistantBall alloc] init];//一定要作为一个局部属性
        _assistantBall.addtionItems = @[@"沙盒"];     //额外加一些按钮 @"暗门", @"接口数", 
        _assistantBall.ballColor = [UIColor blueColor];       //按钮颜色
        _assistantBall.shapeColor = [UIColor redColor];           //移动时的光圈颜色
        [_assistantBall doWork];              //很重要 一定要调用

        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(panGestureRecognizer:)];
        [_assistantBall addGestureRecognizer:pan];
        __weak typeof(self) __self = self;
        //点击了某一个选项
        _assistantBall.selectBlock = ^(NSString *title, UIButton *button) {
            [__self doSelect:title];
        };
    }
    return _assistantBall;
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan {
    CGPoint point = [pan locationInView:KeyWindow];

    if (point.x <= self.assistantBall.bdbs_halfWidth) {
        point.x = self.assistantBall.bdbs_halfWidth;
    }
    if (point.x >= KeyWindow.bdbs_width - self.assistantBall.bdbs_halfWidth) {
        point.x = KeyWindow.bdbs_width - self.assistantBall.bdbs_halfWidth;
    }
    if (point.y <= self.assistantBall.bdbs_halfHeight) {
        point.y = self.assistantBall.bdbs_halfHeight;
    }
    if (point.y >= KeyWindow.bdbs_height - self.assistantBall.bdbs_halfHeight) {
        point.y = KeyWindow.bdbs_height - self.assistantBall.bdbs_halfHeight;
    }

    self.assistantBall.center = point;
}

- (void)startObserver {
    [self.assistantBall startObserver];
}

- (void)stopObserver {
    [self.assistantBall stopObserver];
}

- (void)doSelect:(NSString *)title {
    if ([title isEqualToString:@"CPU"]) {
        [self.assistantBall makeChart:1 pCtrl:TopestViewController];
    }
    else if ([title isEqualToString:@"内存"]) {
        [self.assistantBall makeChart:2 pCtrl:TopestViewController];
    }
    else if ([title isEqualToString:@"下载"]) {
        [self.assistantBall makeChart:3 pCtrl:TopestViewController];
    }
    else if ([title isEqualToString:@"上传"]) {
        [self.assistantBall makeChart:4 pCtrl:TopestViewController];
    }
    else if ([title isEqualToString:@"沙盒"]) {
        WMSandBoxViewController *sCtrl = [[WMSandBoxViewController alloc] init];
        [TopestNavigationController pushViewController:sCtrl animated:YES];
    }
}

@end
