//
//  PMTween.h
//  Parametric
//

#import <Foundation/Foundation.h>

#import "PMEasing.h"

@class PMTween;

typedef void (^PMTweenUpdateBlock)(PMTween *tween);
typedef void (^PMTweenCompletionBlock)(PMTween *tween);
typedef CGFloat (^PMTweenEasingBlock)(CGFloat t);

@interface PMTween : NSObject

@property (nonatomic, strong) PMTweenUpdateBlock updateBlock;
@property (nonatomic, strong) PMTweenUpdateBlock completionBlock;
@property (nonatomic, strong) PMTweenEasingBlock easingBlock;

@property (nonatomic, readonly) CGFloat currentValue;
@property (nonatomic, readonly) CGFloat deltaTime;

@property (nonatomic, assign) CGFloat startValue;
@property (nonatomic, assign) CGFloat endValue;
@property (nonatomic, assign) CGFloat duration;

+ (PMTween *)tweenFrom:(CGFloat)start to:(CGFloat)end duration:(CGFloat)duration block:(PMTweenUpdateBlock)block;

- (void)start;
- (void)stop;
- (void)pause;
- (void)resume;

@end
