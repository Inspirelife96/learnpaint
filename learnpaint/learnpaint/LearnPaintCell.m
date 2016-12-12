//
//  LeanPaintCell.m
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/19.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import "LearnPaintCell.h"

@implementation LearnPaintCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBookRowDict:(NSDictionary *)bookRowDict {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.imageView.image = [UIImage imageNamed:bookRowDict[@"image"]];
    self.textLabel.text = bookRowDict[@"name"];
}

@end
