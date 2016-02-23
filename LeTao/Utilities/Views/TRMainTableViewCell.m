//
//  TRMainTableViewCell.m
//  LeTao
//
//  Created by tarena on 16/2/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRMainTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface TRMainTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *dealImageView;
@property (weak, nonatomic) IBOutlet UILabel *dealDescLabel;
//团购价格
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
//原价
@property (weak, nonatomic) IBOutlet UILabel *listPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *discountButton;
@property (weak, nonatomic) IBOutlet UILabel *purchaseCountLabel;



@end


@implementation TRMainTableViewCell

- (void) setDeal:(TRDeal *)deal {
    
    [self.dealImageView sd_setImageWithURL:[NSURL URLWithString:deal.s_image_url] placeholderImage:[UIImage imageNamed:@"placeholder_deal"]];
    self.dealDescLabel.text = deal.title;
    self.listPriceLabel.text = [NSString stringWithFormat:@"¥%@",deal.list_price];
    self.currentPriceLabel.text = [NSString stringWithFormat:@"¥%@",deal.current_price];
    //计算折扣
    float discount = [deal.current_price floatValue] / [deal.list_price floatValue] *100;
    [self.discountButton setTitle:[NSString stringWithFormat:@"%.2f%%折扣",discount] forState:UIControlStateNormal];
    self.purchaseCountLabel.text = [NSString stringWithFormat:@"已售:%@",deal.purchase_count];
    //_deal = deal;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
