//
//  addViewController.h
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addViewController : UIViewController

    @property (weak, nonatomic) IBOutlet UIButton *washBu;
    @property (weak, nonatomic) IBOutlet UIButton *dryBu;
    @property (weak, nonatomic) IBOutlet UIButton *foldBu;
    @property (weak, nonatomic) IBOutlet UIButton *hangBu;
    
    @property (weak, nonatomic) IBOutlet UIButton *ironBu;
    
    @property (weak, nonatomic) IBOutlet UILabel *quantitylb;

@property (weak, nonatomic) IBOutlet UILabel *btsPriceslb;

@property (weak, nonatomic) IBOutlet UILabel *totalPricelb;

@property (weak, nonatomic) IBOutlet UILabel *xNumlb;

@property (weak, nonatomic) IBOutlet UILabel *pieceslb;


@property (strong, nonatomic)   NSString *comeFrom;

@property NSInteger currentRow;

@property NSInteger currentTap;

    
- (IBAction)washClicked:(id)sender;
    
- (IBAction)dryClicked:(id)sender;
    
- (IBAction)foldClicked:(id)sender;
    
- (IBAction)hangClicked:(id)sender;
        
- (IBAction)ironClicked:(id)sender;
    
    
- (IBAction)increaseClicked:(id)sender;
    
- (IBAction)decreaseClicked:(id)sender;
    
    
- (IBAction)addClicked:(id)sender;
  
- (IBAction)cancelClicked:(id)sender;
    
    
@end
