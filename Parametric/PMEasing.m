//
//  PMEasing.m
//  Parametric
//

#import "PMEasing.h"

CGFloat PMMap(CGFloat p, CGFloat s1, CGFloat e1, CGFloat s2, CGFloat e2) {
    return ((p - s1) / (e1 - s1)) * (e2 - s2) + s2;
}

CGFloat PMDelay(CGFloat p, CGFloat delay) {
    if (p > delay) {
        return PMMap(p, delay, 1.0, 0, 1.0);
    } else {
        return 0;
    }
}

CGFloat PMPad(CGFloat p, CGFloat pad) {
    if (p < pad) {
        return PMMap(p, 0, pad, 0, 1.0);
    } else {
        return 1;
    }
}

// Modeled after the line y = x
CGFloat PMLinearInterpolation(CGFloat p)
{
  return p;
}

// Modeled after the parabola y = x^2
CGFloat PMQuadraticEaseIn(CGFloat p)
{
  return p * p;
}

// Modeled after the parabola y = -x^2 + 2x
CGFloat PMQuadraticEaseOut(CGFloat p)
{
  return -(p * (p - 2));
}

// Modeled after the piecewise quadratic
// y = (1/2)((2x)^2)             ; [0, 0.5)
// y = -(1/2)((2x-1)*(2x-3) - 1) ; [0.5, 1]
CGFloat PMQuadraticEaseInOut(CGFloat p)
{
  if(p < 0.5)
  {
    return 2 * p * p;
  }
  else
  {
    return (-2 * p * p) + (4 * p) - 1;
  }
}

// Modeled after the cubic y = x^3
CGFloat PMCubicEaseIn(CGFloat p)
{
  return p * p * p;
}

// Modeled after the cubic y = (x - 1)^3 + 1
CGFloat PMCubicEaseOut(CGFloat p)
{
  CGFloat f = (p - 1);
  return f * f * f + 1;
}

// Modeled after the piecewise cubic
// y = (1/2)((2x)^3)       ; [0, 0.5)
// y = (1/2)((2x-2)^3 + 2) ; [0.5, 1]
CGFloat PMCubicEaseInOut(CGFloat p)
{
  if(p < 0.5)
  {
    return 4 * p * p * p;
  }
  else
  {
    CGFloat f = ((2 * p) - 2);
    return 0.5 * f * f * f + 1;
  }
}

// Modeled after the quartic x^4
CGFloat PMQuarticEaseIn(CGFloat p)
{
  return p * p * p * p;
}

// Modeled after the quartic y = 1 - (x - 1)^4
CGFloat PMQuarticEaseOut(CGFloat p)
{
  CGFloat f = (p - 1);
  return f * f * f * (1 - p) + 1;
}

// Modeled after the piecewise quartic
// y = (1/2)((2x)^4)        ; [0, 0.5)
// y = -(1/2)((2x-2)^4 - 2) ; [0.5, 1]
CGFloat PMQuarticEaseInOut(CGFloat p) 
{
  if(p < 0.5)
  {
    return 8 * p * p * p * p;
  }
  else
  {
    CGFloat f = (p - 1);
    return -8 * f * f * f * f + 1;
  }
}

// Modeled after the quintic y = x^5
CGFloat PMQuinticEaseIn(CGFloat p) 
{
  return p * p * p * p * p;
}

// Modeled after the quintic y = (x - 1)^5 + 1
CGFloat PMQuinticEaseOut(CGFloat p) 
{
  CGFloat f = (p - 1);
  return f * f * f * f * f + 1;
}

// Modeled after the piecewise quintic
// y = (1/2)((2x)^5)       ; [0, 0.5)
// y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]
CGFloat PMQuinticEaseInOut(CGFloat p) 
{
  if(p < 0.5)
  {
    return 16 * p * p * p * p * p;
  }
  else
  {
    CGFloat f = ((2 * p) - 2);
    return  0.5 * f * f * f * f * f + 1;
  }
}

// Modeled after quarter-cycle of sine wave
CGFloat PMSineEaseIn(CGFloat p)
{
  return sin((p - 1) * M_PI_2) + 1;
}

// Modeled after quarter-cycle of sine wave (different phase)
CGFloat PMSineEaseOut(CGFloat p)
{
  return sin(p * M_PI_2);
}

// Modeled after half sine wave
CGFloat PMSineEaseInOut(CGFloat p)
{
  return 0.5 * (1 - cos(p * M_PI));
}

// Modeled after shifted quadrant IV of unit circle
CGFloat PMCircularEaseIn(CGFloat p)
{
  return 1 - sqrt(1 - (p * p));
}

// Modeled after shifted quadrant II of unit circle
CGFloat PMCircularEaseOut(CGFloat p)
{
  return sqrt((2 - p) * p);
}

// Modeled after the piecewise circular function
// y = (1/2)(1 - sqrt(1 - 4x^2))           ; [0, 0.5)
// y = (1/2)(sqrt(-(2x - 3)*(2x - 1)) + 1) ; [0.5, 1]
CGFloat PMCircularEaseInOut(CGFloat p)
{
  if(p < 0.5)
  {
    return 0.5 * (1 - sqrt(1 - 4 * (p * p)));
  }
  else
  {
    return 0.5 * (sqrt(-((2 * p) - 3) * ((2 * p) - 1)) + 1);
  }
}

// Modeled after the exponential function y = 2^(10(x - 1))
CGFloat PMExponentialEaseIn(CGFloat p)
{
  return (p == 0.0) ? p : pow(2, 10 * (p - 1));
}

// Modeled after the exponential function y = -2^(-10x) + 1
CGFloat PMExponentialEaseOut(CGFloat p)
{
  return (p == 1.0) ? p : 1 - pow(2, -10 * p);
}

// Modeled after the piecewise exponential
// y = (1/2)2^(10(2x - 1))         ; [0,0.5)
// y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]
CGFloat PMExponentialEaseInOut(CGFloat p)
{
  if(p == 0.0 || p == 1.0) return p;

  if(p < 0.5)
  {
    return 0.5 * pow(2, (20 * p) - 10);
  }
  else
  {
    return -0.5 * pow(2, (-20 * p) + 10) + 1;
  }
}

// Modeled after the damped sine wave y = sin(13pi/2*x)*pow(2, 10 * (x - 1))
CGFloat PMElasticEaseIn(CGFloat p)
{
  return sin(13 * M_PI_2 * p) * pow(2, 10 * (p - 1));
}

// Modeled after the damped sine wave y = sin(-13pi/2*(x + 1))*pow(2, -10x) + 1
CGFloat PMElasticEaseOut(CGFloat p)
{
  return sin(-13 * M_PI_2 * (p + 1)) * pow(2, -10 * p) + 1;
}

// Modeled after the piecewise exponentially-damped sine wave:
// y = (1/2)*sin(13pi/2*(2*x))*pow(2, 10 * ((2*x) - 1))      ; [0,0.5)
// y = (1/2)*(sin(-13pi/2*((2x-1)+1))*pow(2,-10(2*x-1)) + 2) ; [0.5, 1]
CGFloat PMElasticEaseInOut(CGFloat p)
{
  if(p < 0.5)
  {
    return 0.5 * sin(13 * M_PI_2 * (2 * p)) * pow(2, 10 * ((2 * p) - 1));
  }
  else
  {
    return 0.5 * (sin(-13 * M_PI_2 * ((2 * p - 1) + 1)) * pow(2, -10 * (2 * p - 1)) + 2);
  }
}

// Modeled after the overshooting cubic y = x^3-x*sin(x*pi)
CGFloat PMBackEaseIn(CGFloat p)
{
  return p * p * p - p * sin(p * M_PI);
}

// Modeled after overshooting cubic y = 1-((1-x)^3-(1-x)*sin((1-x)*pi))
CGFloat PMBackEaseOut(CGFloat p)
{
  CGFloat f = (1 - p);
  return 1 - (f * f * f - f * sin(f * M_PI));
}

// Modeled after the piecewise overshooting cubic function:
// y = (1/2)*((2x)^3-(2x)*sin(2*x*pi))           ; [0, 0.5)
// y = (1/2)*(1-((1-x)^3-(1-x)*sin((1-x)*pi))+1) ; [0.5, 1]
CGFloat PMBackEaseInOut(CGFloat p)
{
  if(p < 0.5)
  {
    CGFloat f = 2 * p;
    return 0.5 * (f * f * f - f * sin(f * M_PI));
  }
  else
  {
    CGFloat f = (1 - (2*p - 1));
    return 0.5 * (1 - (f * f * f - f * sin(f * M_PI))) + 0.5;
  }
}

CGFloat PMBounceEaseIn(CGFloat p)
{
  return 1 - PMBounceEaseOut(1 - p);
}

CGFloat PMBounceEaseOut(CGFloat p)
{
  if(p < 4/11.0)
  {
    return (121 * p * p)/16.0;
  }
  else if(p < 8/11.0)
  {
    return (363/40.0 * p * p) - (99/10.0 * p) + 17/5.0;
  }
  else if(p < 9/10.0)
  {
    return (4356/361.0 * p * p) - (35442/1805.0 * p) + 16061/1805.0;
  }
  else
  {
    return (54/5.0 * p * p) - (513/25.0 * p) + 268/25.0;
  }
}

CGFloat PMBounceEaseInOut(CGFloat p)
{
  if(p < 0.5)
  {
    return 0.5 * PMBounceEaseIn(p*2);
  }
  else
  {
    return 0.5 * PMBounceEaseOut(p * 2 - 1) + 0.5;
  }
}
