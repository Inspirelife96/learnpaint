//
//  SettingViewController.m
//  
//
//  Created by Chen XueFeng on 16/5/27.
//
//

#import "SettingViewController.h"
#import "SettingNotificationCell.h"

#import "IAPViewController.h"
#import "UIViewController+Share.h"
#import "UIViewController+SendEmailInApp.h"
#import "ActionSheetDatePicker.h"
#import "NSObject+LocalNotification.h"

@interface SettingViewController ()

@property(copy, nonatomic) NSArray *sectionTitleArray;
@property(copy, nonatomic) NSArray *sectionContentArray;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    _settingTableView.dataSource = self;
    _settingTableView.delegate = self;
    _settingTableView.tableFooterView = [[UIView alloc] init];

    _sectionContentArray = @[@[@"每日提醒"],
                  @[@"意见与反馈"],
                  @[@"去评分啦", @"分享给好友"],
                  @[@"购买"],
                  @[@"隐私政策"]
                  ];
    
    _sectionTitleArray = @[@"", @"", @"", @"", @""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionContentArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowArray = (NSArray *)_sectionContentArray[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        SettingNotificationCell *notificationCell = [tableView dequeueReusableCellWithIdentifier:@"SettingNotificationCell" forIndexPath:indexPath];
        notificationCell.notificationTitleLabel.text = _sectionContentArray[indexPath.section][indexPath.row];
        notificationCell.notificationTimeLabel.text = [[[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultDailyNotification] substringToIndex:5];
        [notificationCell.notificationSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultDailyNotificationStatus]];
        [notificationCell.notificationSwitch addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventValueChanged];
        return notificationCell;
    } else {
        UITableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:@"SettingDefaultCell" forIndexPath:indexPath];
        defaultCell.textLabel.text = _sectionContentArray[indexPath.section][indexPath.row];
        return defaultCell;
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString* timeString = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultDailyNotification];
        NSDate *selectedDate = [formatter dateFromString:timeString];
        
        ActionSheetDatePicker *datePicker = [[ActionSheetDatePicker alloc] initWithTitle:NSLocalizedStringFromTable(@"select your time", @"learnpaint", nil) datePickerMode:UIDatePickerModeTime selectedDate:selectedDate target:self action:@selector(dateWasSelected:element:) origin:self.view];
        [datePicker showActionSheetPicker];
    } else if (indexPath.section == 1) {
        NSString *subject = @"小说，CG合集 For 守望先锋 用户反馈";
        NSArray *recipientArray = [NSArray arrayWithObject: @"inspirelife@hotmail.com"];
        NSString *body = @"";
        
        NSDictionary *emaidContentDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                          subject, @"subject",
                                          recipientArray, @"recipients",
                                          body, @"body",
                                          nil];
        
        [self sendMailInApp:emaidContentDict];
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kAppReviewURL]];
        } else {
            [self shareMessage:@"我正在用［小说，CG合集 For 守望先锋］看守望先锋的故事，快来和我一起体验史诗故事吧！下载地址：http://itunes.apple.com/app/id1133026944" onView:currentCell];
        }
    } else if (indexPath.section == 3) {
        IAPViewController *IAPVC = [[IAPViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:IAPVC animated:YES];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:NSLocalizedStringFromTable(@"privacy url", @"learnpaint", nil)]];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_sectionTitleArray objectAtIndex:section];
}

-(void)dateWasSelected:(NSDate *)selectedDate element:(id)element {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *timeString = [dateFormatter stringFromDate:selectedDate];

    [[NSUserDefaults standardUserDefaults] setBool:true forKey:kUserDefaultDailyNotificationStatus];
    [[NSUserDefaults standardUserDefaults] setObject:timeString forKey:kUserDefaultDailyNotification];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self cancelLocalNotification:@"DailyNotificationKey" notificationId:@"DailyNotificationId"];
    [self postLocalNotification:selectedDate alertMessage:@"绘画时间咯！！！" notificationInfo:@{@"DailyNotificationKey":@"DailyNotificationId"}];
    
    [_settingTableView reloadData];
}

- (void)clickSwitch:(id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    [self cancelLocalNotification:@"DailyNotificationKey" notificationId:@"DailyNotificationId"];
    if ([switchButton isOn]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString* timeString = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultDailyNotification];
        NSDate *selectedDate = [formatter dateFromString:timeString];
        [self postLocalNotification:selectedDate alertMessage:@"绘画时间咯！！！" notificationInfo:@{@"DailyNotificationKey":@"DailyNotificationId"}];
    }
}

@end
