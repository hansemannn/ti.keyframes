/**
 * Ti.Keyframes
 * Copyright (c) 2016 by Hans Knöchel, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiKeyframesVectorViewProxy.h"
#import "TiUtils.h"
#import "TiKeyframesVectorView.h"

@implementation TiKeyframesVectorViewProxy

- (void)dealloc
{
    RELEASE_TO_NIL(sampleVectorLayer);
    [super dealloc];
}

- (KFVector *)loadSampleVectorFromDisk
{
    static KFVector *_sampleVector;
    static dispatch_once_t onceToken;
    
    if (![self valueForKey:@"resource"]) {
        [self throwException:@"Resource was null"
                   subreason:@"The specified JSON resource was null, please define it by setting the 'resource' key."
                    location:CODELOCATION];
    }
    
    dispatch_once(&onceToken, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:[self valueForKey:@"resource"] ofType:@"json" inDirectory:nil];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        if (!data) {
            NSLog(@"[ERROR] The specified resource %@ could not be located. Please ensure to only provice the name of the JSON-file, without the extension.");
        }
        
        NSDictionary *sampleVectorDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        _sampleVector = KFVectorFromDictionary(sampleVectorDictionary);
    });
    
    return _sampleVector;
}

- (void)initialize:(id)unused
{
    KFVector *sampleVector = [self loadSampleVectorFromDisk];
    
    sampleVectorLayer = [KFVectorLayer new];
    
    const CGFloat shortSide = MIN(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    const CGFloat longSide = MAX(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    sampleVectorLayer.frame = CGRectMake(shortSide / 4, longSide / 2 - shortSide / 4, shortSide / 2, shortSide / 2);
    sampleVectorLayer.faceModel = sampleVector;
    
    TiThreadPerformOnMainThread(^{
        [[(TiKeyframesVectorView*)[self view] layer] addSublayer:sampleVectorLayer];
    }, NO);
}

- (void)startAnimation:(id)unused
{
    ENSURE_UI_THREAD(startAnimation, unused);
    [sampleVectorLayer startAnimation];
}

- (void)pauseAnimation:(id)unused
{
    ENSURE_UI_THREAD(pauseAnimation, unused);
    [sampleVectorLayer pauseAnimation];
}

- (void)resumeAnimation:(id)unused
{
    ENSURE_UI_THREAD(resumeAnimation, unused);
    [sampleVectorLayer resumeAnimation];
}

- (void)seekToProgress:(id)value
{
    ENSURE_SINGLE_ARG(value, NSNumber);
    ENSURE_UI_THREAD(seekToProgress, value);
    
    [sampleVectorLayer seekToProgress:[TiUtils floatValue:value]];
}

@end
