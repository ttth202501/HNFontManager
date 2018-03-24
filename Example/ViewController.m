//
//  ViewController.m
//  Example
//
//  Created by Hu,Haining on 2018/3/23.
//  Copyright © 2018年 Hu,Haining. All rights reserved.
//

#import "ViewController.h"
#import "HNFont.h"
#import "HNFontManager.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *datalist;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.datalist = @[@"张三", @"李四", @"王二麻", @"赵四", @"刘能", @"英子", @"赵玉田", @"刘大脑袋"];
    
    int w = ([UIScreen mainScreen].bounds.size.width - 10 * 3) / 4;
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, w, 30)];
    [button1 setTitle:@"小" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor lightGrayColor];
    button1.tag = 0;
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button1.frame) + 10, 50, w, 30)];
    [button2 setTitle:@"中" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor lightGrayColor];
    button2.tag = 1;
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button2.frame) + 10, 50, w, 30)];
    [button3 setTitle:@"大" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor lightGrayColor];
    button3.tag = 2;
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button3.frame) + 10, 50, w, 30)];
    [button4 setTitle:@"超大" forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor lightGrayColor];
    button4.tag = 3;
    
    [button1 addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button4 addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    
    self.tableview.frame = CGRectMake(0, 90, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 90);
    [self.view addSubview:self.tableview];
}

- (void)onTapBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    [HNFontManager shareInstance].currentLevel = btn.tag;
}

#pragma mark UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datalist.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"fontChangeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.textLabel.text = [self.datalist objectAtIndex:indexPath.row];
        cell.textLabel.hn_font = hn_font(5, 10, 15, 20, 25);
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] init];
        _tableview.delegate   = self;
        _tableview.dataSource = self;
    }
    
    return _tableview;
}

@end
