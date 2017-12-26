//
//  shopItem.h
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "shopItem.h"
@interface bigItem : NSObject<NSCoding>

@property (nonatomic,strong) NSString* id;
@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSMutableArray* shopItems;
@property (nonatomic,strong) NSString* fromAED;
@property (nonatomic,strong) NSString* itemsNum;
@property (nonatomic,strong) NSString* piecesNum;
@property (nonatomic,strong) NSString* totalPrice;

-(bigItem*)initWithId:(NSString*)id title:(NSString*)title shopItem:(NSMutableArray*)shopItems fromAED:(NSString*)fromAED;

-(void)reloadContent;

@end
