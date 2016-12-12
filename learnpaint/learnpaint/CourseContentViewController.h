//
//  CourseContentViewController.h
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/20.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseContentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *courseContentTableView;
@property (strong, nonatomic) NSDictionary *content;

@end
