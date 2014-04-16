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
        CGSize bounds = _boxView.superview.frame.size;
        _boxView.frame = CGRectMake((bounds.width - 20) * tween.currentValue,
                                    bounds.height / 2,
                                    20,
                                    20);
    }];
    tween.completionBlock = ^(PMTween *tween) {
        [tween start];
    };
    tween.easingBlock = ^(CGFloat t) {
        return PMQuadraticEaseInOut(t);
    };
    [tween start];
}

@end
