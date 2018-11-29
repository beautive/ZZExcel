//
//  IndicatorTitleCell.h
//  ZZExcel
//
//  Created by dengtacj on 2018/11/28.
//  Copyright © 2018年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExcelModel.h"

@interface IndicatorTitleCell : UITableViewCell
+ (IndicatorTitleCell *)cellWithtableView:(UITableView *)tableView;
- (void)setData:(IndicatorModel *)model;
@end


@interface ValueCell : UITableViewCell
+ (ValueCell *)cellWithtableView:(UITableView *)tableView;
- (void)setData:(ValueModel *)model;
@end
