//
//  IndicatorTitleCell.m
//  ZZExcel
//
//  Created by dengtacj on 2018/11/28.
//  Copyright © 2018年 zz. All rights reserved.
//

#define defaultNumber 5

#import "IndicatorTitleCell.h"
#import "ExcelDefine.h"

@implementation IndicatorTitleCell

+ (IndicatorTitleCell *)cellWithtableView:(UITableView *)tableView;
{
    static NSString * const ID = @"IndicatorTitleCellID";
    
    IndicatorTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[IndicatorTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.textColor = [UIColor blueColor];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.text = @"--";
    }
    
    return self;
}

- (void)setData:(IndicatorModel *)model
{
    self.textLabel.text = model.titleString;
}


@end


@interface ValueCell()

@property (nonatomic, strong) NSMutableArray *itemLabels;

@end

@implementation ValueCell

+ (ValueCell *)cellWithtableView:(UITableView *)tableView;
{
    static NSString * const ID = @"ValueCellID";
    
    ValueCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[ValueCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        for (int i = 0; i < defaultNumber; i++) {
            
            UILabel *label = [self createLabelWithIndex:i];
            [self.itemLabels addObject:label];
            [self.contentView addSubview:label];
            label.hidden = YES;
        }
    }
    
    return self;
}

- (void)setData:(ValueModel *)model
{
    NSArray *valueItems = model.valueItems;
    
    if (self.itemLabels.count >= valueItems.count) {
        
        for (int i = 0; i < valueItems.count; i++) {
            NSString *stringValue = [valueItems objectAtIndex:i];
            UILabel *label = [self.itemLabels objectAtIndex:i];
            label.text = stringValue;
            label.hidden = NO;
        }
        
        for (NSInteger i = valueItems.count; i < self.itemLabels.count; i++) {
            UILabel *label = [self.itemLabels objectAtIndex:i];
            label.hidden = YES;
        }
        
    } else {
        
        for (int i = 0; i < valueItems.count; i++) {
            
            UILabel *itemLabel;
            
            if (i < self.itemLabels.count) {
                
                itemLabel = [self.itemLabels objectAtIndex:i];
                itemLabel.hidden = NO;
                
            } else {
                
                itemLabel = [self createLabelWithIndex:i];
                [self.contentView addSubview:itemLabel];
                [self.itemLabels addObject:itemLabel];
            }
            
            itemLabel.text = [valueItems objectAtIndex:i];
        }
    }
}

- (UILabel *)createLabelWithIndex:(int)i;
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * valueColWidth, 0, valueColWidth, 40)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"--";
    
    return label;
}

- (NSMutableArray *)itemLabels
{
    if (_itemLabels == nil) {
        _itemLabels = [[NSMutableArray alloc] initWithCapacity:defaultNumber];
    }
    
    return _itemLabels;
}

@end

