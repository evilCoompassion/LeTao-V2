//
//  TRBaseNavController.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRBaseNavController.h"
#import "FlatUIKit.h"

@interface TRBaseNavController ()

@end

@implementation TRBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //修改navigationBar的背景颜色#eb5352
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorFromHexCode:@"eb5352"]];
    //文本颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    //tabBarItem选中渲染模式
    self.tabBarItem.selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置tabBarItem的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorFromHexCode:@"eb5352"], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
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
