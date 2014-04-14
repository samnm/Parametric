//
//  PMSampleAppViewController.m
//  Parametric
//

#import "PMSampleAppViewController.h"

#import "PMTween.h"

@implementation PMSampleAppViewController {
    UIView *_boxView;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view = view;
    
    _boxView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 20, 20)];
    _boxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_boxView];
    
    PMTween *tween = [PMTween tweenFrom:0 to:1 duration:3 block:^(PMTween *tween) {
        _boxView.frame = CGRectMake(10 + 100 * tween.currentValue, 100, 20, 20);
    }];
    tween.completionBlock = ^(PMTween *tween) {
        [tween start];
    };
    tween.easingBlock = ^(CGFloat t) {
        NSLog(@"%.2f", t);
        return PMQuadraticEaseInOut(t);
    };
    [tween start];
}
@end
