//
//  TitleScrollView.m
//  ZZExcel
//
//  Created by dengtacj on 2018/11/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#define maxNumber 10
#define startTag 100

#import "HeaderView.h"
#import "HeaderItemView.h"

#import "ExcelDefine.h"

#import "ALView+PureLayout.h"

@interface HeaderView()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HeaderView

- (instancetype)init;
{
    if (self = [super init]) {
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.rowScrollView];
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.titleLabel autoSetDimension:ALDimensionWidth toSize:indicatorsColWidth];
        
        [self.rowScrollView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.rowScrollView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.rowScrollView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.rowScrollView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleLabel];
        
    }
    
    return self;
}

- (void)updateViewWithData:(NSArray *)items;
{
    [self.rowScrollView setContentSize:CGSizeMake(items.count * valueColWidth, headerViewHeight)];

    for (NSUInteger i = 0; i < maxNumber; i++) {
        
        HeaderItemView *itemView = [self viewWithTag:startTag + i];
        
        if (i < items.count) {
            itemView.titleLabel.text = [items objectAtIndex:i];
            itemView.hidden = NO;
        } else {
            itemView.hidden = YES;
        }
    }
}

#pragma mark - layer
- (UIScrollView *)rowScrollView
{
    if (_rowScrollView == nil) {
        _rowScrollView = [UIScrollView newAutoLayoutView];
        _rowScrollView.contentSize = CGSizeMake(500, headerViewHeight);
        
        for (int i = 0; i < maxNumber; i++) {
            HeaderItemView *itemView = [[HeaderItemView alloc] initWithFrame:CGRectMake(i * valueColWidth, 0, valueColWidth, headerViewHeight)];
            itemView.tag = startTag + i;
            [_rowScrollView addSubview:itemView];
        }
    }
    
    return _rowScrollView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @" 对比项";
        _titleLabel.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _titleLabel;
}


@end
