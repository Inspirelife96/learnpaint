//
//  SharedResource.h
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/19.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedResource : NSObject

@property (strong, nonatomic) NSArray *bookRowArray;
@property (strong, nonatomic) NSArray *bookRowContentArray;
@property (strong, nonatomic) NSArray *tipsArray;
@property (strong, nonatomic) NSArray *courseImageArray;

+ (instancetype)sharedInstance;

@end
