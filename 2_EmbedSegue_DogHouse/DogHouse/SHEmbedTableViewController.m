//
//  SHEmbedTableViewController.m
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/17/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import "SHEmbedTableViewController.h"
#import "SHOrder.h"

@interface SHEmbedTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *itemsTableView;

@end

@implementation SHEmbedTableViewController

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
    [self.itemsTableView setDataSource:[SHOrder currentOrder]];
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

@end
