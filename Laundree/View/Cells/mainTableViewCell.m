//
//  mainTableViewCell.m
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "mainTableViewCell.h"

@implementation mainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   // self.layer.cornerRadius = 10;
    
   // self.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addClicked:(id)sender
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"pushAddYaMain"
     object:[NSString stringWithFormat:@"%d",self.currentRow]
     ];
    
}

- (IBAction)detailsClicked:(id)sender
{
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"pushDetailYaMain"
     object:[NSString stringWithFormat:@"%d",self.currentRow]
     ];
    
    
}
@end
