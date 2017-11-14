//
//  ViewController.m
//  MTransparentNav
//
//  Created by mengqingzheng on 2017/4/20.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import "ViewController.h"
#import "QViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"item2" style:UIBarButtonItemStyleDone target:self action:@selector(colorChange:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"item1" style:UIBarButtonItemStyleDone target:self action:@selector(colorChange:)];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mine"]];
    imgView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_W*420/750);
    self.tableView.tableHeaderView = imgView;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //  ============= 导航栏设置================================
    self.navAlpha = 0;
    self.navTintColor = [UIColor whiteColor];
    self.navTitleColor = [UIColor whiteColor];
    self.navBackgroundColor = [UIColor greenColor];
}

#pragma mark - UIScrollViewDelegate 
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
    if (y > 80) {
        self.navTitleColor = self.navTintColor = [UIColor redColor];
    } else {
        self.navTitleColor = y < 0 ? [UIColor clearColor] : [UIColor whiteColor];
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
    return cell;
}
@end
