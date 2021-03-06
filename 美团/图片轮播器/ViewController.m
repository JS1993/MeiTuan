//
//  ViewController.m
//  图片轮播器
//
//  Created by  江苏 on 16/4/6.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "TabelViewCell.h"
#import "TableViewFooterView.h"
@interface ViewController ()<UIScrollViewDelegate,UITableViewDataSource,TableViewFooterViewDelegate>
@property(nonatomic,strong)UIPageControl* page;
@property(nonatomic,strong)UIScrollView* scrollView;
@property(strong,nonatomic)NSTimer* timer;
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* cells;
@end

@implementation ViewController

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame)+10, self.view.bounds.size.width, self.view.bounds.size.height-CGRectGetMaxY(self.scrollView.frame)-10) style:UITableViewStylePlain];
        _tableView.dataSource=self;
        _tableView.rowHeight=120;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSArray *)cells{
    if (_cells==nil) {
        _cells=[CellModel cellModels];
    }
    return _cells;
}
-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 20, self.view.bounds.size.width-20, 140)];
        _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width*5, 140);
        _scrollView.delegate=self;
        _scrollView.bounces=NO;
        _scrollView.pagingEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator=NO;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(UIPageControl *)page{
    if (_page==nil) {
        _page=[[UIPageControl alloc]init];
        _page.numberOfPages=5;
        CGSize size=[_page sizeForNumberOfPages:5];
        _page.frame=CGRectMake((self.view.bounds.size.width-size.width)*0.5, CGRectGetMaxY(self.scrollView.frame)-30, size.width, size.height);
        _page.currentPageIndicatorTintColor=[UIColor greenColor];
        _page.pageIndicatorTintColor=[UIColor grayColor];
        [_page addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_page];
    }
    return _page;
}
//让页数和页面指示相关联
-(void)pageChanged{
    self.scrollView.contentOffset=CGPointMake(self.page.currentPage*self.scrollView.bounds.size.width, 0);;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatImageScrollView];
    //设置分页指示控件的初始页数
    self.page.currentPage=0;
    //启动时钟
    [self startTimer];
    //创建tableViewfooterView
    TableViewFooterView * footerView=[TableViewFooterView creatFooterView];
    footerView.delegate=self;
    self.tableView.tableFooterView=footerView;
    
}
-(void)startTimer{
    self.timer=[NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(changePage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)changePage{
    //随机播放
//    self.page.currentPage=arc4random_uniform(5);
    //顺序播放,让图片轮播从当前的页数开始轮播
    int second=(int)self.page.currentPage+1;
    self.page.currentPage=second++%5;
    [self pageChanged];
}
/**
 *  创建图片滚动器
 */
-(void)creatImageScrollView{
    for (int i=0; i<5; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, 140)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"ad_0%d",i]];
        [self.scrollView addSubview:imageView];
    }
}
#pragma  mark- scrollView的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.page.currentPage=self.scrollView.contentOffset.x/self.scrollView.bounds.size.width;
    //当手指移动完轮播器，重新开始时钟
    [self startTimer];
}
/**
 *  当按住轮播器的时候，时钟停止
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}

#pragma mark-tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cells.count;
}
//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TabelViewCell* cell=[TabelViewCell cellWithTableView:tableView];
    cell.cellModel=self.cells[indexPath.row];
    return cell;
}
#pragma mark-tableViewFooterViewDelegate
-(void)tableViewFooterViewDidClickedLoadMore:(TableViewFooterView *)footerView{
    //设置新对象加入数组
    NSString* icon=[NSString stringWithFormat:@"ad_0%d",arc4random_uniform(5)];
    NSDictionary* dict=@{@"title": @"哈哈", @"icon":icon, @"price": @"100", @"buyCount": @"200"};
    CellModel* cellModel=[CellModel cellModelWithDict:dict];
    [self.cells addObject:cellModel];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //仅仅插入一行
        NSIndexPath* path=[NSIndexPath indexPathForRow:(self.cells.count-1)inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        footerView.loadButton.hidden=NO;
        footerView.loadView.hidden=YES;
    });
}
@end
