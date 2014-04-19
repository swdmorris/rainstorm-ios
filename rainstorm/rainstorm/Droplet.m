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
    self = [super initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 1, 1)];
    if (self) {
        // Initialization code
        self.speed = 1.0;
        self.direction = CGPointMake(1, -1);
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
