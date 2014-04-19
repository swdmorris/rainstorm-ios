//
//  Droplet.m
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Lakeview Labs. All rights reserved.
//

#import "Droplet.h"

@implementation Droplet

@synthesize speed, direction;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 3, 3)];
    if (self) {
        // Initialization code
        self.speed = 1.0;
        CGFloat azim = ((CGFloat)rand() / RAND_MAX) * 2.0 - 1.0;
        self.direction = CGPointMake(azim, 1 - fabs(azim));
        
        CGFloat redLevel    = rand() / (float) RAND_MAX;
        CGFloat greenLevel  = rand() / (float) RAND_MAX;
        CGFloat blueLevel   = rand() / (float) RAND_MAX;
        self.backgroundColor = [UIColor colorWithRed: redLevel
                                                 green: greenLevel
                                                  blue: blueLevel
                                                 alpha: 1.0];
    }
    return self;
}

@end
