//
//  CellModel.m
//  美团
//
//  Created by  江苏 on 16/4/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
-(instancetype)initWithDict:(NSDictionary*)dict{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)cellModelWithDict:(NSDictionary*)dict{
    return [[self alloc]initWithDict:dict];
}
+(NSArray*)cellModels{
    NSMutableArray* arrM=[NSMutableArray array];
    NSArray* arr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]];
    for (NSDictionary* dic in arr ) {
        [arrM addObject:[self cellModelWithDict:dic]];
    }
    return arrM;
}

@end
