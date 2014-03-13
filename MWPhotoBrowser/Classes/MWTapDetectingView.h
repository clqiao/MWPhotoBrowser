//
//  UIViewTap.h
//  Momento
//
//  Created by Michael Waterfall on 04/11/2009.
//  Copyright 2009 d3i. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MWTapDetectingViewDelegate;

@interface MWTapDetectingView : UIView {}

@property (nonatomic, weak) id <MWTapDetectingViewDelegate> tapDelegate;

@end
