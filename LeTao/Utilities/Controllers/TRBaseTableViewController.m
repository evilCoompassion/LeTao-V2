//
//  TRBaseTableViewController.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRBaseTableViewController.h"
#import "Constants.h"
#import "MJRefresh.h"
#import "DPAPI.h"
#import "TRMainTableViewCell.h"
#import "TRDeal.h"
#import "TRMetaDataTool.h"
@interface TRBaseTableViewController ()<UITableViewDelegate, UITableViewDataSource, DPRequestDelegate>
@property (nonatomic, strong) NSMutableArray *dealsArray;//适应上拉加载
@property (nonatomic,assign) int page;

@end

@implementation TRBaseTableViewController

- (NSMutableArray *)dealsArray {
    if (!_dealsArray) {
        _dealsArray = [NSMutableArray array];
    }
    return _dealsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建tableView
    [self createTableView];
    //注册xib加载的单元格对象
    [self.tableView registerNib:[UINib nibWithNibName:@"TRMainTableViewCell" bundle:nil] forCellReuseIdentifier:@"mainCell"];
    //创建上拉/下拉控件
    [self addRefreshControl];
}

#pragma mark - 和界面相关的方法
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (void)addRefreshControl {
    //下拉刷新控件
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDeals)];
    //设置动画
    [self.tableView.mj_header beginRefreshing];
    //上拉刷新控件
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget: self refreshingAction:@selector(loadMoreDeals)];
    
}
#pragma mark - 和服务器相关方法
- (void) sendRequestToServer {
    //api对象
    DPAPI *api = [DPAPI new];
    //设置发送请求参数
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    //"调用"子类设置请求参数的方法(真正实现由子类)
    //[self settingParams:mutableDic];
#warning hardCode
    mutableDic[@"city"] = @"济南";
    mutableDic[@"page"] = @(self.page);
    //发送请求
    [api requestWithURL:@"v1/deal/find_deals" params:mutableDic delegate:self];
}

- (void) loadNewDeals {
    self.page = 1;
    [self sendRequestToServer];
    
}

- (void) loadMoreDeals {
    self.page++;
    [self sendRequestToServer];
}



//成功返回
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    //解析返回的JSON数据(result)
    NSArray * dealsArray = [TRMetaDataTool parseDealsResult:result];
    [self.dealsArray addObjectsFromArray:dealsArray];
   
    [self.tableView reloadData];
    //停止动画
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
//失败返回
- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    
    //停止动画
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - delegate/dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dealsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TRMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    //设置cell的6个控件
    //获取indexPath这行所对应的数据源
    TRDeal *deal = self.dealsArray[indexPath.row];
    cell.deal = deal;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
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
