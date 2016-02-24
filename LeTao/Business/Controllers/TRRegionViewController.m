//
//  TRRegionViewController.m
//  LeTao
//
//  Created by tarena on 16/2/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRRegionViewController.h"
#import "TRMetaDataTool.h"
#import "TRRegion.h"
#import "TRMetaDataView.h"
#import "TRTableViewCell.h"
@interface TRRegionViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) TRMetaDataView *metaDataView;
@property (nonatomic, strong) NSArray *regionArray;
@end

@implementation TRRegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor redColor];
    //TRMetaDataTool *cityArray = [TRMetaDataTool getAllCities];
    //创建并添加自定义视图
    
    [self addMetaDataView];
}

#pragma mark - With View

- (void) addMetaDataView {
    self.metaDataView = [[[NSBundle mainBundle]loadNibNamed:@"TRMetaDataView" owner:self options:nil] firstObject];
    self.metaDataView.frame = self.view.bounds;
    //设置主子表视图
    self.metaDataView.mainTableView.delegate = self;
    self.metaDataView.mainTableView.dataSource = self;
    self.metaDataView.subTableView.delegate = self;
    self.metaDataView.subTableView.dataSource = self;
    //获取数据源
#warning TODO:设置城市名字
    self.regionArray = [TRMetaDataTool getRegionsByCityName:@"济南"];
    [self.view addSubview:self.metaDataView];
}


#pragma mark - dataSource / delegate 
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.metaDataView.mainTableView) {
        
        return self.regionArray.count;
    }else {
        //获取左边选中的行号
        NSInteger selectedRow = [self.metaDataView.mainTableView indexPathForSelectedRow].row;
       TRRegion *region = self.regionArray[selectedRow];
        return region.subregions.count;
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.metaDataView.mainTableView) {
        
       TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedImageName:@"bg_dropdown_left_selected"];
        //text,accessoryView,dataSource
        TRRegion *region = self.regionArray[indexPath.row];
        cell.textLabel.text = region.name;
        if (region.subregions.count > 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
        
    }else {
        TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_rightpart" withSelectedImageName:@"bg_dropdown_right_selected"];
        //选择的行号
        NSInteger selectedRow = [self.metaDataView.mainTableView indexPathForSelectedRow].row;
        TRRegion *region = self.regionArray[selectedRow];
        cell.textLabel.text = region.subregions[indexPath.row];
        return cell;
    }
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.metaDataView.mainTableView) {
        [self.metaDataView.subTableView reloadData];
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
