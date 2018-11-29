//
//  HeaderItemView.m
//  ZZExcel
//
//  Created by dengtacj on 2018/11/29.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "HeaderItemView.h"
#import "ALView+PureLayout.h"

@interface HeaderItemView()
@property (nonatomic, strong) UIView *contentView;
@end

@implementation HeaderItemView

- (instancetype)init
{
    if (self == [super init]) {

        self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderItemView" owner:self options:nil] lastObject];
        [self addSubview:self.contentView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.contentView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderItemView" owner:self options:nil] lastObject];
        [self addSubview:self.contentView];
        [self.contentView autoPinEdgesToSuperviewEdges];
    }
    
    return self;
}


/**
 从nib加载View 系统自动调用 进行初始化操作
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        
    }
    
    return self;
}


/**
 从nib加载View 系统自动调用 进行初始化操作
 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.titleLabel.text = @"初始化";

}


@end
