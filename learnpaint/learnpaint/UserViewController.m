//
//  UserViewController.m
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/20.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import "UserViewController.h"
#import "UserProfileCell.h"
#import "UserScoreCell.h"
#import "UserDefaultCell.h"
#import "SettingViewController.h"

#import <AVOSCloud/AVOSCloud.h>
#import "CDLoginVC.h"
#import "CDBaseNavC.h"

@interface UserViewController ()

@property (strong, nonatomic) NSArray *sectionArray;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sectionArray = @[@[@"用户名等"],
                      @[@"我的贡献"],
                      @[@"我的赞"],
                      @[@"我的消息",@"我的好友"],
                      @[@"设置"]];
    
    _userTableView.delegate = self;
    _userTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowArray = _sectionArray[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UserProfileCell *profileCell = [tableView dequeueReusableCellWithIdentifier:@"UserProfileCell" forIndexPath:indexPath];
        return profileCell;
    } else if (indexPath.section == 1) {
        UserScoreCell *scoreCell = [tableView dequeueReusableCellWithIdentifier:@"UserScoreCell" forIndexPath:indexPath];
        return scoreCell;
    } else if (indexPath.section == 2) {
        UserScoreCell *scoreCell = [tableView dequeueReusableCellWithIdentifier:@"UserScoreCell" forIndexPath:indexPath];
        return scoreCell;
    } else {
        UserDefaultCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:@"UserDefaultCell" forIndexPath:indexPath];
        defaultCell.textLabel.text = _sectionArray[indexPath.section][indexPath.row];
        return defaultCell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 64.0f;
    } else if (indexPath.section == 1 || indexPath.section == 2) {
        return 110.0f;
    } else {
        return 44.0f;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 4) {
        SettingViewController *settingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    
    if (indexPath.section == 0) {
        if ([AVUser currentUser]) {
            // current user exists
        } else {
            CDLoginVC *loginVC = [[CDLoginVC alloc] init];
            CDBaseNavC *loginNav = [[CDBaseNavC alloc] initWithRootViewController:loginVC];
            [self presentViewController:loginNav animated:YES completion:nil];
        }
    }
    
    
//    NSInteger section = [indexPath section];
//    NSInteger row = [indexPath row];
//    if(section == 0) {
//        MyProfileTableViewController * mptViewController = [[MyProfileTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
//        [self.navigationController pushViewController:mptViewController animated:YES];
//        
//    } else if (section == 3) {
//        
//        if (row == 0) {
//            
//            PAPActivityFeedViewController *activityFeedVC = [[PAPActivityFeedViewController alloc] initWithStyle:UITableViewStyleGrouped];
//            [self.navigationController pushViewController:activityFeedVC animated:YES];
//            
//        } else {
//            
//            PAPFindFriendsViewController *findFriendsVC = [[PAPFindFriendsViewController alloc] initWithStyle:UITableViewStyleGrouped];
//            [self.navigationController pushViewController:findFriendsVC animated:YES];
//            
//        }
//    } else if (section == 4 && row == 0) {
//        
//        BuyTableViewController *buyTVC = [[BuyTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
//        [self.navigationController pushViewController:buyTVC animated:YES];
//        
//    } else if (section == 5 && row == 0) {
//        
//        SettingTableViewController *settingTVC = [[SettingTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
//        [self.navigationController pushViewController:settingTVC animated:YES];
//        
//    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6.0f;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < - 100.0f) {
        //[self refreshScores];
    }
}

@end
