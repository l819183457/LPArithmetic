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

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickFFF) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)clickFFF {
    [_tableView reloadData];
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"111"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}


@end
