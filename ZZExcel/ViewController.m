//
//  ViewController.m
//  ZZExcel
//
//  Created by dengtacj on 2018/11/28.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "ViewController.h"
#import "ExcelSingleViewController.h"

#import <YYWebImage/YYWebImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
//    self.navigationController.navigationBar.translucent = NO;
    
//    self.navigationController.navigationBar.clipsToBounds = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage yy_imageWithColor:[UIColor yellowColor]] forBarMetrics:UIBarMetricsDefault];
    
}

- (IBAction)clickSingleTableView:(id)sender {
    
    [self.navigationController pushViewController:[[ExcelSingleViewController alloc] init] animated:YES];
}

- (IBAction)clickMultipleTableView:(id)sender {
}

@end
