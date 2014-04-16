//
//  PMTween.h
//  Parametric
//

#import <Foundation/Foundation.h>

#import "PMEasing.h"

@class PMTween;

typedef void (^PMTweenUpdateBlock)(CGFloat t);
typedef void (^PMTweenCompletionBlock)(PMTween *tween);

@interface PMTween : NSObject

@property (nonatomic, strong) PMTweenUpdateBlock updateBlock;
@property (nonatomic, strong) PMTweenCompletionBlock completionBlock;

@property (nonatomic, assign) CGFloat currentValue;

+ (PMTween *)tween;
+ (PMTween *)tween:(PMTweenUpdateBlock)block;

- (void)animateWithDuration:(CFTimeInterval)duration;
- (void)animateWithDuration:(CFTimeInterval)duration delay:(CFTimeInterval)delay;
- (void)stop;
- (void)pause;
- (void)resume;

@end
