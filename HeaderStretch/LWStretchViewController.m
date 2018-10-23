//
//  LWStretchViewController.m
//  HeaderStretch
//
//  Created by lwmini on 2018/10/23.
//  Copyright © 2018年 lw. All rights reserved.
//

#import "LWStretchViewController.h"
#import "UINavigationController+NavAlpha.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define HEADERVIEW_H  180
@interface LWStretchViewController ()<UITableViewDelegate,UITableViewDataSource>{
    CGRect _originalFrame;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *bgImageView;

@end

@implementation LWStretchViewController
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        UIImage *image =[UIImage imageNamed:@"mine"];
        _bgImageView = [[UIImageView alloc]initWithImage:image];
        [_bgImageView setFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_W*(image.size.height/image.size.width))];
        _originalFrame = _bgImageView.frame;
    }
    return _bgImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupNavigation];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.tableView];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_W ,HEADERVIEW_H) ];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView =headerView;
    // Do any additional setup after loading the view.
}
- (void)p_setupNavigation{
    self.navigationItem.title = @"我的";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigation_back"] style:UIBarButtonItemStyleDone target:self action:@selector(goBack:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(nextPage:)];
    //  ============= 导航栏设置================================
    self.navAlpha = 0;
    self.navTintColor = [UIColor whiteColor];
    self.navTitleColor = [UIColor whiteColor];
    self.navBackgroundColor = [UIColor grayColor];

}
#pragma mark --  click
- (void)goBack:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)nextPage:(UIBarButtonItem *)sender{
    LWStretchViewController *vc = [[LWStretchViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / HEADERVIEW_H;
    if (y > HEADERVIEW_H) {
        self.navTitleColor = self.navTintColor = [UIColor blackColor];
    } else {
        self.navTitleColor = self.navTintColor = [UIColor whiteColor];
//        self.navTitleColor = y < 0 ? [UIColor clearColor] : [UIColor whiteColor];
//        self.navTintColor = y < 0 ? [UIColor clearColor] : [UIColor whiteColor];
    }
    
    if (y>0) {
        self.bgImageView.frame = ({
            CGRect frame = _bgImageView.frame;
            frame.origin.y = _originalFrame.origin.y - y;
            frame;
        });
    }else{
        self.bgImageView.frame = ({
            CGRect frame = _originalFrame;
            frame.size.height = _originalFrame.size.height - y;
            frame.origin.x = _originalFrame.origin.x - (frame.size.width - _originalFrame.size.width)/2;
            frame;
        });
    }
}
#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"我的空间";
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
