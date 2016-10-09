//
//  JQSingTableViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/23.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingTableViewController.h"
#import "JQSingAdverModel.h"
#import "JQSingTableViewCell.h"
#import "JQAllSongTableViewCell.h"
@interface JQSingTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic) JQSingAdverModel *model;
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UIView *headerView;
@property (nonatomic) NSTimer *timer;

@property (nonatomic) JQAllSingModel *singModel;

@property (nonatomic) NSTimer *countTimer;
@property (nonatomic) NSInteger count;
@end

@implementation JQSingTableViewController
#pragma mark - ic dataSource
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.model.result.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:carousel.bounds];
        view = iv;
    }
    SingAdverResultModel *mo = self.model.result[index];
    [(UIImageView *)view setImageURL:mo.picture_iphone6.jq_URL];
    
    return view;
}
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[JQAllSongTableViewCell class] forCellReuseIdentifier:@"songCell"];
    [self.tableView registerClass:[JQSingTableViewCell class] forCellReuseIdentifier:@"cell"];
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        __block int count = 2;
        [weakSelf.timer invalidate];
        //头部视图
        [NetManager getSingAdverHandler:^(JQSingAdverModel *model, NSError *error) {
            if (error) {
                weakSelf.tableView.tableHeaderView = nil;
            }else{
                count --;
                weakSelf.tableView.tableHeaderView = weakSelf.headerView;
                weakSelf.model = model;
                weakSelf.pc.numberOfPages = model.result.count;
                [weakSelf.ic reloadData];
                [weakSelf.tableView reloadData];
                weakSelf.timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
                    [weakSelf.ic scrollToItemAtIndex:weakSelf.ic.currentItemIndex + 1 duration:1];
                } repeats:YES];
            }
            if (count == 0) {
                [weakSelf.tableView endHeaderRefresh];
            }
        }];
        //大家都在唱
        [NetManager getAllSingHandler:^(JQAllSingModel *model, NSError *error) {
            [weakSelf.countTimer invalidate];
            if (error) {
                NSLog(@"%@",error);
            }else{
                count --;
                NSLog(@"%@",model.result.items);
                weakSelf.singModel = model;
                weakSelf.count = 10;
                weakSelf.countTimer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
                    weakSelf.count ++;
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
                    [weakSelf.tableView insertRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationTop];
                    if (weakSelf.count == self.singModel.result.items.count) {
                        [weakSelf.countTimer invalidate];
                    }
                } repeats:YES];
                [weakSelf.tableView reloadData];
            }
            if (count == 0) {
                [weakSelf.tableView endHeaderRefresh];
            }
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return self.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
        }
        cell.accessoryType = 1;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@""];
        NSTextAttachment *att = [NSTextAttachment new];
        att.image = [UIImage imageNamed:@"bt_more_ok_normal"];
        att.bounds = CGRectMake(0, -13, 40, 40);
        NSAttributedString *imgstr = [NSAttributedString attributedStringWithAttachment:att];
        [str appendAttributedString:imgstr];
        NSAttributedString *textStr = [[NSAttributedString alloc]initWithString:@"   我的K歌"];
        [str appendAttributedString:textStr];
        
        cell.textLabel.attributedText = str;
        return cell;
    }else if (indexPath.section == 1){
        JQSingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [cell collectionView];
        cell.titleLb.text = @"大家都在唱";
        return cell;
    }else{
        JQAllSongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
        JQAllSingResultItemsModel *model = self.singModel.result.items[self.singModel.result.items.count - self.count + indexPath.row ];
        [cell.iconIv setImageURL:model.picture_300_300.jq_URL];
        cell.titleLb.text = [NSString stringWithFormat:@"%@-%@",model.song_title,model.artist_name];
        cell.countLb.text = [NSString stringWithFormat:@"%@人唱过",model.play_num];
        [cell singbtn];
        return cell;
    }
    
    
    //    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 340;
    }else if(indexPath.section == 2){
        return 65;
    }
    else{
        return 44;
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
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 0, 185))];
        
        _ic = [[iCarousel alloc] init];
        [_headerView addSubview:_ic];
        _ic.scrollSpeed = 0;
        _ic.dataSource = self;
        _ic.delegate = self;
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        _pc = [[UIPageControl alloc] init];
        [self.headerView addSubview:_pc];
        _pc.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pc.pageIndicatorTintColor = [UIColor grayColor];
        _pc.userInteractionEnabled = NO;
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-3);
            make.bottom.equalTo(5);
        }];
    }
    return _headerView;
}


@end
