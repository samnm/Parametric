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
    
    PMTween *blueTween = [PMTween tween:^(CGFloat t) {
        t = PMExponentialEaseInOut(t);
        CGSize bounds = blueBox.superview.frame.size;
        blueBox.frame = CGRectMake((bounds.width - 20) * t,
                                   bounds.height / 2,
                                   20,
                                   20);
    }];
    PMTween *redTween = [PMTween tween:^(CGFloat t) {
        t = PMExponentialEaseInOut(t);
        CGSize bounds = redBox.superview.frame.size;
        redBox.frame = CGRectMake((bounds.width - 20) * t,
                                   bounds.height / 2 + 30,
                                   20,
                                   20);
    }];
    [[PMTween tween:^(CGFloat t) {
        blueTween.currentValue = PMPad(t, 0.5);
        redTween.currentValue = PMDelay(t, 0.5);
    }] animateWithDuration:3.0];
}

@end
