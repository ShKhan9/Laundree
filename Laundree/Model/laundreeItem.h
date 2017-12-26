//
//  shopItem.h
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bigItem.h"
@interface laundreeItem : NSObject<NSCoding>


@property (nonatomic,strong) NSString* id;
@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSArray* bigs;

 
-(laundreeItem*)initWithId:(NSString*)id title:(NSString*)title bigs:(NSArray*)bigs;

-(NSInteger)totalPrice;

-(NSInteger)totalItems;

-(NSInteger)totalPieces;

@end
