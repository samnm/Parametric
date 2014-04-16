//
//  PMTween.m
//  Parametric
//

#import "PMTween.h"

@interface PMTween ()
@property (nonatomic, readonly) BOOL complete;
@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation PMTween {
    CFTimeInterval _duration;
    CFTimeInterval _timeExpired;
}

+ (PMTween *)tween {
    return [[self alloc] init];
}

+ (PMTween *)tween:(PMTweenUpdateBlock)block {
    PMTween *tween = [self tween];
    tween.updateBlock = block;
    return tween;
}

- (void)animateWithDuration:(CFTimeInterval)duration {
    [self animateWithDuration:duration delay:0];
}

- (void)animateWithDuration:(CFTimeInterval)duration delay:(CFTimeInterval)delay {
    _timeExpired = -delay;
    _duration = duration;
    
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

- (void)setCurrentValue:(CGFloat)currentValue {
    _currentValue = currentValue;
    [self update];
}

#pragma mark - Private
     
- (void)displayLinkTick:(CADisplayLink *)displayLink {
    CGFloat deltaTime = displayLink.duration;
    _timeExpired += deltaTime;
    _currentValue = _timeExpired / _duration;
    
    if (_timeExpired >= _duration) {
        deltaTime = _duration - _timeExpired;
        _timeExpired = _duration;
        _currentValue = 1.0;
    }
    if (_timeExpired >= 0) {
        [self update];
    }
    
    if (_timeExpired >= _duration) {
        [self stop];
        if (self.completionBlock) {
            self.completionBlock(self);
        }
    }
}

- (void)update {
    if (self.updateBlock) {
        self.updateBlock(_currentValue);
    }
}

@end
