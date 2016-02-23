//
//  TRDeal.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRDeal.h"

@implementation TRDeal

//手动实现字典中的description的模型desc之间的转化
- (void) setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
}

@end
