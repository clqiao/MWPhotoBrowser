//
//  MWProgressView.m
//  artbiblebook
//
//  Created by mlion on 14-3-12.
//  Copyright (c) 2014年 mlion. All rights reserved.
//

#import "MWProgressView.h"
#import "MWCommon.h"

@implementation MWProgressView

// synth property from protocol
@synthesize progressView = _progressView;
@synthesize progressViewFrame = _progressViewFrame;
@synthesize hidden = _hidden;
@synthesize progress = _progress;


- (id)initWithFrame: (CGRect)frame {
    self = [super init];
    if (self) {
        // Loading indicator
        self.daCircularProgressView = [[DACircularProgressView alloc] initWithFrame:frame];
        self.daCircularProgressView.userInteractionEnabled = NO;
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
            self.daCircularProgressView.thicknessRatio = 0.1;
            self.daCircularProgressView.roundedCorners = NO;
        } else {
            self.daCircularProgressView.thicknessRatio = 0.2;
            self.daCircularProgressView.roundedCorners = YES;
        }

        self.daCircularProgressView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    
    return self;
}

- (UIView*)progressView {
    return self.daCircularProgressView;
}

- (CGRect)progressViewFrame {
    return self.daCircularProgressView.frame;
}

- (void)setProgressViewFrame: (CGRect)progressViewFrame {
    self.daCircularProgressView.frame = progressViewFrame;
}

- (BOOL)hidden {
    return self.daCircularProgressView.hidden;
}

- (void)setHidden: (BOOL)hidden {
    self.daCircularProgressView.hidden = hidden;
}

- (CGFloat)progress {
    return self.daCircularProgressView.progress;
}

- (void)setProgress: (CGFloat)progress{
    self.daCircularProgressView.progress = progress;
}

@end
