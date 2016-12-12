//
//  SharedResource.m
//  learnpaint
//
//  Created by Chen XueFeng on 16/8/19.
//  Copyright © 2016年 Chen XueFeng. All rights reserved.
//

#import "SharedResource.h"

static SharedResource *instance = nil;

@implementation SharedResource

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    
    return instance;
}

- (SharedResource *)init {
    self = [super init];
    if (self) {
        NSString *bookRowPathString = [[NSBundle mainBundle] pathForResource:@"bookRow" ofType:@"plist"];
        NSString *bookRowContentPathString = [[NSBundle mainBundle] pathForResource:@"bookRowContent" ofType:@"plist"];
        
        _bookRowArray = [NSArray arrayWithContentsOfFile:bookRowPathString];
        _bookRowContentArray = [NSArray arrayWithContentsOfFile:bookRowContentPathString];
    }
    
    return self;
}

@end


