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
@interface TRBusinessViewController ()

@end

@implementation TRBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHeaderView];
   
}
- (void) setUpHeaderView {
    TRBussinseeHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"TRBussinessHeaderView" owner:self options:nil] firstObject];    headerView.frame = CGRectMake(0, BUSINESS_HEADER_Y, SCREEN_WIDTH, BUSINESS_HEADER_HEIGHT);
    //添加
    [self.view addSubview:headerView];
    self.tableView.y = BUSINESS_HEADER_HEIGHT;
    
    
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
