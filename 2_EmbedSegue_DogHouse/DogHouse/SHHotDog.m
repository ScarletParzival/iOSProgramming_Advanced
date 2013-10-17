//
//  SHHotDog.m
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/12/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import "SHHotDog.h"

@implementation SHHotDog

- (id)init
{
    self = [super init];
    if (self) {
        _condiments = [[NSMutableArray alloc] init];
    }
    return self;
}

- (float)price
{
    if (self.kind==SHHotDogKindRegular) return 1.00;
    if (self.kind==SHHotDogKindJumbo) return 1.50;
    if (self.kind==SHHotDogKindTofu) return 2.00;
    
    return 0.0;
}

- (NSString *)descriptionForOrder
{
    NSString *desc;
    if (self.kind==SHHotDogKindRegular) desc = @"Hot Dog";
    if (self.kind==SHHotDogKindJumbo) desc = @"Jumbo Dog";
    if (self.kind==SHHotDogKindTofu) desc = @"Tofu Dog";
    
    if ([self.condiments count] > 0) {
        NSString *nextDesc = [desc stringByAppendingString:@" with "];
        for (NSString *s in self.condiments) {
            desc = [nextDesc stringByAppendingString:s];
            nextDesc = [desc stringByAppendingString:@","];
        }
    }
    
    return desc;
}

@end
