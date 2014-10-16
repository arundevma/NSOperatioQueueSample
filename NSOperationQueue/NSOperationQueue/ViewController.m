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
    self.operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;

//    //Example for main Override
    [self mainOverrideExample];
    
    //Example for start Override
//    [self startOverrideExample];
    
    
//    //Example for priority
//    [self mainOverridePriorityExample];
    
    //Example for add via block
//    [self addBlockExample];
    
    //Example dependency
//    [self addDependencyExample];
    
    //Example NSOPerationBlock
//    [self addBlockOperationExample];



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
    
    NSLog(@"started waiting for Operations to finish.......");
    [self.operationQueue waitUntilAllOperationsAreFinished];
    NSLog(@"Finished waiting for Operations.........");

}

- (void)startOverrideExample
{
    for (int i = 0; i<5; i++)
    {
        CustomOperationStart *op = [[CustomOperationStart alloc]init];
        op.opNum = i;
        op.completionBlock = ^{
            NSLog(@"OPeration completed %d", i);
            
        };
        
        [self.operationQueue addOperation:op];
        
    }
    
}

- (void)mainOverridePriorityExample
{
    int priority = -8L;   //very  low priority enumeration others are -4,0,4,8

    //Initially setting queue to suspended state. Otherwise first task will always execute as there are no task in the queue
    [self.operationQueue setSuspended:YES];

    for (int i = 0; i<5; i++)
    {
        
        CustomOperationMain *op = [[CustomOperationMain alloc]init];
        op.opNum = i;
        op.completionBlock = ^{
            NSLog(@"OPeration completed %d", i);
            
        };
        op.queuePriority =  priority;
        priority = priority + 4;
        [self.operationQueue addOperation:op];
        
    }
    [self.operationQueue setSuspended:NO];

}

- (void)addBlockExample
{
    [self.operationQueue addOperationWithBlock:^{
        
        NSLog(@"Added via block");
        
    }];
}


- (void)addDependencyExample
{
    int priority = -8L;   //very low priority enumeration others are -4,0,4,8
    NSMutableArray *array = [NSMutableArray array];
    
    //Initially setting queue to suspended state. Otherwise first task will always execute as there are no task in the queue
    [self.operationQueue setSuspended:YES];
    
    for (int i = 0; i<5; i++)
    {
        
        CustomOperationMain *op = [[CustomOperationMain alloc]init];
        op.opNum = i;
        op.completionBlock = ^{
            NSLog(@"OPeration completed %d", i);
            
        };
        op.queuePriority =  priority;
        priority = priority + 4;
        
        [array addObject:op];
        
    }
    
    CustomOperationMain *op5 = [array lastObject];

    CustomOperationMain *op2 = array[1];
    
    [op5 addDependency:op2];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSOperation *op = (NSOperation *)obj;
        [self.operationQueue addOperation:op];

    }];
    
    [self.operationQueue setSuspended:NO];

    
}


- (void)addBlockOperationExample
{
    NSBlockOperation *blockOperation = [[NSBlockOperation alloc]init];
    
    
    for (int i = 0; i<5; i++)
    {
        [blockOperation addExecutionBlock:^{
            for (int j=0; j<10; j++)
            {
                NSLog(@"BlockOPeration: %d  iteration: %d",i,j);
            }
        }];
        
    }
    
    [self.operationQueue addOperation:blockOperation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
