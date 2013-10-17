//
//  SHHotDog.h
//  DogHouse
//
//  Created by Sowmya Hariharan on 10/12/13.
//  Copyright (c) 2013 Sowmya Hariharan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SHHotDogKindRegular,
    SHHotDogKindJumbo,
    SHHotDogKindTofu
} SHHotDogKind;

@interface SHHotDog : NSObject

@property (nonatomic) SHHotDogKind kind;
@property (nonatomic, strong) NSMutableArray *condiments;

- (float)price;
- (NSString *)descriptionForOrder;

@end

