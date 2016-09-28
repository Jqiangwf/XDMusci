//
//  JQRankingDetaileTableViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/24.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRankingDetaileTableViewController.h"
#import "JQRankingDetailTableViewCell.h"
#import "JQRankingDetailModel.h"
@interface JQRankingDetaileTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) JQRankingDetailModel *model;
@property (nonatomic) UIView *headerView;
@property (nonatomic) UIView *naviView;
@property (nonatomic) UIImageView *topIv;
@property (nonatomic) UIButton *backBtn;
@end

@implementation JQRankingDetaileTableViewController
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    //最底层
     [self topIv];
    //次底层
    [self.tableView registerClass:[JQRankingDetailTableViewCell class] forCellReuseIdentifier:@"cell"];
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [NetManager getRankingDetail:weakSelf.type handler:^(JQRankingDetailModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
                weakSelf.tableView.tableHeaderView = nil;
            }else{
                weakSelf.model = model;
                //第二表层
                [weakSelf naviView];
                //最表层
                [weakSelf backBtn];
               [weakSelf.topIv setImageURL:weakSelf.model.billboard.pic_s640.jq_URL];
                
                weakSelf.tableView.tableHeaderView = weakSelf.headerView;
                weakSelf.tableView.backgroundColor = [UIColor clearColor];
                weakSelf.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
            
        }];
    }];
    [self.tableView beginHeaderRefresh];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1: self.model.song_list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%@更新",self.model.billboard.update_date];
        NSTextAttachment *att = [NSTextAttachment new];
        att.image = [UIImage imageNamed:@"bt_playlist_download_normal"];
        NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:att];
        cell.detailTextLabel.attributedText = str;
    
        return cell;
    }
    
    JQRankingDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.countLb.textColor = [UIColor blackColor];
    if (indexPath.row == 0) {
        cell.countLb.textColor = [UIColor colorWithRed:0.925 green:0.106 blue:0.145 alpha:1.000];
    }
    if (indexPath.row == 1) {
        cell.countLb.textColor = [UIColor colorWithRed:0.894 green:0.580 blue:0.247 alpha:1.000];
    }
    if (indexPath.row == 2) {
        cell.countLb.textColor = [UIColor colorWithRed:0.855 green:0.812 blue:0.000 alpha:1.000];
    }
    
    RankingDetailSongListModel *model = self.model.song_list[indexPath.row];
    NSString *rank = model.rank.length == 1 ? [NSString stringWithFormat:@"0%@",model.rank]:model.rank;
    cell.countLb.text = rank;
    cell.titleLb.text = model.album_title;
    
    BOOL sq = model.havehigh == 2 ? YES: NO;
    BOOL mv = model.has_mv == 1 ? YES: NO;
    BOOL k = [model.korean_bb_song isEqualToString:@"1"] ? YES: NO;
    [cell setNameLbWithSq:sq MV:mv K:k name:model.artist_name];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y >= self.tableView.width *0.6 - 64) {
        [UIView animateWithDuration:0.5 animations:^{
            self.naviView.alpha = 1;
        }];
    }
    if(scrollView.contentOffset.y <= self.tableView.width *0.6 - 64 && scrollView.contentOffset.y >= 0){
        [UIView animateWithDuration:0.5 animations:^{
            self.naviView.alpha = 0;
        }];
        
        [self.topIv mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(-scrollView.contentOffset.y);
            make.left.right.equalTo(0);
            make.height.equalTo(_topIv.mas_width);
        }];
    }
    if (-scrollView.contentOffset.y >= self.tableView.width * 0.6 - 84) {
        
        [self.topIv mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(-scrollView.contentOffset.y - (self.tableView.width * 0.6 -84 ));
            make.left.right.equalTo(0);
            make.height.equalTo(_topIv.mas_width);
        }];
    }
    
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

- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 0, self.tableView.width *0.6))];
    }
    return _headerView;
}

- (UIView *)naviView {
    if(_naviView == nil) {
        _naviView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64))];
        [self.view addSubview:_naviView];
        _naviView.backgroundColor = [UIColor colorWithRed:0.271 green:0.557 blue:1.000 alpha:1.000];
        _naviView.alpha = 0;
        
        
        UILabel *titleLb = [UILabel new];
        [_naviView addSubview:titleLb];
        titleLb.textColor = [UIColor whiteColor];
        titleLb.font = [UIFont systemFontOfSize:21];
        titleLb.text = self.model.billboard.name;
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(10);
        }];
    }
    return _naviView;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _tableView;
}

- (UIImageView *)topIv {
    if(_topIv == nil) {
        _topIv = [[UIImageView alloc] init];
        [self.view addSubview:_topIv];
        [_topIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(_topIv.mas_width);
        }];
        
    }
    return _topIv;
}

- (UIButton *)backBtn {
	if(_backBtn == nil) {
		_backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_backBtn];
        [_backBtn addTarget:self action:@selector(backLastVC:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *image =[[UIImage imageNamed:@"ic_recommend_back_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [_backBtn setImage:image forState:UIControlStateNormal];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(28);
        }];
	}
	return _backBtn;
}
- (void)backLastVC:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
