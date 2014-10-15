//
//  CustomOperationMain.m
//  NSOperationQueue
//
//  Created by idev on 10/15/14.
//  Copyright (c) 2014 ichathan.com. All rights reserved.
//

#import "CustomOperationMain.h"

@implementation CustomOperationMain

- (void) start
{
    @autoreleasepool
    {
        for (int i = 0 ; i < 10000 ; i++)
        {
            NSLog(@"Operation:%d  i:%d    %f",self.opNum,i, sqrt(i));
        }
    }
}

- (BOOL)isConcurrent
{
    return NO;
}

@end
