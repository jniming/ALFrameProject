//
//  BaseTableViewCell.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
         self.accessibilityIdentifier = @"table_cell";
        
        [self setupView];
        [self setupConstraints];
    }

    return self;
}
-(void)setupView{
    UIView *v=[[UIView alloc]init];
    
    v.backgroundColor=[UIColor redColor];
    
    [self.contentView addSubview:v];
    
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.size.mas_equalTo(CGPointMake(SCREEN_WIDTH, SCREEN_WIDTH));
    }];

}
-(void)setupConstraints{

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
