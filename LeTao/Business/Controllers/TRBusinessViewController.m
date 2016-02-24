//
//  TRBusinessViewController.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRBusinessViewController.h"
#import "TRBussinseeHeaderView.h"
#import "Constants.h"
#import "UIView+Extension.h"
#import "TRSortViewController.h"
#import "TRRegionViewController.h"
@interface TRBusinessViewController ()<UIPopoverPresentationControllerDelegate>
@property (nonatomic, strong) TRBussinseeHeaderView *headerView;
@property (nonatomic, strong) TRSortViewController *sortViewController;
@property (nonatomic, strong) TRRegionViewController *regionViewController;
@end

@implementation TRBusinessViewController

- (TRRegionViewController *) regionViewController {
    if (!_regionViewController) {
        _regionViewController = [TRRegionViewController new];
    }
    return _regionViewController;
}

- (TRSortViewController *) sortViewController {
    if (!_sortViewController) {
        _sortViewController = [TRSortViewController new];
    }
    return _sortViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHeaderView];
    [self addTargetToButton];
   
}
#pragma mark - with View
- (void) addTargetToButton {
    //排序
    [self.headerView.sortButton addTarget:self action:@selector(clickSortButton) forControlEvents:UIControlEventTouchUpInside];
    //区域
    [self.headerView.regionButton addTarget:self action:@selector(clickRegionButton) forControlEvents:UIControlEventTouchUpInside];
    //分类
#warning 分类
    
}



- (void) setUpHeaderView {
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"TRBussinessHeaderView" owner:self options:nil] firstObject];
   self.headerView.frame = CGRectMake(0, BUSINESS_HEADER_Y, SCREEN_WIDTH, BUSINESS_HEADER_HEIGHT);
    
    
    //添加
    [self.view addSubview:self.headerView];
    self.tableView.y = BUSINESS_HEADER_HEIGHT;
    //顶部视图添加三个触发方法
    
}

#pragma mark - 头部视图按钮的触发方法
- (void) clickSortButton {
    //创建并弹出一个箭头控制器(懒加载)
    self.sortViewController.modalPresentationStyle = UIModalPresentationPopover;
    //模式
    
    //弹出区域
    self.sortViewController.popoverPresentationController.sourceView = self.headerView.sortButton;
    //箭头位置
    self.sortViewController.popoverPresentationController.sourceRect = self.headerView.sortButton.bounds;
    //设置代理
    self.sortViewController.popoverPresentationController.delegate = self;
    [self presentViewController:self.sortViewController animated:YES completion:nil];
}
- (void) clickRegionButton {
    self.regionViewController.modalPresentationStyle = UIModalPresentationPopover;
    //模式
    
    //弹出区域
    self.regionViewController.popoverPresentationController.sourceView = self.headerView.regionButton;
    //箭头位置
    self.regionViewController.popoverPresentationController.sourceRect = self.headerView.regionButton.bounds;
    //设置代理
    self.regionViewController.popoverPresentationController.delegate = self;
    [self presentViewController:self.regionViewController animated:YES completion:nil];
    
    
    
}

#pragma mark - popover Delegate

- (UIModalPresentationStyle) adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
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
