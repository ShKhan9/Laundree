//
//  mainViewController.m
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "mainViewController.h"
#import "mainTableViewCell.h"
#import "DataClass.h"
#import "AppDelegate.h"
#import "shopItem.h"
#import "bigItem.h"
#import "laundreeItem.h"
#import "detailViewController.h"
#import "addViewController.h"
static NSString *CellIdentifier1 = @"ContentCell";
@interface mainViewController ()
{
    NSArray*allTabs;
     NSArray*allBorders;
    BOOL Once;
    
     BOOL supportAnimRu;
    
     BOOL aboutAnimRu;
    
     BOOL menuAnimRu;
    
    NSInteger currentTap;
}


@property(nonatomic,strong)NSMutableArray*dataDef;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"pushDetailYaMain"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"pushAddYaMain"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"refreshYaMain"
                                               object:nil];
    
    
   /* NSArray*service1 = [[NSArray alloc] initWithObjects:kWash,kDry,kIron,kHang, nil];
    
    shopItem*sh1 = [[shopItem alloc] initWithId:@"1" services:service1 qty:@"10"];
    
    NSArray*service2 = [[NSArray alloc] initWithObjects:kWash,kDry,kFold, nil];
    
    shopItem*sh2 = [[shopItem alloc] initWithId:@"2" services:service2 qty:@"2"];
    
    
    NSArray*firsh = [[NSArray alloc]initWithObjects:sh1,sh2, nil];
    
    bigItem*b1 = [[bigItem alloc]initWithId:@"1" title:@"Blouses"  shopItem:firsh fromAED:@"2"];
    
    bigItem*b2 = [[bigItem alloc]initWithId:@"2" title:@"Shirts"  shopItem:firsh fromAED:@"2"];
    
    
    
    self.dataDef = [NSMutableArray new];
    
    [self.dataDef addObject:b1];
    
    [self.dataDef addObject:b2];*/
    
    
    
    currentTap = 0 ;
    
    
    Once = YES;
    
    supportAnimRu = NO;
    
    aboutAnimRu = NO;
    
    menuAnimRu = NO;
    
  
    
    
    allTabs = [[NSArray alloc]initWithObjects:self.t1View,self.t2View,self.t3View,self.t4View, nil];
    
    allBorders = [[NSArray alloc]initWithObjects:self.t1BordView,self.t2BordView,self.t3BordView,self.t4BordView, nil];
    
    self.menuHoverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.menuHoverView.opaque = YES;
    
    
    self.mobileView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.mobileView.opaque = YES;
    
    
    self.tabView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.tabView.opaque = YES;
    
    
    self.t1View.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.t1View.opaque = YES;
    
    self.t2View.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.t2View.opaque = YES;
    
    self.t3View.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.t3View.opaque = YES;
    
    self.t4View.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    self.t4View.opaque = YES;
    
  
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
     
    [self.MenuBu setTitle: [NSString stringWithFormat:@"%C",0xf0c9]  forState:UIControlStateNormal];
    
     [self.closeBu setTitle: [NSString stringWithFormat:@"%C",0xf00d]  forState:UIControlStateNormal];
    
    
    
      [self.supportBu setTitle: [NSString stringWithFormat:@"%C",0xf107]  forState:UIControlStateNormal];
    
      [self.aboutBu setTitle: [NSString stringWithFormat:@"%C",0xf107]  forState:UIControlStateNormal];
    
    
    
    UINib *nib1 = [UINib nibWithNibName:@"mainTableViewCell" bundle:nil];
    
    [self.areaSettTable registerNib:nib1 forCellReuseIdentifier:CellIdentifier1];
    
    [self.areaSettTable setBounces:NO];
    
    self.areaSettTable.delegate=self;
    
    self.areaSettTable.dataSource=self;
    
    self.areaSettTable.backgroundColor = [UIColor whiteColor];
    
    self.areaSettTable.opaque = NO;
    
    self.areaSettTable.separatorColor = [UIColor clearColor];
    
    self.areaSettTable.showsVerticalScrollIndicator = NO;
    
    self.areaSettTable.estimatedRowHeight = 300;
    
    self.areaSettTable.rowHeight = UITableViewAutomaticDimension;
    
    
    
    
    for(int i = 0 ;i<allTabs.count;i++)
    {
        
        UIView*v = allTabs[i];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
        
        tapGesture.numberOfTapsRequired = 1;
     
        [v addGestureRecognizer:tapGesture];
        
    }
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
    
    tapGesture.numberOfTapsRequired = 1;
    
    [self.menuHoverView addGestureRecognizer:tapGesture];
    
    
    [self manageTabs:self.t1View];
    
    
    [self updateViews:0];
}

-(void)viewDidLayoutSubviews
{
    
    if(Once)
    {
        [self manageSupport:NO];
        
        [self manageAbout:NO];
        
       [self manageMenu:NO];
        
        Once = NO;
    }
    
    
}

-(void)receiveNotification:(NSNotification *)paramNotification
{
    
    
    NSString*name=paramNotification.name;
    
    if([name isEqualToString:@"pushDetailYaMain"])
    {
        
        detailViewController*vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
        
        vc.currentRow = [paramNotification.object integerValue];
        
        vc.currentTap = currentTap;
        
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
    }
    else
    if([name isEqualToString:@"pushAddYaMain"])
    {
        
        [self performSegueWithIdentifier:@"showAdd" sender:paramNotification.object];
       
             
            
    }
    else
        if([name isEqualToString:@"refreshYaMain"])
        {
            [self updateViews:currentTap];
            
        }
     
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)manageSupport:(BOOL)animate
{
    
    if(supportAnimRu)
    {
     
        return;
        
    }
  
    supportAnimRu = YES;
    
    if(self.supportView.tag == 0)
    {
     
        for (NSLayoutConstraint*con in self.supportView.constraints)
        {
            if(con.secondItem == self.helpBu &&con.firstAttribute == NSLayoutAttributeBottom)
            {
                
                [self.supportView removeConstraint:con];
                
                break;
            }
            
            
        }
        
        NSLayoutConstraint*con1 = [NSLayoutConstraint constraintWithItem:self.supportImageV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.supportView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15];
        
        
        [self.supportView addConstraint:con1];
        
        self.supportView.tag = 1;
        
        self.contactBu.hidden = YES;
        
        self.helpBu.hidden = YES;
        
        [self.supportBu setTitle: [NSString stringWithFormat:@"%C",0xf107]  forState:UIControlStateNormal];
    }
    else
    {
        for (NSLayoutConstraint*con in self.supportView.constraints)
        {
            if(con.firstItem == self.supportImageV &&con.firstAttribute == NSLayoutAttributeBottom)
            {
                
                [self.supportView removeConstraint:con];
                
                break;
            }
            
            
        }
        
        NSLayoutConstraint*con1 = [NSLayoutConstraint constraintWithItem:self.supportView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.helpBu attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
        
        
        [self.supportView addConstraint:con1];
        
        self.supportView.tag = 0;
        
        self.contactBu.hidden = NO;
        
        self.helpBu.hidden = NO;
        
        [self.supportBu setTitle: [NSString stringWithFormat:@"%C",0xf106]  forState:UIControlStateNormal];
        
    }
  
    
    if(animate)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
             supportAnimRu = NO;
        }];
        
    }
    else
    {
         [self.view layoutIfNeeded];
        
         supportAnimRu = NO;
    }
    
}

-(void)manageAbout:(BOOL)animate
{
    
    if(aboutAnimRu)
    {
        
        return;
        
    }
    
    aboutAnimRu = YES;
    
    if(self.aboutView.tag == 0)
    {
        
        for (NSLayoutConstraint*con in self.aboutView.constraints)
        {
            if(con.secondItem == self.privacyBu &&con.firstAttribute == NSLayoutAttributeBottom)
            {
                
                [self.aboutView removeConstraint:con];
                
                break;
            }
            
            
        }
        
        NSLayoutConstraint*con1 = [NSLayoutConstraint constraintWithItem:self.aboutImageV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.aboutView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15];
        
        
        [self.aboutView addConstraint:con1];
        
        self.aboutView.tag = 1;
        
        self.termsBu.hidden = YES;
        
        self.privacyBu.hidden = YES;
        
        [self.aboutBu setTitle: [NSString stringWithFormat:@"%C",0xf107]  forState:UIControlStateNormal];
        
    }
    else
    {
        for (NSLayoutConstraint*con in self.aboutView.constraints)
        {
            if(con.firstItem == self.aboutImageV &&con.firstAttribute == NSLayoutAttributeBottom)
            {
                
                [self.aboutView removeConstraint:con];
                
                break;
            }
            
            
        }
        
        NSLayoutConstraint*con1 = [NSLayoutConstraint constraintWithItem:self.aboutView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.privacyBu attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
        
        
        [self.aboutView addConstraint:con1];
        
        self.aboutView.tag = 0;
        
        self.termsBu.hidden = NO;
        
        self.privacyBu.hidden = NO;
        
        [self.aboutBu setTitle: [NSString stringWithFormat:@"%C",0xf106]  forState:UIControlStateNormal];
    }
    
    
    if(animate)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            aboutAnimRu = NO;
            
        }];
        
    }
    else
    {
        [self.view layoutIfNeeded];
        
         aboutAnimRu = NO;
    }
    
}

-(void)manageMenu:(BOOL)animate
{
    
    if(menuAnimRu)
    {
        
        return;
        
    }
    
    menuAnimRu = YES;
    
    if(self.menuView.tag == 0)
    {
        
        for (NSLayoutConstraint*con in self.view.constraints)
        {
            if(con.firstItem == self.menuView &&con.firstAttribute == NSLayoutAttributeLeading)
            {
                
                [self.view removeConstraint:con];
                
                break;
            }
            
            
        }
        
        NSLayoutConstraint*con1 = [NSLayoutConstraint constraintWithItem:self.menuView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        
        
        [self.view addConstraint:con1];
        
        self.menuView.tag = 1;
        
      self.menuHoverView.hidden = YES;
        
    }
    else
    {
        for (NSLayoutConstraint*con in self.view.constraints)
        {
            if(con.firstItem == self.menuView &&con.firstAttribute == NSLayoutAttributeTrailing)
            {
                
                [self.view removeConstraint:con];
                
                break;
            }
            
            
        }
        
        NSLayoutConstraint*con1 = [NSLayoutConstraint constraintWithItem:self.menuView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        
        
        [self.view addConstraint:con1];
        
        self.menuView.tag = 0;
        
        self.menuHoverView.hidden = NO;
       
    }
    
    
    if(animate)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            menuAnimRu = NO;
            
            
        }];
        
    }
    else
    {
        [self.view layoutIfNeeded];
        
        menuAnimRu = NO;
    }
    
    
        
  
    
}
    
- (void)tapGesture:(UITapGestureRecognizer *)tap
{
    // do stuff
    
    if(tap.view == self.menuHoverView)
    {
         [self manageMenu:YES];
    }
    else
    {
         [self manageTabs:tap.view];
        
        [self updateViews:tap.view.tag];
        
    }
    
   
    
    
    
}

-(void)updateViews:(NSInteger)index
{
    currentTap = index;
    
    laundreeItem*la = [[DataClass getInstance].laundreeArr objectAtIndex:index];
    
    for (bigItem*ws in la.bigs)
    {
        [ws reloadContent];
        
        for (shopItem*sh in ws.shopItems)
        {
            [sh reloadContent];
        }
    }
    
    self.totalPriceslb.text = [NSString stringWithFormat:@"AED %d",[la totalPrice]];
    
    self.totalItemslb.text = [NSString stringWithFormat:@"%d items (%d pieces)",[la totalItems],[la totalPieces]];
    
   // NSLog(@"qqqqqqqqqq %@",b.shopItems);
    
    self.dataDef = [NSMutableArray arrayWithArray:la.bigs];
    
    [self.areaSettTable reloadData];
    
}

-(void)manageTabs:(UIView*)vd
{
        
    for(int i = 0 ;i<allTabs.count;i++)
    {
        
        UIView*v = allTabs[i];
        
        UIView*b = allBorders[i];
        
        
        if(v == vd)
        {
            b.backgroundColor = [UIColor colorWithRed:0/255.0 green:197/255.0 blue:197/255.0 alpha:1];
        }
        else
        {
            b.backgroundColor = [UIColor clearColor];
        }
        
    }
        
}
    

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        if ([tableView isEqual:self.areaSettTable])
        {
            
            return [self.dataDef count] ;
            
        }
        
        return 0;
    }
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath      *)indexPath
    {
        
        
        
        if ([tableView isEqual:self.areaSettTable])
        {
            
            mainTableViewCell *cell =[self.areaSettTable dequeueReusableCellWithIdentifier:CellIdentifier1];
            
            bigItem*b1 = [self.dataDef objectAtIndex:indexPath.row];
            
            cell.currentRow = indexPath.row;
            
            cell.titlelb.text = b1.title;
            
            cell.fromAEDlb.text = [NSString stringWithFormat:@"From AED %@",b1.fromAED];
            
            cell.pricelb.text = b1.totalPrice;
            
            cell.itemsPieceslb.text = [NSString stringWithFormat:@"x %@ items %@ pieces",b1.itemsNum,b1.piecesNum];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            
            return cell;
            
            
        }
        
        return nil;
        
    }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
        
        
        if ([tableView isEqual:self.areaSettTable])
        
        {
            
            
        }
        
        
    }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        return UITableViewAutomaticDimension;
    }
    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    

 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"showAdd"]) {
        
        addViewController*newVC = segue.destinationViewController;
        
        newVC.currentTap = currentTap;
        
        newVC.comeFrom = @"main";
        
        newVC.currentRow = [sender integerValue];
        
        [mainViewController setPresentationStyleForSelfController:self presentingController:newVC];
    }
    
    
}

    + (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController
    {
        if ([NSProcessInfo instancesRespondToSelector:@selector(isOperatingSystemAtLeastVersion:)])
        {
            //iOS 8.0 and above
            presentingController.providesPresentationContextTransitionStyle = YES;
            presentingController.definesPresentationContext = YES;
            
            [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
        }
        else
        {
            [selfController setModalPresentationStyle:UIModalPresentationCurrentContext];
            [selfController.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
        }
    }

    
    

- (IBAction)menuClicked:(id)sender {
    
     [self manageMenu:YES];
  //  [self performSegueWithIdentifier:@"showAdd" sender:nil];
    
}

- (IBAction)supportClicked:(id)sender {
    
    [self manageSupport:YES];
    
    
}

- (IBAction)aboutClicked:(id)sender {
     
    [self manageAbout:YES];
    
    
}

- (IBAction)closeClicked:(id)sender {
    
      [self manageMenu:YES];
    
    
}

- (IBAction)support2Clicked:(id)sender {
    
    [self manageSupport:YES];
}

- (IBAction)about2Clicked:(id)sender {
    
     [self manageAbout:YES];
    
}
@end
