/**
 * ti.keyframes
 *
 * Created by Hans Knoechel
 * Copyright (c) 2016 Your Company. All rights reserved.
 */

#import "TiKeyframesModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiKeyframesModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"ba2469a9-0392-4db6-85e1-1377510e25a1";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.keyframes";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

#pragma Public APIs


@end
