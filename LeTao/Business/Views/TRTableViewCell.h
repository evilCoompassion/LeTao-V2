//
//  TRTableViewCell.h
//  LeTao
//
//  Created by tarena on 16/2/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRTableViewCell : UITableViewCell

//给定cell的两个图片的名字和tableView，返回已经创建／重用好的单元格对象
+ (TRTableViewCell *)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName;
@end
