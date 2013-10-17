//
//  SHViewController.m
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/12/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import "SHViewController.h"
#import "SHOrder.h"

@interface SHViewController ()

@end

@implementation SHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.itemsTable setDataSource:[SHOrder currentOrder]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.totalLabel  setText:[NSString stringWithFormat:@"Total $%4.02f",[[SHOrder currentOrder] totalPrice]]];
}




@end
