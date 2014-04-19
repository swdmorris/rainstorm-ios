//
//  UserData.m
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Lakeview Labs. All rights reserved.
//

#import "UserData.h"

static UserData *gInstance = NULL;

@implementation UserData


+ (UserData *)instance
{
    @synchronized(self)
    {
        if (gInstance == NULL) {
            gInstance           = [[self alloc] init];
            
        }
    }
    
    return(gInstance);
}

+ (void)clearInstance
{
    gInstance = NULL;
}

@end
