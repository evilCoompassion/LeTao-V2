//
//  TRRegion.h
//  LeTao
//
//  Created by tarena on 16/2/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRRegion : NSObject

@property (nonatomic, strong) NSString *name;
//该主区域对应的字区域数组
@property (nonatomic, strong) NSArray *subregions;

@end
