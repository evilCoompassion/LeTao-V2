//
//  TRSortViewController.m
//  LeTao
//
//  Created by tarena on 16/2/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRSortViewController.h"
#import "TRMetaDataTool.h"
#import "TRSort.h"
@interface TRSortViewController ()
@property (nonatomic, strong)NSArray *sortArray;
@end
static const CGFloat inset = 20;
static const CGFloat buttonWidth = 100;
static const CGFloat buttonHeight = 30;
@implementation TRSortViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor redColor];
    self.preferredContentSize = CGSizeMake(140, 7*(inset+buttonHeight)+inset);
    self.sortArray = [TRMetaDataTool getAllSorts];
    //循环创建button
    for (int i = 0; i < self.sortArray.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(inset, i*(inset+buttonHeight)+inset, buttonWidth, buttonHeight);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateHighlighted];
        TRSort *sort =self.sortArray[i];
        [button setTitle:sort.label forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
