//
//  TableViewFooterView.h
//  美团
//
//  Created by  江苏 on 16/4/11.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewFooterView;
//1.定义协议和方法
@protocol TableViewFooterViewDelegate<NSObject>

@optional

-(void)tableViewFooterViewDidClickedLoadMore:(TableViewFooterView*)footerView;
@end
@interface TableViewFooterView : UIView
@property (strong, nonatomic) IBOutlet UIView *loadView;
@property (strong, nonatomic) IBOutlet UIButton *loadButton;
//2.申明代理属性
@property(nonatomic,weak)id<TableViewFooterViewDelegate> delegate;

+(instancetype)creatFooterView;
@end
