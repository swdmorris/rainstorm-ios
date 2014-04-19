//
//  Ball.m
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Lakeview Labs. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize speed, direction;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
    return self;
}

@end
