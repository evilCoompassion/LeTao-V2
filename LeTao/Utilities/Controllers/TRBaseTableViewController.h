//
//  TRBaseTableViewController.h
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRBaseTableViewController : UIViewController

//声明tableView
@property (nonatomic, strong) UITableView *tableView;

//由父类调用，由子类实现(三个子类:首页/商家/搜索)
- (void)settingParams:(NSMutableDictionary *)mutableDic;






@end
