//
//  VCRootList.h
//  HujiangAudition
//
//  Created by qianfeng on 14/12/29.
//  Copyright (c) 2014年 Cool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralViewController.h"
@interface VCRootList : GeneralViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_arrayData;
}


@end
