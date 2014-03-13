//
//  MWLoadFailView.m
//  artbiblebook
//
//  Created by mlion on 14-3-13.
//  Copyright (c) 2014年 mlion. All rights reserved.
//

#import "MWLoadFailView.h"

@interface MWLoadFailView ()

@property (strong, nonatomic) UIColor *overlayColor;

@end

@implementation MWLoadFailView {
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.overlayColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
        
        self.backgroundColor = [UIColor clearColor];
        
        // add single tap for article
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(singleTapAction)];
        singleTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleTap];
        
        // add double tap for article
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(doubleTapAction)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        
        [singleTap requireGestureRecognizerToFail:doubleTap];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    
    CGFloat errorGraphWidth = 3 * (MIN(width, height)) / 80.;
    CGFloat errorGraphRadius = 3 * (MIN(width, height)) / 16.;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, width / 2., height / 2.);
    CGContextScaleCTM(context, 1., -1.);
    CGContextSetRGBFillColor(context, 0., 0., 0., 0.5);
    CGContextSetFillColorWithColor(context, self.overlayColor.CGColor);
    
    CGMutablePathRef path0 = CGPathCreateMutable();
    CGPathMoveToPoint(path0, NULL, width / 2., 0.);
    CGPathAddLineToPoint(path0, NULL, width / 2., height / 2.);
    CGPathAddLineToPoint(path0, NULL, -width / 2., height / 2.);
    CGPathAddLineToPoint(path0, NULL, -width / 2., 0.);
    
    CGFloat a = (errorGraphWidth * M_SQRT2 / 2.); // small hypotenuse
    CGFloat b = (errorGraphRadius - errorGraphWidth / 2.) / M_SQRT2; // large straight edge

    CGPathAddLineToPoint(path0, NULL, -a, 0.);
    CGPathAddLineToPoint(path0, NULL, (-a - b), b);
    CGPathAddLineToPoint(path0, NULL, -b, (a + b));
    CGPathAddLineToPoint(path0, NULL, 0., a);
    CGPathAddLineToPoint(path0, NULL, b, (a + b));
    CGPathAddLineToPoint(path0, NULL, (a + b), b);
    CGPathAddLineToPoint(path0, NULL, a, 0.);
    CGPathAddLineToPoint(path0, NULL, width / 2., 0.);
    
    CGPathCloseSubpath(path0);
    
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGAffineTransform rotation = CGAffineTransformMakeScale(1., -1.);
    CGPathAddPath(path1, &rotation, path0);
    
    CGContextAddPath(context, path0);
    CGContextFillPath(context);
    CGPathRelease(path0);
    
    CGContextAddPath(context, path1);
    CGContextFillPath(context);
    CGPathRelease(path1);
}

- (void)singleTapAction {
    if ([_tapDelegate respondsToSelector:@selector(view:singleTapDetected:)])
		[_tapDelegate view:self singleTapDetected:Nil];
}

- (void)doubleTapAction {
}

@end
