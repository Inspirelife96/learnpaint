//
//  TimeLineCell.m
//  d3storm
//
//  Created by Chen XueFeng on 16/6/13.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import "CourseContentCell.h"


@interface CourseContentCell ()


@end

@implementation CourseContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setContent:(NSDictionary *)content {
    _content = content;
    self.selectionStyle = UITableViewCellSelectionStyleNone;    
    self.headLabel.text = content[@"head"];
    self.contentLabel.text = content[@"detail"];
    self.contentImageView.image = [UIImage imageNamed:content[@"image"]];
    if (content[@"upload"]) {
        [_uploadButton setHidden:NO];
    } else {
        [_uploadButton setHidden:YES];
    }
}

- (IBAction)clickUploadButton:(id)sender {
    
}


@end
