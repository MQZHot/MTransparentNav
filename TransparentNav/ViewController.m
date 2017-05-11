//
//  ViewController.m
//  TransparentNav
//
//  Created by mengqingzheng on 2017/5/11.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置颜色
    self.navTintColor = [UIColor redColor];
    self.navBarTintColor = [UIColor greenColor];
    self.navAlpha = 0;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithTitle:@"我的" style:UIBarButtonItemStyleDone target:self action:@selector(AA:)];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(AA:)];
    self.navigationItem.rightBarButtonItems = @[right1,right2];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self setupHeader];
}

//scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
    if (y > 80) {
        self.navTintColor = [UIColor blueColor];
    } else {
        self.navTintColor = y < 0 ? [UIColor clearColor] : [UIColor redColor];
    }
}

-(void)AA:(UIBarButtonItem *)sender{
    SecondViewController *VC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
//tableHeaderView
-(void)setupHeader{
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"路上"]];
    image.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width*370/597);
    self.tableView.tableHeaderView = image;
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
    cell.textLabel.text = [NSString stringWithFormat:@"测试%ld",(long)indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeViewController *VC = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}


@end
