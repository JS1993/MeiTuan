//
//  TabelViewCell.h
//  美团
//
//  Created by  江苏 on 16/4/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface TabelViewCell : UITableViewCell

@property(nonatomic,strong)CellModel* cellModel;

+(TabelViewCell*)cellWithTableView:(UITableView*)tableView;
@end
