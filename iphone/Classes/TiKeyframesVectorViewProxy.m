/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2016 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiKeyframesVectorViewProxy.h"
#import "TiUtils.h"
#import "TiKeyframesVectorView.h"

@implementation TiKeyframesVectorViewProxy

- (KFVector *)loadSampleVectorFromDisk
{
    static KFVector *sampleVector;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:[self valueForKey:@"resource"] ofType:@"json" inDirectory:nil];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *sampleVectorDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        sampleVector = KFVectorFromDictionary(sampleVectorDictionary);
    });
    return sampleVector;
}

- (void)initialize:(id)unused
{
    KFVector *sampleVector = [self loadSampleVectorFromDisk];
    
    sampleVectorLayer = [KFVectorLayer new];
    
    const CGFloat shortSide = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    const CGFloat longSide = MAX(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    sampleVectorLayer.frame = CGRectMake(shortSide / 4, longSide / 2 - shortSide / 4, shortSide / 2, shortSide / 2);
    sampleVectorLayer.faceModel = sampleVector;
    
    [[(TiKeyframesVectorView*)[self view] layer] addSublayer:sampleVectorLayer];
}

- (void)startAnimation
{
    [sampleVectorLayer startAnimation];
}

- (void)pauseAnimation
{
    [sampleVectorLayer pauseAnimation];
}

- (void)resumeAnimation
{
    [sampleVectorLayer resumeAnimation];
}

- (void)resumeAnimation:(id)value
{
    ENSURE_SINGLE_ARG(value, NSNumber);
    
    [sampleVectorLayer seekToProgress:[TiUtils floatValue:value]];
}

@end
