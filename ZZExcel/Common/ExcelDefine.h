//
//  ExcelDefine.h
//  ZZExcel
//
//  Created by dengtacj on 2018/11/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#ifndef ExcelDefine_h
#define ExcelDefine_h

#define headerViewHeight     55
#define indicatorsColWidth   168
#define valueColWidth        80
#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height
#define iPhoneX ((screenHeight == 812.f || screenHeight == 896.f) ? YES : NO)
#define safeAreaTopHeight (iPhoneX ? 88 : 64)

#endif /* ExcelDefine_h */
