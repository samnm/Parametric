//
//  PMTween.m
//  Parametric
//

#import "PMTween.h"

@interface PMTween ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation PMTween {
    PMTweenEasingBlock _easingBlock;
    CFTimeInterval _timeExpired;
}

+ (PMTween *)tweenFrom:(CGFloat)start to:(CGFloat)end duration:(CGFloat)duration block:(PMTweenUpdateBlock)block {
    PMTween *tween = [[self alloc] init];
    tween.startValue = start;
    tween.endValue = end;
    tween.duration = duration;
    tween.updateBlock = block;
    return tween;
}

- (void)start {
    _currentValue = self.startValue;
    _timeExpired = 0;

    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stop {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)pause {
    self.displayLink.paused = YES;
}

- (void)resume {
    self.displayLink.paused = NO;
}

#pragma mark - Accessors

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];
    }
    return _displayLink;
}

- (PMTweenEasingBlock)easingBlock {
    if (!_easingBlock) {
        _easingBlock = ^(CGFloat t) {
            return t;
        };
    }
    return _easingBlock;
}

#pragma mark - Private
     
- (void)displayLinkTick:(CADisplayLink *)displayLink {
    _deltaTime = displayLink.duration;
    _timeExpired += _deltaTime;
    _currentValue = self.easingBlock(_timeExpired / self.duration) * (self.endValue - self.startValue);
    
    if (_timeExpired >= self.duration) {
        _deltaTime = self.duration - _timeExpired;
        _timeExpired = self.duration;
        _currentValue = self.endValue;
        [self stop];
        if (self.completionBlock) {
            self.completionBlock(self);
        }
    } else {
        if (self.updateBlock) {
            self.updateBlock(self);
        }
    }
}

@end
