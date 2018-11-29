//
//  TitleScrollView.h
//  ZZExcel
//
//  Created by dengtacj on 2018/11/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

@property (nonatomic, strong) UIScrollView *rowScrollView;;

- (void)updateViewWithData:(NSArray *)items;
@end
