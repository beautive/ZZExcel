//
//  IndicatorModel.h
//  ZZExcel
//
//  Created by dengtacj on 2018/11/28.
//  Copyright © 2018年 zz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndicatorModel : NSObject
@property (nonatomic, copy) NSString *titleString;
@end


@interface ValueModel : NSObject
@property (nonatomic, copy) NSArray *valueItems;
@end
