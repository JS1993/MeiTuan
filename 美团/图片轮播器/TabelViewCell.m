//
//  TabelViewCell.m
//  美团
//
//  Created by  江苏 on 16/4/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "TabelViewCell.h"

@interface TabelViewCell()

@property (strong, nonatomic) IBOutlet UIImageView *imageVIew;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *buyCount;
@end

@implementation TabelViewCell

-(void)setCellModel:(CellModel *)cellModel{
    //setter方法一定要赋值
    _cellModel=cellModel;
    self.imageVIew.image=[UIImage imageNamed:cellModel.icon];
    self.price.text=cellModel.price;
    self.title.text=cellModel.title;
    self.buyCount.text=cellModel.buyCount;
}
+(TabelViewCell*)cellWithTableView:(UITableView*)tableView{
    static NSString* identifier=@"Cell";
    TabelViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        //通过xib载入
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TabelViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    return cell;
}
//使用代码创建cell时会被调用，如果使用xib或者stroyboard,此方法不会被调用
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
@end
