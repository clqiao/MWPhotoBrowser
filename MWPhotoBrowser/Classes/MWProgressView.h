//
//  MWProgressView.h
//  artbiblebook
//
//  Created by mlion on 14-3-12.
//  Copyright (c) 2014年 mlion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWProgressViewProtocol.h"
#import "DACircularProgressView.h"

@interface MWProgressView : NSObject <MWProgressView>

@property (nonatomic, strong) DACircularProgressView *daCircularProgressView;

- (id)initWithFrame: (CGRect)frame;

@end
