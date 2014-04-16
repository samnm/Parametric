//
//  PMEasing.h
//  Parametric
//

typedef CGFloat (*PMEasingFunction)(CGFloat t);

CGFloat PMMap(CGFloat p, CGFloat s1, CGFloat e1, CGFloat s2, CGFloat e2);
CGFloat PMDelay(CGFloat p, CGFloat delay);
CGFloat PMPad(CGFloat p, CGFloat pad);

// Linear interpolation (no easing)
CGFloat PMLinearInterpolation(CGFloat p);

// Quadratic easing; p^2
CGFloat PMQuadraticEaseIn(CGFloat p);
CGFloat PMQuadraticEaseOut(CGFloat p);
CGFloat PMQuadraticEaseInOut(CGFloat p);

// Cubic easing; p^3
CGFloat PMCubicEaseIn(CGFloat p);
CGFloat PMCubicEaseOut(CGFloat p);
CGFloat PMCubicEaseInOut(CGFloat p);

// Quartic easing; p^4
CGFloat PMQuarticEaseIn(CGFloat p);
CGFloat PMQuarticEaseOut(CGFloat p);
CGFloat PMQuarticEaseInOut(CGFloat p);

// Quintic easing; p^5
CGFloat PMQuinticEaseIn(CGFloat p);
CGFloat PMQuinticEaseOut(CGFloat p);
CGFloat PMQuinticEaseInOut(CGFloat p);

// Sine wave easing; sin(p * PI/2)
CGFloat PMSineEaseIn(CGFloat p);
CGFloat PMSineEaseOut(CGFloat p);
CGFloat PMSineEaseInOut(CGFloat p);

// Circular easing; sqrt(1 - p^2)
CGFloat PMCircularEaseIn(CGFloat p);
CGFloat PMCircularEaseOut(CGFloat p);
CGFloat PMCircularEaseInOut(CGFloat p);

// Exponential easing, base 2
CGFloat PMExponentialEaseIn(CGFloat p);
CGFloat PMExponentialEaseOut(CGFloat p);
CGFloat PMExponentialEaseInOut(CGFloat p);

// Exponentially-damped sine wave easing
CGFloat PMElasticEaseIn(CGFloat p);
CGFloat PMElasticEaseOut(CGFloat p);
CGFloat PMElasticEaseInOut(CGFloat p);

// Overshooting cubic easing;
CGFloat PMBackEaseIn(CGFloat p);
CGFloat PMBackEaseOut(CGFloat p);
CGFloat PMBackEaseInOut(CGFloat p);

// Exponentially-decaying bounce easing
CGFloat PMBounceEaseIn(CGFloat p);
CGFloat PMBounceEaseOut(CGFloat p);
CGFloat PMBounceEaseInOut(CGFloat PMp);
