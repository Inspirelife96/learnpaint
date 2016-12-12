//
//  LearnPaintViewController.m
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/19.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import "LearnPaintViewController.h"
#import "LearnPaintCell.h"
#import "CourseViewController.h"

#import "SharedResource.h"

@interface LearnPaintViewController ()

@property (strong, nonatomic) NSArray *bookRowArray;
@property (strong, nonatomic) NSArray *bookRowContentArray;

@end

@implementation LearnPaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _learnPaintTableView.delegate = self;
    _learnPaintTableView.dataSource = self;
    _learnPaintTableView.tableFooterView = [[UIView alloc] init];
    
    _bookRowArray = [SharedResource sharedInstance].bookRowArray;
    _bookRowContentArray = [SharedResource sharedInstance].bookRowContentArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _bookRowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LearnPaintCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LearnPaintCell" forIndexPath:indexPath];
    cell.bookRowDict = _bookRowArray[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    CourseViewController *courseVC = [[CourseViewController alloc] init];
    courseVC.pageContentArray = _bookRowContentArray[indexPath.row];
    [self.navigationController pushViewController:courseVC animated:YES];
}

@end
