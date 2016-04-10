//
//  TabelViewCell.h
//  美团
//
//  Created by  江苏 on 16/4/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageVIew;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *buyCount;
@end
