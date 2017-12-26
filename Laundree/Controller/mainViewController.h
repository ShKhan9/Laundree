//
//  mainViewController.h
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
     
    @property (weak, nonatomic) IBOutlet UITableView*areaSettTable;
    @property (weak, nonatomic) IBOutlet UIButton *MenuBu;
    
    @property (weak, nonatomic) IBOutlet UIView *tabView;
    
      @property (weak, nonatomic) IBOutlet UIView *t1View;
      @property (weak, nonatomic) IBOutlet UIView *t2View;
      @property (weak, nonatomic) IBOutlet UIView *t3View;
      @property (weak, nonatomic) IBOutlet UIView *t4View;
@property (weak, nonatomic) IBOutlet UIButton *closeBu;

@property (weak, nonatomic) IBOutlet UIButton *supportBu;

@property (weak, nonatomic) IBOutlet UIButton *aboutBu;
@property (weak, nonatomic) IBOutlet UIView *menuView;

    @property (weak, nonatomic) IBOutlet UIView *t1BordView;
    @property (weak, nonatomic) IBOutlet UIView *t2BordView;
    @property (weak, nonatomic) IBOutlet UIView *t3BordView;
    @property (weak, nonatomic) IBOutlet UIView *t4BordView;
@property (weak, nonatomic) IBOutlet UIButton *contactBu;

@property (weak, nonatomic) IBOutlet UIView *menuHoverView;

@property (weak, nonatomic) IBOutlet UIView *supportView;

@property (weak, nonatomic) IBOutlet UIView *mobileView;


@property (weak, nonatomic) IBOutlet UIView *aboutView;

@property (weak, nonatomic) IBOutlet UIButton *termsBu;

@property (weak, nonatomic) IBOutlet UIImageView *supportImageV;

@property (weak, nonatomic) IBOutlet UIImageView *aboutImageV;





@property (weak, nonatomic) IBOutlet UIButton *helpBu;

@property (weak, nonatomic) IBOutlet UIButton *privacyBu;


@property (weak, nonatomic) IBOutlet UILabel *totalPriceslb;
@property (weak, nonatomic) IBOutlet UILabel *totalItemslb;



- (IBAction)menuClicked:(id)sender;
    
- (IBAction)supportClicked:(id)sender;

- (IBAction)aboutClicked:(id)sender;

- (IBAction)closeClicked:(id)sender;

- (IBAction)support2Clicked:(id)sender;

- (IBAction)about2Clicked:(id)sender;




@end
