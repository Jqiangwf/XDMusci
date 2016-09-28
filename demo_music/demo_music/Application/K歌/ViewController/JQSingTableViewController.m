//
//  JQSingTableViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/23.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQSingTableViewController.h"
#import "JQSingAdverModel.h"
@interface JQSingTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic) JQSingAdverModel *model;

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UIView *headerView;
@property (nonatomic) NSTimer *timer;
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
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [weakSelf.timer invalidate];
        [NetManager getSingAdverHandler:^(JQSingAdverModel *model, NSError *error) {
            if (error) {
                weakSelf.tableView.tableHeaderView = nil;
            }else{
                weakSelf.tableView.tableHeaderView = weakSelf.headerView;
                weakSelf.model = model;
                weakSelf.pc.numberOfPages = model.result.count;
                [weakSelf.ic reloadData];
                [weakSelf.tableView reloadData];
                weakSelf.timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
                    [weakSelf.ic scrollToItemAtIndex:weakSelf.ic.currentItemIndex + 1 duration:1];
                } repeats:YES];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if (indexPath.section == 0) {
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
    //    }
    
    
    //    return nil;
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
