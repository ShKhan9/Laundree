//
//  addViewController.m
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "addViewController.h"
#import "DataClass.h"
#import "AppDelegate.h"
#import "bigItem.h"
#import "laundreeItem.h"
#import "shopItem.h"
@interface addViewController ()
{
    NSArray*allButtons;
    
    NSInteger quantityNum;
    
    NSInteger subTotalPrice;
    
    NSArray*allNames;
}
    
@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     quantityNum = 1 ;
    
    subTotalPrice = 0 ;
    
  //  laundreeItem*la = [[DataClass getInstance].laundreeArr objectAtIndex:self.currentTap];
    
   // bigItem*b = [la.bigs objectAtIndex:self.currentRow] ;
    
    
    self.quantitylb.text  = [NSString stringWithFormat:@"%d",quantityNum];
    
    
    allButtons = [[NSArray alloc]initWithObjects:self.washBu,self.dryBu,self.foldBu,self.hangBu,_ironBu ,  nil];
    
    allNames = [[NSArray alloc]initWithObjects:kWash,kDry,kFold,kHang,kIron, nil];
    
    
}



-(void)manageBts:(UIButton*)vd
{
 
        if(vd.tag == 0)
        {
            [vd setImage:[UIImage imageNamed:@"pic1.png"] forState:UIControlStateNormal];
            
            vd.tag = 1;
        }
        else
        {
           [vd setImage:[UIImage imageNamed:@"pic2.png"] forState:UIControlStateNormal];
            
            vd.tag = 0;
        }
    
    
    
    [self reCalcAmounts];
   
}

-(void)reCalcAmounts
{
    
    NSInteger subPrice = 0;
    
    for (int i = 0; i<allButtons.count; i++)
    {
        UIButton*b = allButtons[i];
        
        NSString*key = allNames[i];
        
        
        if(b.tag == 1)
        {
            subPrice += [[[DataClass getInstance].priceDic objectForKey:key] integerValue];
            
        }
        
    }
    
    subTotalPrice = subPrice;
    
    [self reCalcAfterIncDec];
   
    
}

-(void)reCalcAfterIncDec
{
    self.btsPriceslb.text = [NSString stringWithFormat:@"AED %d",subTotalPrice];
    
    self.pieceslb.text = [NSString stringWithFormat:@"%d Pieces",quantityNum];
    
    self.xNumlb.text = [NSString stringWithFormat:@"X %d",quantityNum];
    
    self.totalPricelb.text = [NSString stringWithFormat:@"X %d",quantityNum*subTotalPrice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

 
 
 
    
- (IBAction)washClicked:(id)sender
{
    [self manageBts:self.washBu];
}
    
- (IBAction)dryClicked:(id)sender
{
    [self manageBts:self.dryBu];
}
    
- (IBAction)foldClicked:(id)sender
{
    [self manageBts:self.foldBu];
}
    
- (IBAction)hangClicked:(id)sender
{
    [self manageBts:self.hangBu];
}
    
- (IBAction)ironClicked:(id)sender
{
    [self manageBts:self.ironBu];
}
    
- (IBAction)increaseClicked:(id)sender
{
    quantityNum++;
     
    self.quantitylb.text  = [NSString stringWithFormat:@"%d",quantityNum];
    
    [self reCalcAfterIncDec];
}
    
- (IBAction)decreaseClicked:(id)sender
{
    if(quantityNum - 1 >=1)
    {
        quantityNum--;
        
        self.quantitylb.text  = [NSString stringWithFormat:@"%d",quantityNum];
        
        [self reCalcAfterIncDec];
    }
}
    
- (IBAction)addClicked:(id)sender
{
    
    //NSArray*service2 = [[NSArray alloc] initWithObjects:kWash,kDry,kFold, nil];
    
   // shopItem*sh2 = [[shopItem alloc] initWithId:@"2" services:service2 qty:@"2"];
    
    NSMutableArray*ser = [NSMutableArray new];
    
  
    for (int i = 0; i<allButtons.count; i++)
    {
        UIButton*b = allButtons[i];
        
        NSString*key = allNames[i];
        
        
        if(b.tag == 1)
        {
            [ser addObject:key];
            
            
        }
        
    }
    
    
    laundreeItem*la = [[DataClass getInstance].laundreeArr objectAtIndex:self.currentTap]  ;
    
    bigItem*b = [la.bigs objectAtIndex:self.currentRow] ;
    
    NSString*id = [NSString stringWithFormat:@"%d",[b.shopItems count]];
    
  //  NSMutableArray*we = [[NSMutableArray alloc] initWithArray:b.shopItems];
    
    NSString*qyn = [NSString stringWithFormat:@"%d",quantityNum];
    
    shopItem*newShop = [[shopItem alloc]initWithId:id services:ser qty:qyn];
    
    //[we addObject:newShop];
    
    [b.shopItems addObject:newShop];
    
    NSLog(@"sefsdfsdfsfs add %@",b.shopItems);
    
    [self.presentingViewController dismissViewControllerAnimated:false completion:nil];
    
    if([self.comeFrom isEqualToString:@"main"])
    {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"refreshYaMain"
         object:nil
         ];
    }
    else  if([self.comeFrom isEqualToString:@"detail"])
    {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"refreshYaDetail"
         object:nil
         ];
    }
    
    
    
   /* laundreeItem*la = [[[DataClass getInstance].laundreeArr objectAtIndex:self.currentTap] copy];
    
    bigItem*b = [la.bigs objectAtIndex:self.currentRow] ;
    
    NSString*id = [NSString stringWithFormat:@"%d",[b.shopItems count]];
    
    NSMutableArray*we = [[NSMutableArray alloc] initWithArray:b.shopItems];
    
    NSString*qyn = [NSString stringWithFormat:@"%d",quantityNum];
    
    shopItem*newShop = [[shopItem alloc]initWithId:id services:ser qty:qyn];
    
    [we addObject:newShop];
    
    b.shopItems = we;
    
    [[DataClass getInstance].laundreeArr replaceObjectAtIndex:self.currentTap withObject:la];
        
    [self.presentingViewController dismissViewControllerAnimated:false completion:nil];*/
    
}
    
- (IBAction)cancelClicked:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:false completion:nil];
}
    @end
