//
//  projectItem.m
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "laundreeItem.h"
#import "DataClass.h"

@implementation laundreeItem



-(laundreeItem*)initWithId:(NSString*)id title:(NSString*)title bigs:(NSArray*)bigs
{
    
    self.id = id;
    
    self.title = title;
    
    self.bigs = bigs;
    
    
    return  self;
}

-(NSInteger)totalPrice
{
    
    NSInteger price = 0;
    
    for (bigItem*b in self.bigs) {
        
        price += [b.totalPrice integerValue];
        
    }
    
    return price;
}

-(NSInteger)totalItems
{
    
    NSInteger items = 0;
    
    for (bigItem*b in self.bigs) {
        
        items += [b.itemsNum integerValue];
        
    }
    
    return items;
}

-(NSInteger)totalPieces
{
    
    NSInteger pieces = 0;
    
    for (bigItem*b in self.bigs) {
        
        pieces += [b.piecesNum integerValue];
        
    }
    
    return pieces;
}
- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.id forKey:@"id"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.bigs forKey:@"bigs"];
 
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.id = [decoder decodeObjectForKey:@"id"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.bigs = [decoder decodeObjectForKey:@"bigs"];
     
    }
    return self;
}

@end
