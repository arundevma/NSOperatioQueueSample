//
//  ViewController.m
//  NSOperationQueue
//
//  Created by idev on 10/15/14.
//  Copyright (c) 2014 ichathan.com. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperationMain.h"
#import "CustomOperationStart.h"

@interface ViewController ()
{
    
}

@property (nonatomic,strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.operationQueue = [[NSOperationQueue alloc]init];
    self.operationQueue.maxConcurrentOperationCount = 2;
    
   //Example for main Override
    [self mainOverrideExample];


}

- (void)mainOverrideExample
{
    for (int i = 0; i<5; i++)
    {
        CustomOperationMain *op = [[CustomOperationMain alloc]init];
        op.opNum = i;
        op.completionBlock = ^{
            NSLog(@"OPeration completed %d", i);
        
        
        };
        
        [self.operationQueue addOperation:op];

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
