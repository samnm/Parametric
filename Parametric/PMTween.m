//
//  PMTween.m
//  Parametric
//

#import "PMTween.h"

@interface PMTween ()
@property (nonatomic, readonly) BOOL complete;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) NSMutableArray *children;
@end

@implementation PMTween {
    CFTimeInterval _timeExpired;
}

+ (PMTween *)tween {
    return [[self alloc] init];
}

+ (PMTween *)tweenFrom:(CGFloat)start
                    to:(CGFloat)end
              duration:(CGFloat)duration
                  ease:(PMEasingFunction)ease
                 block:(PMTweenUpdateBlock)block {
    PMTween *tween = [self tween];
    tween.startValue = start;
    tween.endValue = end;
    tween.duration = duration;
    tween.easingFunction = ease;
    tween.updateBlock = block;
    return tween;
}

- (void)addTween:(PMTween *)tween {
    [self.children addObject:tween];
}

- (void)removeTween:(PMTween *)tween {
    [self.children removeObject:tween];
}

- (void)start {
    _currentValue = self.startValue;
    _timeExpired = -self.delay;

    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

    for (PMTween *tween in self.children) {
        tween->_currentValue = tween.startValue;
        tween->_timeExpired = -tween.delay;
    }
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

- (PMEasingFunction)easingFunction {
    if (!_easingFunction) {
        _easingFunction = PMLinearInterpolation;
    }
    return _easingFunction;
}

- (NSMutableArray *)children {
    if (!_children) {
        _children = [NSMutableArray array];
    }
    return _children;
}

#pragma mark - Private
     
- (void)displayLinkTick:(CADisplayLink *)displayLink {
    _deltaTime = displayLink.duration;
    _timeExpired += _deltaTime;
    _currentValue = self.easingFunction(_timeExpired / self.duration) * (self.endValue - self.startValue) + self.startValue;
    
    BOOL isRunning = NO;
    if (_timeExpired >= self.duration) {
        _deltaTime = self.duration - _timeExpired;
        _timeExpired = self.duration;
        _currentValue = self.endValue;
    } else if (_timeExpired >= 0) {
        if (self.updateBlock) {
            self.updateBlock(self);
        }
        isRunning = YES;
    }
    
    for (PMTween *tween in self.children) {
        [tween displayLinkTick:displayLink];
        if (tween->_timeExpired < tween.duration) {
            isRunning = YES;
        }
    }
    
    if (!isRunning) {
        [self stop];
        if (self.completionBlock) {
            self.completionBlock(self);
        }
    }
}

@end
