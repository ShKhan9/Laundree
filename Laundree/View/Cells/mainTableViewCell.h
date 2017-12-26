//
//  mainTableViewCell.h
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titlelb;

@property (weak, nonatomic) IBOutlet UILabel *fromAEDlb;

@property (weak, nonatomic) IBOutlet UILabel *itemsPieceslb;

@property (weak, nonatomic) IBOutlet UILabel *pricelb;

@property  NSInteger currentRow;



- (IBAction)addClicked:(id)sender;

- (IBAction)detailsClicked:(id)sender;

@end
