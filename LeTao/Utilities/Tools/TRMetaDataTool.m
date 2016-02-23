//
//  TRMetaDataTool.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRMetaDataTool.h"
#import "TRDeal.h"
@implementation TRMetaDataTool

+ (NSArray *)parseDealsResult:(id)result {
    //获取deals对应数组
   NSArray *dealsArray = result[@"deals"];
    //循环字典转换成TRDeal
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in dealsArray) {
        TRDeal *deal = [TRDeal new];
        [deal setValuesForKeysWithDictionary:dic];
        [mutableArray addObject:deal];
    }
    return [mutableArray copy];
}


@end
