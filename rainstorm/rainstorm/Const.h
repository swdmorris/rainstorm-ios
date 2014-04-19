//
//  Const.h
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Lakeview Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS_VERSION_NEWER_OR_EQUAL_TO(iOSV) ([[[UIDevice currentDevice] systemVersion] compare:(iOSV) options:NSNumericSearch] != NSOrderedAscending)

@interface Const : NSObject

@end
