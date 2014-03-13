//
//  MWLoadFailView.h
//  artbiblebook
//
//  Created by mlion on 14-3-13.
//  Copyright (c) 2014年 mlion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWProgressViewProtocol.h"

@interface MWLoadFailView : UIView

@property (nonatomic, weak) id <MWTapDetectingViewDelegate> tapDelegate;

@end
