//
//  projectItem.m
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "bigItem.h"
#import "DataClass.h"
@implementation bigItem
 

-(bigItem*)initWithId:(NSString*)id title:(NSString*)title shopItem:(NSMutableArray*)shopItems fromAED:(NSString*)fromAED
{
    
    self.id = id;
    
    self.title = title;
    
    self.shopItems = shopItems;
    
    self.fromAED = fromAED;
  
    NSInteger pieces = 0;
    
    NSInteger price = 0;
    
    for(int i = 0 ; i<[self.shopItems count];i++)
    {
        shopItem*sh = [self.shopItems objectAtIndex:i];
        
        pieces += [sh.qty integerValue];
        
        price += [sh.price integerValue];
    }
    
     self.itemsNum = [NSString stringWithFormat:@"%d",[self.shopItems count]];
    
     self.piecesNum = [NSString stringWithFormat:@"%d",pieces];
    
     self.totalPrice = [NSString stringWithFormat:@"%d",price];
    
    return  self;
}

-(void)reloadContent
{
    
    NSInteger pieces = 0;
    
    NSInteger price = 0;
    
    for(int i = 0 ; i<[self.shopItems count];i++)
    {
        shopItem*sh = [self.shopItems objectAtIndex:i];
        
        pieces += [sh.qty integerValue];
        
        price += [sh.price integerValue];
    }
    
    self.itemsNum = [NSString stringWithFormat:@"%d",[self.shopItems count]];
    
    self.piecesNum = [NSString stringWithFormat:@"%d",pieces];
    
    self.totalPrice = [NSString stringWithFormat:@"%d",price];
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.id forKey:@"id"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.shopItems forKey:@"shopItems"];
    [encoder encodeObject:self.fromAED forKey:@"fromAED"];
    [encoder encodeObject:self.itemsNum forKey:@"itemsNum"];
    [encoder encodeObject:self.piecesNum forKey:@"piecesNum"];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.id = [decoder decodeObjectForKey:@"id"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.shopItems = [decoder decodeObjectForKey:@"shopItems"];
        self.fromAED = [decoder decodeObjectForKey:@"fromAED"];
        self.itemsNum = [decoder decodeObjectForKey:@"itemsNum"];
        self.piecesNum = [decoder decodeObjectForKey:@"piecesNum"];
     
    }
    return self;
}

@end
