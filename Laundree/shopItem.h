//
//  projectItem.h
//  Mansour
//
//  Created by ShKhan on 10/24/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newsItem : NSObject<NSCoding>



@property (nonatomic,strong) NSString* titleEn;
@property (nonatomic,strong) NSString* titleAr;
@property (nonatomic,strong) NSString* descriptionEn;
@property (nonatomic,strong) NSString* descriptionAr;
@property (nonatomic,strong) NSString* id;
@property (nonatomic,strong) NSString* youtubeStr;
@property (nonatomic,strong) NSString* mainImgStr;




-(newsItem*)initWithTitleEn:(NSString*)titleEn titleAr:(NSString*)titleAr

descriptionEn:(NSString*)descriptionEn descriptionAr:(NSString*)descriptionAr

id:(NSString*)id youtubeStr:(NSString*)youtubeStr

mainImgStr:(NSString*)mainImgStr

 ;

@end
