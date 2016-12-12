//
//  SettingNotificationCell.h
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/21.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *notificationTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationTimeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *notificationSwitch;

@end
