//
//  AsyncUIViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/12/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "AsyncUIViewController.h"
#import "TableViewNodeCell.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <Masonry.h>
@interface AsyncUIViewController ()<ASTableDataSource, ASTableDelegate>

@end

@implementation AsyncUIViewController{
    ASTableNode *_mainTableNode;            //主列表
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ASTableNode *mainTableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    mainTableNode.delegate = self;
    mainTableNode.dataSource = self;
    [self.view addSubnode:mainTableNode];
    mainTableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [mainTableNode.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    _mainTableNode = mainTableNode;
    
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
#pragma mark -ASTableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BOOL haiTaoStyle = indexPath.row % 2 ? YES : NO;
    
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        TableViewNodeCell *cellNode = [[TableViewNodeCell alloc] initWithHaiTao:haiTaoStyle];
        return cellNode;
    };
    
    return cellNodeBlock;
}

@end
