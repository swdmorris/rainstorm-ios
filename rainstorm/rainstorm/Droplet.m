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
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 3, 3)];
    if (self) {
        // Initialization code
        self.speed = 1.0;
        CGFloat speedX = ((CGFloat)rand() / RAND_MAX) * 1.0 - 0.5; // -0.5 to 0.5
        CGFloat speedY = ((CGFloat)rand() / RAND_MAX) * 2.0 - 0.5; // -0.5 to 1.5
        self.direction = CGPointMake(speedX, speedY);
        
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
