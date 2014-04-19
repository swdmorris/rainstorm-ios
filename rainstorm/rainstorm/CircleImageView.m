//
//  CircleImageView.m
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Rainstorm. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // custom code
    }
    return self;
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    
    [self setupCircleProperties];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupCircleProperties];
}

- (void)setupCircleProperties
{
    self.clipsToBounds = YES;
    
    if (self.frame.size.width < self.frame.size.height)
        self.layer.cornerRadius = self.frame.size.width / 2.0;
    else
        self.layer.cornerRadius = self.frame.size.height / 2.0;
    
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.borderWidth = 1.0f;
}

@end
