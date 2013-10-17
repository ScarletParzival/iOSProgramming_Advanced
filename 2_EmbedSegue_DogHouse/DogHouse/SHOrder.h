//
//  SHOrder.h
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/12/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SHHotDog;

@interface SHOrder : NSObject<UITableViewDataSource>

+ (SHOrder *)currentOrder;

- (void)addDog:(SHHotDog *)dog;
- (void)addDrink;

- (float)totalPrice;

@end
