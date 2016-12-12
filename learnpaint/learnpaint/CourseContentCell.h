//
//  TimeLineCell.h
//  d3storm
//
//  Created by Chen XueFeng on 16/6/13.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseContentCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *headLabel;
@property(nonatomic, weak) IBOutlet UILabel *contentLabel;
@property(nonatomic, weak) IBOutlet UIImageView *contentImageView;
@property(nonatomic, weak) IBOutlet UIButton *uploadButton;

@property (nonatomic, strong) NSDictionary *content;

- (IBAction)clickUploadButton:(id)sender;

@end
