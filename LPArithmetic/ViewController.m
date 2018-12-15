//
//  ViewController.m
//  LPArithmetic
//
//  Created by pill on 2018/12/13.
//  Copyright © 2018 LP. All rights reserved.
//

#import "ViewController.h"
#import "LPArithmetic.h"
@interface ViewController ()<UITableViewDataSource> {
    UITableView * _tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *str1 =  [LPArithmetic arithmeticLevelEquel:@"1*2"];
    NSString *str2 =  [LPArithmetic arithmeticLevelEquel:@"1+2*3"];
    NSString *str3 =  [LPArithmetic arithmeticLevelEquel:@"1*3/2+1"];
    NSString *str4 =  [LPArithmetic arithmeticQueueEquel:@"1*2"];
    NSString *str5 =  [LPArithmetic arithmeticQueueEquel:@"1+2*3"];
    NSString *str6 =  [LPArithmetic arithmeticQueueEquel:@"1*3/2+1"];
    NSString *str7 =  [LPArithmetic arithmeticHighLevelEquel:@"1*(3/2)+1"];


    
    // Do any additional setup after loading the view, typically from a nib.
}



@end
