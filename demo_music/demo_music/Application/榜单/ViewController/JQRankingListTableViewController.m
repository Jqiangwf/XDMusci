//
//  JQRankingListTableViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/22.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRankingListTableViewController.h"
#import "JQRankingListModel.h"
#import "NetManager.h"
#import "JQRankingListTableViewCell.h"
#import "JQRankingDetaileTableViewController.h"

@interface JQRankingListTableViewController ()
@property (nonatomic) NSMutableArray *dataList;
@property (nonatomic) JQRankingListModel *model;

@end

@implementation JQRankingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JQRankingListTableViewCell class] forCellReuseIdentifier:@"cell"];
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        
        [NetManager getRankingListHandler:^(JQRankingListModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                weakSelf.model = model;
                [weakSelf.dataList addObjectsFromArray:weakSelf.model.content];
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
        
    }];
    [self.tableView beginHeaderRefresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JQRankingListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    RankingListContentModel *m = self.dataList[indexPath.section];
    [cell.iconIv setImageURL:m.pic_s192.jq_URL];
    
    for (int i = 0; i < 3; i++) {
        RankingListContentDataModel *mo = m.content[i];
        if (i == 0) {
            cell.firLb.text = [NSString stringWithFormat:@"%@ - %@",mo.album_title, mo.author];
        }
        if (i == 1) {
            cell.secLb.text = [NSString stringWithFormat:@"%@ - %@",mo.album_title, mo.author];
        }
        if (i == 2) {
            cell.thiLb.text = [NSString stringWithFormat:@"%@ - %@",mo.album_title, mo.author];
        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JQRankingDetaileTableViewController *vc = [[JQRankingDetaileTableViewController alloc]init];
    
    vc.type = indexPath.section + 1;
    [self.navigationController pushViewController:vc animated:YES];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

@end
