//
//  ArrayDataSource.m
//  ZZExcel
//
//  Created by dengtacj on 2018/11/28.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()

@property(nonatomic, strong) NSArray* items;
@property(nonatomic, copy)   NSString* cellIdentifier;
@property(nonatomic, copy)   TableViewCellConfigureBlock configureCellBlock;

@end

@implementation ArrayDataSource

- (id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return  self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(NSUInteger) indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
