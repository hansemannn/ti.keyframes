/**
 * Ti.Keyframes
 * Copyright (c) 2016 by Hans Knöchel, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiKeyframesModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiKeyframesModule

#pragma mark Internal

-(id)moduleGUID
{
	return @"ba2469a9-0392-4db6-85e1-1377510e25a1";
}

-(NSString*)moduleId
{
	return @"ti.keyframes";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];

	NSLog(@"[DEBUG] %@ loaded",self);
}

@end
