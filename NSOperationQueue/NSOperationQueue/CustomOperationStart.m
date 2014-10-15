//
//  CustomOperationStart.m
//  NSOperationQueue
//
//  Created by idev on 10/15/14.
//  Copyright (c) 2014 ichathan.com. All rights reserved.
//

#import "CustomOperationStart.h"

@implementation CustomOperationStart

@synthesize executing = _executing;
@synthesize finished = _finished;

- (void)start
{
    _executing = YES;
    _finished = NO;
    // start your work, which calls finished once it's done ...
    for (int i = 0 ; i < self.opNum * 10 ; i++)
    {
        // is this operation cancelled?
        if (self.isCancelled)
            break;
        NSLog(@"Operation:%d  i:%d    %f",self.opNum,i, sqrt(i));
    }
}

- (void)finished
{
    _executing = NO;
    _finished = YES;
}

@end
