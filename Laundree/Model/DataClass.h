//
//  DataClass.h
//  PrayerNow
//
//  Created by ApprocksEg on 11/2/15.
//  Copyright © 2015 ApprocksEg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface DataClass : NSObject

@property(nonatomic,copy)NSMutableArray*newsArr;
@property(nonatomic,copy)NSMutableArray*projectsSliderArr;
@property(nonatomic,copy)NSMutableDictionary*priceDic;
@property BOOL ar;
@property(nonatomic,copy)NSMutableArray*laundreeArr;
@property(nonatomic,copy)NSString*leftArrow;

@property(nonatomic,copy)NSString*rightArrow;

+(DataClass*)getInstance;
+(bool)isNetworkAvailable;
@end
