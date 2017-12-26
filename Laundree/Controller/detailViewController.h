//
//  detailViewController.h
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bigItem.h"
@interface detailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
    
@property (weak, nonatomic) IBOutlet UITableView*areaSettTable;

@property (weak, nonatomic) IBOutlet UIButton *backBu;

@property (weak, nonatomic) IBOutlet UIButton *addBu;

@property NSInteger currentRow;

@property NSInteger currentTap;

@property (weak, nonatomic) IBOutlet UILabel *titlelb;

@property (weak, nonatomic) IBOutlet UILabel *informlb;

@property (weak, nonatomic) IBOutlet UILabel *totalPriceslb;

@property (weak, nonatomic) IBOutlet UILabel *totalItemslb;



- (IBAction)addClicked:(id)sender;

- (IBAction)backClicked:(id)sender;



@end
