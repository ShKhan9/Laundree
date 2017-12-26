//
//  shopItem.h
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopItem : NSObject<NSCoding>


@property (nonatomic,strong) NSString* id;
@property (nonatomic,strong) NSMutableArray* services;
@property (nonatomic,strong) NSString* qty;
@property (nonatomic,strong) NSString* price;
 
-(shopItem*)initWithId:(NSString*)id services:(NSMutableArray*)services qty:(NSString*)qty;

-(NSString*)formattedServices;

-(void)reloadContent;

@end
