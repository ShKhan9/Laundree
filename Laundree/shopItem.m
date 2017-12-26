//
//  projectItem.m
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "newsItem.h"

@implementation newsItem



-(newsItem*)initWithTitleEn:(NSString*)titleEn titleAr:(NSString*)titleAr

              descriptionEn:(NSString*)descriptionEn descriptionAr:(NSString*)descriptionAr

                         id:(NSString*)id youtubeStr:(NSString*)youtubeStr

mainImgStr:(NSString*)mainImgStr

{
    
    self.titleAr = titleAr;
    
    self.titleEn = titleEn;
    
    self.descriptionAr = descriptionAr;
    
    self.descriptionEn = descriptionEn;
    
    self.youtubeStr = youtubeStr;
    
    self.mainImgStr = mainImgStr;
    
    self.id = id;
     
    return  self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.titleAr forKey:@"titleAr"];
    [encoder encodeObject:self.titleEn forKey:@"titleEn"];
    [encoder encodeObject:self.descriptionAr forKey:@"descriptionAr"];
    [encoder encodeObject:self.descriptionEn forKey:@"descriptionEn"];
    [encoder encodeObject:self.youtubeStr forKey:@"youtubeStr"];
    [encoder encodeObject:self.mainImgStr forKey:@"mainImgStr"];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.titleAr = [decoder decodeObjectForKey:@"titleAr"];
        self.titleEn = [decoder decodeObjectForKey:@"titleEn"];
        self.descriptionAr = [decoder decodeObjectForKey:@"descriptionAr"];
        self.descriptionEn = [decoder decodeObjectForKey:@"descriptionEn"];
        self.youtubeStr = [decoder decodeObjectForKey:@"youtubeStr"];
        self.mainImgStr = [decoder decodeObjectForKey:@"mainImgStr"];
    }
    return self;
}

@end
