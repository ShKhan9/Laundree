//
//  detailTableViewCell.m
//  Laundree
//
//  Created by ShKhan on 11/13/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

#import "detailTableViewCell.h"

@implementation detailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editClicked:(id)sender {
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"editYDet"
     object:[NSString stringWithFormat:@"%d",self.currentRow]
     ];
    
    
}

- (IBAction)deleteClicked:(id)sender {
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"deleteYDet"
     object:[NSString stringWithFormat:@"%d",self.currentRow]
     ];
    
    
}
@end
