//
//  CellModel.h
//  美团
//
//  Created by  江苏 on 16/4/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property(copy,nonatomic)NSString* title;
@property(copy,nonatomic)NSString* icon;
@property(copy,nonatomic)NSString* price;
@property(copy,nonatomic)NSString* buyCount;

+(NSMutableArray*)cellModels;
+(instancetype)cellModelWithDict:(NSDictionary*)dict;
@end
