//
//  detailTableViewCell.h
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemNumlb;

@property (weak, nonatomic) IBOutlet UILabel *serviceslb;

@property (weak, nonatomic) IBOutlet UILabel *qtylb;

@property (weak, nonatomic) IBOutlet UILabel *pricelb;

@property NSInteger currentRow;


- (IBAction)editClicked:(id)sender;

- (IBAction)deleteClicked:(id)sender;





@end
