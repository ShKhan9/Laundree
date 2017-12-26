//
//  projectItem.m
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "shopItem.h"
#import "DataClass.h"
@implementation shopItem



-(shopItem*)initWithId:(NSString*)id services:(NSMutableArray*)services qty:(NSString*)qty
{
    
    self.id = id;
    
    self.services = services;
    
    self.qty = qty;
    
    NSInteger qerr = 0;
    
    for(int i = 0 ; i<[self.services count];i++)
    {
        qerr += [[[DataClass getInstance].priceDic objectForKey:[self.services objectAtIndex:i]] integerValue];
        
    }
    
     self.price = [NSString stringWithFormat:@"%d",qerr*[self.qty integerValue]];
    
    return  self;
}

-(void)reloadContent
{
    NSInteger qerr = 0;
    
    for(int i = 0 ; i<[self.services count];i++)
    {
        qerr += [[[DataClass getInstance].priceDic objectForKey:[self.services objectAtIndex:i]] integerValue];
        
    }
    
    self.price = [NSString stringWithFormat:@"%d",qerr*[self.qty integerValue]];
    
}

-(NSString*)formattedServices
{
    NSMutableString*str = [NSMutableString new] ;
    
    for (int i = 0; i<[self.services count]; i++)
    {
      
        
        [str appendString:[NSString stringWithFormat:@"%@ + ",[self.services objectAtIndex:i]]];
        
        //  NSLog(@"fsdfsdfsdf %@",[self.services objectAtIndex:i]);
        
    }
   
    return [str substringToIndex:str.length-3];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.id forKey:@"id"];
    [encoder encodeObject:self.services forKey:@"services"];
    [encoder encodeObject:self.qty forKey:@"qty"];
 
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.id = [decoder decodeObjectForKey:@"id"];
        self.services = [decoder decodeObjectForKey:@"services"];
        self.qty = [decoder decodeObjectForKey:@"qty"];
     
    }
    return self;
}

@end
