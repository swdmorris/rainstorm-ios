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

- (id)initWithSpeed:(float)newSpeed
{
    self = [super init];
    
    self.speed = newSpeed;
    self.direction = CGPointMake(1, -1);
    self.frame = CGRectMake(0, 0, 1, 1);
    self.backgroundColor = [UIColor blueColor];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
