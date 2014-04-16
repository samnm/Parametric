//
//  PMTween.h
//  Parametric
//

#import <Foundation/Foundation.h>

#import "PMEasing.h"

@class PMTween;

typedef void (^PMTweenUpdateBlock)(PMTween *tween);
typedef void (^PMTweenCompletionBlock)(PMTween *tween);

@interface PMTween : NSObject

@property (nonatomic, strong) PMTweenUpdateBlock updateBlock;
@property (nonatomic, strong) PMTweenUpdateBlock completionBlock;
@property (nonatomic, assign) PMEasingFunction easingFunction;

@property (nonatomic, readonly) CGFloat currentValue;
@property (nonatomic, readonly) CGFloat deltaTime;

@property (nonatomic, assign) CGFloat startValue;
@property (nonatomic, assign) CGFloat endValue;
@property (nonatomic, assign) CGFloat delay;
@property (nonatomic, assign) CGFloat duration;

+ (PMTween *)tween;
+ (PMTween *)tweenFrom:(CGFloat)start
                    to:(CGFloat)end
              duration:(CGFloat)duration
                  ease:(PMEasingFunction)ease
                 block:(PMTweenUpdateBlock)block;

- (void)addTween:(PMTween *)tween;
- (void)removeTween:(PMTween *)tween;

- (void)start;
- (void)stop;
- (void)pause;
- (void)resume;

@end
