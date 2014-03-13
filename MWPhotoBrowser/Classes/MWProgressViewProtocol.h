//
//  MWProgressViewProtocol.h
//  MWPhotoBrowser
//
//  Created by Michael Waterfall on 02/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWTapDetectingViewProtocol.h"


@protocol MWProgressView <NSObject>

@required

@property (nonatomic, readonly) UIView* progressView;

@property (nonatomic) CGRect progressViewFrame;
@property (nonatomic) BOOL hidden;
@property (nonatomic) CGFloat progress;

@optional

@property (nonatomic, weak) id <MWTapDetectingViewDelegate> tapDelegate;

@end
