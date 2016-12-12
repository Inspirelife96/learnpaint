//
//  LearnPaintViewController.h
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/19.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnPaintViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(weak, nonatomic) IBOutlet UITableView *learnPaintTableView;

@end
