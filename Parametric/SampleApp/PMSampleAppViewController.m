//
//  PMSampleAppViewController.m
//  Parametric
//

#import "PMSampleAppViewController.h"

#import "PMTween.h"

@implementation PMSampleAppViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view = view;
    
    UIView *blueBox = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 20, 20)];
    blueBox.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueBox];
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectMake(10, 140, 20, 20)];
    redBox.backgroundColor = [UIColor redColor];
    [self.view addSubview:redBox];
    
    PMTween *tween = [PMTween tween];
    [tween addTween:[PMTween tweenFrom:0 to:1 duration:3 ease:PMQuadraticEaseInOut block:^(PMTween *tween) {
        CGSize bounds = blueBox.superview.frame.size;
        blueBox.frame = CGRectMake((bounds.width - 20) * tween.currentValue,
                                   bounds.height / 2,
                                   20,
                                   20);
    }]];
    [tween addTween:[PMTween tweenFrom:0 to:1 duration:3 ease:PMQuinticEaseInOut block:^(PMTween *tween) {
        CGSize bounds = redBox.superview.frame.size;
        redBox.frame = CGRectMake((bounds.width - 20) * tween.currentValue,
                                   bounds.height / 2 + 30,
                                   20,
                                   20);
    }]];
    tween.completionBlock = ^(PMTween *tween) {
        [tween start];
    };
    [tween start];
}

@end
