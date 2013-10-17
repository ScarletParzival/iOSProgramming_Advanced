//
//  SHOrder.m
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/12/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import "SHOrder.h"
#import "SHHotDog.h"

@interface SHOrder()

@property (nonatomic, strong) NSMutableArray *dogs;
@property (nonatomic) int numDrinks;

@end

static SHOrder *_mainInstance;

@implementation SHOrder

- (void)addDog:(SHHotDog *)dog
{
    if (self.dogs == nil) {
        self.dogs = [[NSMutableArray alloc] init];
    }
    
    [self.dogs addObject:dog];
}

- (void)addDrink
{
    self.numDrinks++;
}

- (float)totalPrice
{
    // Total the price of the hot dogs
    float total = 0.0;
    
    for (SHHotDog *dog in self.dogs) {
        total += [dog price];
    }
    
    // Add the price of the drinks (50 cents each)
    total += self.numDrinks * 0.50;
    
    return total;
}

// Shared instance
// Uses GCD dispatch_once to create the singleton
+ (SHOrder *)currentOrder {
    static dispatch_once_t once;
    if (_mainInstance == nil) {
        dispatch_once(&once, ^ { _mainInstance = [[SHOrder alloc] init]; });
    }
    return _mainInstance;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // One row per hot dog plus a row for drinks if there are any
    int numRows = [self.dogs count];
    if (self.numDrinks > 0) numRows += 1;
    
    return numRows;
}

- tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if ([indexPath row] < [self.dogs count]) {
        cell.textLabel.text = [[self.dogs objectAtIndex:[indexPath row]] descriptionForOrder];
    } else {
        if (self.numDrinks == 1) {
            cell.textLabel.text = @"Drink";
        } else {
            cell.textLabel.text = [NSString stringWithFormat:@"%d Drinks", self.numDrinks];
        }
    }
    return cell;
}

@end
