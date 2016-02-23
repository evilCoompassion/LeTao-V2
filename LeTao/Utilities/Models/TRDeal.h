//
//  TRDeal.h
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDeal : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *list_price;
@property (nonatomic, strong) NSNumber *current_price;
//已售个数
@property (nonatomic, strong) NSNumber *purchase_count;
//订单小图url
@property (nonatomic, strong)NSString *s_image_url;
@property (nonatomic, strong) NSString *desc;
@end
