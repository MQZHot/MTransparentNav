//
//  ViewController.m
//  MTransparentNav
//
//  Created by mengqingzheng on 2017/4/20.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import "Demo1ViewController.h"
#import "QViewController.h"
@interface Demo1ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation Demo1ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = @"我的";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"item2" style:UIBarButtonItemStyleDone target:self action:@selector(colorChange:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"item1" style:UIBarButtonItemStyleDone target:self action:@selector(colorChange:)];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mine"]];
    image.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*420/750);
    self.tableView.tableHeaderView = image;
    
    //  ============= 导航栏设置================================
    self.navAlpha = 0;
    self.navTintColor = [UIColor whiteColor];
    self.navBarTintColor = [UIColor greenColor];
    
}

#pragma mark - UIScrollViewDelegate 
//  ============= 颜色渐变=======================================

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
    if (y > 80) {
        self.navTintColor = [UIColor blueColor];
    } else {
        self.navTintColor = y < 0 ? [UIColor clearColor] : [UIColor whiteColor];
    }
}

-(void)colorChange:(UIBarButtonItem *)sender{
    QViewController *qVC = [[QViewController alloc]init];
    [self.navigationController pushViewController:qVC animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"☺☺%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
