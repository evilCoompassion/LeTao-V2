//
//  TRMetaDataTool.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRMetaDataTool.h"
#import "TRDeal.h"
#import "TRSort.h"
#import "TRCity.h"
#import "TRRegion.h"
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


+ (NSArray *)getAllSorts {
    static NSArray *_sortArray = nil;
    if (!_sortArray) {
        _sortArray = [[self alloc]getAndParseWithPlistFile:@"sorts.plist" withClass:[TRSort class]];
    }
    
    return _sortArray;
}

+ (NSArray *)getAllCities {
    static NSArray *_cityArray = nil;
    if (!_cityArray) {
        _cityArray = [[self alloc]getAndParseWithPlistFile:@"cities.plist" withClass:[TRCity class]];
    }
    return _cityArray;
}

+ (NSArray *)getRegionsByCityName:(NSString *)cityName {
    //获取所有的城市数组
    NSArray *cityArray = [self getAllCities];
    //循环找cityName
    TRCity *findCity = nil;
    for (TRCity *city in cityArray) {
        if ([city.name isEqualToString:cityName]) {
            findCity = city;
            break;
        }
    }
    //返回cityName这个城市的所有区域数组
   return [[self alloc]getArrayWithModel:[TRRegion class] andArray:findCity.regions];
    
}

- (NSArray *)getAndParseWithPlistFile:(NSString *)plistFile withClass:(Class)modelClass{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistFile ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
//    NSMutableArray *mutableArray = [NSMutableArray array];
//    for (NSDictionary *dic in array) {
//        TRSort *sort = [TRSort new];
//        [sort setValuesForKeysWithDictionary:dic];
//        [mutableArray addObject:sort];
//    }
//    return [mutableArray copy];
    
    return [self getArrayWithModel:modelClass andArray:array];
}

- (NSArray *)getArrayWithModel:(Class)modelClass andArray:(NSArray *)array {
   
     NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        id instance = [modelClass new];
        [instance setValuesForKeysWithDictionary:dic];
        [mutableArray addObject:instance];
    }
    return [mutableArray copy];
}




@end
