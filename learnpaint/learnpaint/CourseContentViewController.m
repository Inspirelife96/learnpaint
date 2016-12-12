//
//  CourseContentViewController.m
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/20.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import "CourseContentViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "CourseContentCell.h"

@interface CourseContentViewController ()

@end

@implementation CourseContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _courseContentTableView.delegate = self;
    _courseContentTableView.dataSource = self;
    _courseContentTableView.tableFooterView = [[UIView alloc] init];

    //[self.view setBackgroundColor:FlatRed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CourseContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"CourseContentCell"];
    [self configureCell:contentCell atIndexPath:indexPath];
    return contentCell;
}

- (void)configureCell:(CourseContentCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    cell.content = _content;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height =  [tableView fd_heightForCellWithIdentifier:@"CourseContentCell" configuration:^(CourseContentCell *cell) {
        [self configureCell:cell atIndexPath:indexPath];
    }];
    
    return height;
}

@end
