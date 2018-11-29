//
//  ViewController.m
//  ZZExcel
//
//  Created by dengtacj on 2018/11/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "ExcelSingleViewController.h"
#import "HeaderView.h"
#import "IndicatorTitleCell.h"

#import "ExcelModel.h"
#import "ArrayDataSource.h"
#import "ExcelDefine.h"

#import "ALView+PureLayout.h"

@interface ExcelSingleViewController ()<UITableViewDelegate>

//UI
@property (nonatomic, strong) HeaderView *headerView;
@property (nonatomic, strong) UIScrollView *valueScrollView;
@property (nonatomic, strong) UITableView *valueTableView;
@property (nonatomic, strong) UITableView *indicatorsTableView;

//Data
@property (nonatomic, strong) NSMutableArray *indicators;
@property (nonatomic, strong) NSMutableArray *values;
@property (nonatomic, strong) ArrayDataSource *indicatorsDataSource;
@property (nonatomic, strong) ArrayDataSource *valuesDataSource;

@end

@implementation ExcelSingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
    
    [self requstData];
}

- (void)setupUI;
{
    self.title = @"多项对比";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.headerView];
    [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.headerView autoSetDimension:ALDimensionHeight toSize:headerViewHeight];
    
    [self.view addSubview:self.indicatorsTableView];
    [self.indicatorsTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView];
    [self.indicatorsTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.indicatorsTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.indicatorsTableView autoSetDimension:ALDimensionWidth toSize:indicatorsColWidth];
    
    [self.view addSubview:self.valueScrollView];
    [self.valueScrollView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView];
    [self.valueScrollView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.indicatorsTableView];
    [self.valueScrollView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.valueScrollView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
    [self.valueScrollView addSubview:self.valueTableView];
    
}

- (void)setupData;
{
    [self.indicatorsTableView registerClass:[IndicatorTitleCell class] forCellReuseIdentifier:@"IndicatorTitleCellID"];
    [self.valueTableView registerClass:[ValueCell class] forCellReuseIdentifier:@"ValueCellID"];
}

#pragma mark - Data
- (void)requstData;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (int i = 0; i < 40; i++) {
            
            IndicatorModel *indicatorModel = [[IndicatorModel alloc] init];
            indicatorModel.titleString = [NSString stringWithFormat:@"%@%@",@"item",@(i)];
            [self.indicators addObject:indicatorModel];
            
            ValueModel *valueModel = [[ValueModel alloc] init];
            valueModel.valueItems = @[@"valueItem1",@"valueItem2",@"valueItem3",@"valueItem4",@"valueItem5",@"valueItem6",@"valueItem7",@"valueItem8",@"valueItem9",@"valueItem10"];
            [self.values addObject:valueModel];
        }
        
        [self.indicatorsTableView reloadData];
        [self.valueTableView reloadData];
        NSArray *objects = @[@"object1",@"object2",@"object3",@"object4",@"object5",@"object6",@"object7",@"object8",@"object9",@"object10"];
        [self.headerView updateViewWithData:objects];
        [self.valueScrollView setContentSize:CGSizeMake(objects.count * valueColWidth, 0)];
        [self.valueTableView setFrame:CGRectMake(0, 0, objects.count * valueColWidth, self.valueTableView.frame.size.height)];
    });
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark - scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.indicatorsTableView) {
        [self.valueTableView setContentOffset:CGPointMake(0, scrollView.contentOffset.y)];
    } else if (scrollView == self.valueTableView) {
        [self.indicatorsTableView setContentOffset:CGPointMake(0, scrollView.contentOffset.y)];
    }
    
    if (scrollView == self.headerView.rowScrollView) {
        [self.valueScrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
    } else if (scrollView == self.valueScrollView) {
        [self.headerView.rowScrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
    }
}


#pragma mark - layer

- (HeaderView *)headerView
{
    if (_headerView == nil) {
        _headerView = [HeaderView newAutoLayoutView];
        _headerView.rowScrollView.delegate = self;
    }
    
    return _headerView;
}

- (UITableView *)indicatorsTableView
{
    if (_indicatorsTableView == nil) {
        _indicatorsTableView = [UITableView newAutoLayoutView];
        _indicatorsTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _indicatorsTableView.showsVerticalScrollIndicator = NO;
        _indicatorsTableView.delegate        = self;
        
        self.indicatorsDataSource = [[ArrayDataSource alloc] initWithItems:self.indicators cellIdentifier:@"IndicatorTitleCellID" configureCellBlock:^(id cell, id item) {
            [cell setData:item];
        }];
        
        _indicatorsTableView.dataSource = self.indicatorsDataSource;
    }
    
    return _indicatorsTableView;
}

- (UITableView *)valueTableView
{
    if (_valueTableView == nil) {
        
        _valueTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth - indicatorsColWidth, screenHeight - safeAreaTopHeight - headerViewHeight)];
        _valueTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _valueTableView.showsVerticalScrollIndicator = NO;
        _valueTableView.delegate = self;

        self.valuesDataSource = [[ArrayDataSource alloc] initWithItems:self.values cellIdentifier:@"ValueCellID" configureCellBlock:^(id cell, id item) {
            [cell setData:item];
        }];
        
        _valueTableView.dataSource = self.valuesDataSource;
        
    }
    
    return _valueTableView;
}

- (UIScrollView *)valueScrollView
{
    if (_valueScrollView == nil) {
        _valueScrollView = [UIScrollView newAutoLayoutView];
        _valueScrollView.showsHorizontalScrollIndicator = NO;
        _valueScrollView.delegate = self;
    }
    
    return _valueScrollView;
}

- (NSMutableArray *)indicators
{
    if (_indicators == nil) {
        _indicators = [[NSMutableArray alloc] init];
    }
    
    return _indicators;
}

- (NSMutableArray *)values
{
    if (_values == nil) {
        _values = [[NSMutableArray alloc] init];
    }
    
    return _values;
}
@end
