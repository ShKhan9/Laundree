//
//  detailViewController.m
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "detailViewController.h"
#import "detailTableViewCell.h"
#import "DataClass.h"
#import "laundreeItem.h"
#import "bigItem.h"
#import "addViewController.h"
static NSString *CellIdentifier1 = @"ContentCell";
@interface detailViewController ()
{
    
}

@property (nonatomic,strong)NSArray*dataDef;

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"editYDet"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"deleteYDet"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"refreshYaDetail"
                                               object:nil];
    
    self.dataDef = [NSMutableArray new];
    
   laundreeItem*la = [[DataClass getInstance].laundreeArr objectAtIndex:self.currentTap];
    
    bigItem*b = [la.bigs objectAtIndex:self.currentRow] ;
    
    for (bigItem*ws in la.bigs)
    {
        [ws reloadContent];
        
        for (shopItem*sh in ws.shopItems)
        {
            [sh reloadContent];
        }
    }
    
    self.titlelb.text = b.title;
    
    self.totalPriceslb.text = [NSString stringWithFormat:@"AED %d",[la totalPrice]];
    
    self.totalItemslb.text = [NSString stringWithFormat:@"%d items (%d pieces)",[la totalItems],[la totalPieces]];
    
    
    self.dataDef = b.shopItems;
        
    self.informlb.text =  [NSString stringWithFormat:@"%C",0xf05a];
    
    UINib *nib1 = [UINib nibWithNibName:@"detailTableViewCell" bundle:nil];
    
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
    
    
    if([DataClass getInstance].ar)
    {
        [self.backBu setTitle:[DataClass getInstance].rightArrow forState:UIControlStateNormal];
    }
    else
    {
        [self.backBu setTitle:[DataClass getInstance].leftArrow forState:UIControlStateNormal];
    }
    
    
    
}

-(void)receiveNotification:(NSNotification *)paramNotification
{
    
    
    NSString*name=paramNotification.name;
    
    if([name isEqualToString:@"editYDet"])
    {
      
       // NSInteger row = [paramNotification.object integerValue];
        
        
        
    }
    else  if([name isEqualToString:@"deleteYDet"])
    {
         NSInteger row = [paramNotification.object integerValue];
        
        laundreeItem*la = [[DataClass getInstance].laundreeArr objectAtIndex:self.currentTap];
        
        bigItem*b = [la.bigs objectAtIndex:self.currentRow] ;
         
        [b.shopItems removeObject:[b.shopItems objectAtIndex:row]];
        
        [b reloadContent];
        
        for (shopItem*sh in b.shopItems)
        {
            [sh reloadContent];
        }
        
        self.totalPriceslb.text = [NSString stringWithFormat:@"AED %d",[la totalPrice]];
        
        self.totalItemslb.text = [NSString stringWithFormat:@"%d items (%d pieces)",[la totalItems],[la totalPieces]];
        
        self.dataDef = b.shopItems;
        
        [self.areaSettTable reloadData];
    }
    else  if([name isEqualToString:@"refreshYaDetail"])
    {
        laundreeItem*la = [[DataClass getInstance].laundreeArr objectAtIndex:self.currentTap];
        
        bigItem*b = [la.bigs objectAtIndex:self.currentRow] ;
        
        for (bigItem*ws in la.bigs)
        {
            [ws reloadContent];
        }
      
        for (shopItem*sh in b.shopItems)
        {
            [sh reloadContent];
        }
        
        self.totalPriceslb.text = [NSString stringWithFormat:@"AED %d",[la totalPrice]];
        
        self.totalItemslb.text = [NSString stringWithFormat:@"%d items (%d pieces)",[la totalItems],[la totalPieces]];
        
        self.dataDef = b.shopItems;
        
        [self.areaSettTable reloadData];
    }
    
}

 -(void)dealloc
 {
     [[NSNotificationCenter defaultCenter] removeObserver:self];
    
 }

-(void)viewDidLayoutSubviews
 {
     self.addBu.layer.cornerRadius = self.addBu.bounds.size.height/2;
     
        
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
            
            detailTableViewCell *cell =[self.areaSettTable dequeueReusableCellWithIdentifier:CellIdentifier1];
            
            cell.currentRow = indexPath.row;
            
            shopItem*sh = [self.dataDef objectAtIndex:indexPath.row];
            
            cell.itemNumlb.text = [NSString stringWithFormat:@"ITEM#%d",indexPath.row+1];
            
            cell.serviceslb.text = [NSString stringWithFormat:@"Services: %@",[sh formattedServices]];
            
            cell.qtylb.text = [NSString stringWithFormat:@"QTY: %@ Pieces",sh.qty];
            
            cell.pricelb.text = [NSString stringWithFormat:@"%@ AED",sh.price];
            
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
        
        newVC.currentTap = self.currentTap;
        
        newVC.comeFrom = @"detail";
        
        newVC.currentRow = [sender integerValue];
        
        [detailViewController setPresentationStyleForSelfController:self presentingController:newVC];
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



- (IBAction)addClicked:(id)sender
{
    
    [self performSegueWithIdentifier:@"showAdd" sender:nil];
    
}

- (IBAction)backClicked:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"refreshYaMain"
     object:nil
     ];
    
}
@end
