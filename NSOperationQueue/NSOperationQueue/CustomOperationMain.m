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
        NSLog(@"Entering Operation:%d  ",self.opNum);
    
        for (int i = 0 ; i < self.opNum * 10 +2 ; i++)
        {
            // is this operation cancelled?
            if (self.isCancelled)
                break;
            NSLog(@"Operation:%d  i:%d    %f",self.opNum,i, sqrt(i));
        }
}


@end
