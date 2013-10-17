//
//  SHCondimentViewController.m
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/14/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import "SHCondimentViewController.h"
#import "SHHotDog.h"
#import "SHOrder.h"

@interface SHCondimentViewController ()

@end

@implementation SHCondimentViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Adding dog");
    NSArray *condimentsRow = [self.tableView indexPathsForSelectedRows];
    for(NSIndexPath *condimentRow in condimentsRow){
        if([condimentRow indexAtPosition:0] == 0){
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:condimentRow];
            NSLog(@"Has %@",cell.textLabel.text);
            [self.dogToEmbellish.condiments addObject:cell.textLabel.text];
        }
    }
    [[SHOrder currentOrder] addDog:self.dogToEmbellish];
}



@end
