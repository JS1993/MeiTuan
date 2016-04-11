//
//  TableViewFooterView.m
//  美团
//
//  Created by  江苏 on 16/4/11.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "TableViewFooterView.h"
@interface TableViewFooterView()


@end
@implementation TableViewFooterView

+(instancetype)creatFooterView{
    return [[[NSBundle mainBundle]loadNibNamed:@"TableViewFooterView" owner:nil options:nil] lastObject];
}

- (IBAction)LoadMore:(id)sender {
    self.loadButton.hidden=YES;
    self.loadView.hidden=NO;
    //3.判断是否实现了代理
    if ([self.delegate respondsToSelector:@selector(tableViewFooterViewDidClickedLoadMore:)]) {
        [self.delegate tableViewFooterViewDidClickedLoadMore:self];
    }
}


@end
