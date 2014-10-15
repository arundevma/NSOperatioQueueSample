//
//  CustomOperationMain.m
//  NSOperationQueue
//
//  Created by idev on 10/15/14.
//  Copyright (c) 2014 ichathan.com. All rights reserved.
//

#import "CustomOperationMain.h"

@implementation CustomOperationMain

- (void) main
{
        for (int i = 0 ; i < self.opNum * 10 ; i++)
        {
            // is this operation cancelled?
            if (self.isCancelled)
                break;
            NSLog(@"Operation:%d  i:%d    %f",self.opNum,i, sqrt(i));
        }
}


@end
