//
//  VCRootList.m
//  HujiangAudition
//
//  Created by qianfeng on 14/12/29.
//  Copyright (c) 2014年 Cool. All rights reserved.
//

#import "VCRootList.h"
#import "BOZPongRefreshControl.h"
@interface VCRootList (){
    BOZPongRefreshControl *_pongRefreshControl;
}

@end

@implementation VCRootList

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 460) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
    _arrayData=[NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    // Do any additional setup after loading the view.
}

-(void)creatdata{
    
}

-(void)viewDidLayoutSubviews{
    _pongRefreshControl=[BOZPongRefreshControl attachToTableView:_tableView withRefreshTarget:self andRefreshAction:@selector(refreshTriggered)];
}

-(void)refreshTriggered{
    [self creatdata];
//    [_pongRefreshControl finishedLoading];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_pongRefreshControl scrollViewDidScroll];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_pongRefreshControl scrollViewDidEndDragging];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    cell.textLabel.text=_arrayData[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
