//
//  TRMetaDataTool.h
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMetaDataTool : NSObject

+ (NSArray *)parseDealsResult: (id)result;

//返回已经转换好的所有排序数组（TRSort）
+ (NSArray *)getAllSorts;
//返回已经转换好的城市数组
+ (NSArray *)getAllCities;
+ (NSArray *)getRegionsByCityName:(NSString *)cityName;
@end
