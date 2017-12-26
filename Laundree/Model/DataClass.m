//
//  DataClass.m
//  PrayerNow
//
//  Created by ApprocksEg on 11/2/15.
//  Copyright © 2015 ApprocksEg. All rights reserved.
//

#import "DataClass.h"
#import "AppDelegate.h"
#import "shopItem.h"
#import "bigItem.h"
#import "laundreeItem.h"
#import <SystemConfiguration/SystemConfiguration.h>
@implementation DataClass

static DataClass *instance = nil;

+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [DataClass new];
            
             NSUserDefaults*defaults = [NSUserDefaults  standardUserDefaults];
       
            
            
            NSString* dd = NSLocalizedString(@"appLang", comment: "");
            
            
            if([dd isEqualToString:@"ar"])
            {
                instance.ar = YES ;
                
                [defaults setObject:@[dd] forKey:@"AppleLanguages"];
              
                
            }
            else
            {
                instance.ar = NO ;
                
               [defaults setObject:@[dd] forKey:@"AppleLanguages"];
            }
            
             
       
           
          /*  NSData *data1 = [defaults objectForKey:kNews];
            
            newsItem *n1 = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
            
            instance.newsArr = n1;
            
            NSData *data2 = [defaults objectForKey:kProjectsSlider];
            
            projectItem *n2 = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
            
            instance.projectsSliderArr = n2;*/
          
            instance.leftArrow = [NSString stringWithFormat:@"%C",0xf104];
            
            instance.rightArrow = [NSString stringWithFormat:@"%C",0xf105];
            
            
            
            NSMutableDictionary*dic = [NSMutableDictionary new];
            
            [dic setObject:[NSNumber numberWithInt:2] forKey:kWash];
            
            [dic setObject:[NSNumber numberWithInt:1] forKey:kDry];
            
            [dic setObject:[NSNumber numberWithInt:1] forKey:kFold];
            
            [dic setObject:[NSNumber numberWithInt:1] forKey:kHang];
            
            [dic setObject:[NSNumber numberWithInt:2] forKey:kIron];
            
            instance.priceDic = dic;
            
            
            // set dummy data
            
            NSMutableArray*service1 = [NSMutableArray arrayWithObjects:kWash,kDry,kIron,kHang, nil];
            
            shopItem*sh1 = [[shopItem alloc] initWithId:@"1" services:service1 qty:@"10"];
            
            NSMutableArray*service2 = [NSMutableArray arrayWithObjects:kWash,kDry,kFold, nil];
            
            shopItem*sh2 = [[shopItem alloc] initWithId:@"2" services:service2 qty:@"2"];
            
           
            NSMutableArray*firsh1 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            NSMutableArray*firsh2 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            //
            bigItem*b1 = [[bigItem alloc]initWithId:@"1" title:@"Blouses"  shopItem:firsh1 fromAED:@"2"];
            
            bigItem*b2 = [[bigItem alloc]initWithId:@"2" title:@"Shirts"  shopItem:firsh2 fromAED:@"2"];
            
            
            NSMutableArray*dataDef = [NSMutableArray new];
            
            [dataDef addObject:b1];
            
            [dataDef addObject:b2];
            
            
            laundreeItem*la1 = [[laundreeItem alloc]initWithId:@"1" title:kTops bigs:dataDef];
            
            //
            
            NSMutableArray*firsh10 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            NSMutableArray*firsh20 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            bigItem*b11 = [[bigItem alloc]initWithId:@"1" title:@"Suits"  shopItem:firsh10 fromAED:@"2"];
            
            bigItem*b21 = [[bigItem alloc]initWithId:@"2" title:@"Jackets"  shopItem:firsh20 fromAED:@"2"];
            
            
            NSMutableArray*dataDef1 = [NSMutableArray new];
            
            [dataDef1 addObject:b11];
            
            [dataDef1 addObject:b21];
            
            
            laundreeItem*la2 = [[laundreeItem alloc]initWithId:@"2" title:kSuits bigs:dataDef1];
            
            
            
            //
            
            NSMutableArray*firsh11 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            NSMutableArray*firsh21 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            bigItem*b12 = [[bigItem alloc]initWithId:@"1" title:@"Khaleege1"  shopItem:firsh11 fromAED:@"2"];
            
            bigItem*b22 = [[bigItem alloc]initWithId:@"2" title:@"Khaleege2"  shopItem:firsh21 fromAED:@"2"];
            
            
            NSMutableArray*dataDef2 = [NSMutableArray new];
            
            [dataDef2 addObject:b12];
            
            [dataDef2 addObject:b22];
            
            
            laundreeItem*la3 = [[laundreeItem alloc]initWithId:@"3" title:kKhaleege bigs:dataDef2];
            
            
            //
            
            NSMutableArray*firsh12 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            NSMutableArray*firsh22 = [NSMutableArray arrayWithObjects:sh1,sh2, nil];
            
            bigItem*b13 = [[bigItem alloc]initWithId:@"1" title:@"Bag travel"  shopItem:firsh12 fromAED:@"2"];
            
            bigItem*b23 = [[bigItem alloc]initWithId:@"2" title:@"Bag Home"  shopItem:firsh22 fromAED:@"2"];
            
            
            NSMutableArray*dataDef3 = [NSMutableArray new];
            
            [dataDef3 addObject:b13];
            
            [dataDef3 addObject:b23];
            
            laundreeItem*la4 = [[laundreeItem alloc]initWithId:@"4" title:kBag bigs:dataDef3];
            
            NSMutableArray*allLaundrees = [NSMutableArray new];
            
            [allLaundrees addObject:la1];
            
            [allLaundrees addObject:la2];
            
            [allLaundrees addObject:la3];
            
            [allLaundrees addObject:la4];
            
            instance.laundreeArr = allLaundrees;
            

        }
    }
    
    return instance;
}

+(bool)isNetworkAvailable {
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityRef address;
    address = SCNetworkReachabilityCreateWithName(NULL, "www.apple.com");
    Boolean success = SCNetworkReachabilityGetFlags(address, &flags);
    CFRelease(address);
    bool canReach = success
    && !(flags & kSCNetworkReachabilityFlagsConnectionRequired)
    && (flags & kSCNetworkReachabilityFlagsReachable);
    return canReach;
}


@end
