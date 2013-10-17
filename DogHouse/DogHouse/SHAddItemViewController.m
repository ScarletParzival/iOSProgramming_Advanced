//
//  SHAddViewController.m
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/14/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import "SHAddItemViewController.h"
#import "SHOrder.h"
#import "SHHotDog.h"
#import "SHCondimentViewController.h"

@interface SHAddItemViewController ()

@end

@implementation SHAddItemViewController

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
    NSLog(@"Add %@ here", segue.identifier);
    if([[segue identifier] isEqualToString:@"AddDrink"]){
        [[SHOrder currentOrder] addDrink];
        return;
    }
    SHCondimentViewController *condimentViewController = (SHCondimentViewController*)segue.destinationViewController;
    SHHotDog *newDog = [[SHHotDog alloc] init];
    if([[segue identifier] isEqualToString:@"NewDogRegular"]){
        newDog.kind = SHHotDogKindRegular;
//        [newDog setKind:SHHotDogKindRegular];
    }
    else if([[segue identifier] isEqualToString:@"NewDogJumbo"]){
        newDog.kind = SHHotDogKindJumbo;
//        [newDog setKind:SHHotDogKindJumbo];
    }
    else if([[segue identifier] isEqualToString:@"NewDogTofu"]){
        newDog.kind = SHHotDogKindTofu;
    }
    condimentViewController.dogToEmbellish = newDog;
//    [condimentViewController setDogToEmbellish:newDog];
}

-(IBAction)done:(UIStoryboardSegue*)sender{
    NSLog(@"Unwind segue");
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
