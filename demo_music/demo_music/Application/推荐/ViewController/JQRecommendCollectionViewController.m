//
//  JQRecommendCollectionViewController.m
//  demo_music
//
//  Created by tarena29 on 16/9/27.
//  Copyright © 2016年 蒋强. All rights reserved.
//

#import "JQRecommendCollectionViewController.h"
#import "JQRecommendHeaderCollectionReusableView.h"
#import "JQRecommendSongListCollectionViewCell.h"
#import "JQRecommendNewSongCollectionViewCell.h"
#import "JQRadioCollectionViewCell.h"
#import "JQRecommendTodayTableViewCell.h"
#import "JQSongListCollectionViewCell.h"
#import "JQRecommendProprietaryCollectionViewCell.h"

@interface JQRecommendCollectionViewController ()<iCarouselDelegate,iCarouselDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic) JQRecommendModel *model;
@property (nonatomic) NSInteger sectionCount;
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UIView *headerView;
@property (nonatomic) NSTimer *timer;


@end

@implementation JQRecommendCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
#pragma mark - ic dataSource
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.model.result.focus.result.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:carousel.bounds];
        view = iv;
    }
    Result *mo = self.model.result.focus.result[index];
    [(UIImageView *)view setImageURL:mo.randpic_iphone6.jq_URL];
    
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
    [self.collectionView registerClass:[JQRecommendHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [self.collectionView registerClass:[JQRecommendSongListCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[JQRecommendNewSongCollectionViewCell class] forCellWithReuseIdentifier:@"nameCell"];
    [self.collectionView registerClass:[JQRadioCollectionViewCell class] forCellWithReuseIdentifier:@"radioCell"];
    [self.collectionView registerClass:[JQRecommendTodayTableViewCell class] forCellWithReuseIdentifier:@"todayCell"];
    [self.collectionView registerClass:[JQSongListCollectionViewCell class] forCellWithReuseIdentifier:@"songCell"];
    [self.collectionView registerClass:[JQRecommendProprietaryCollectionViewCell class] forCellWithReuseIdentifier:@"proCell"];
    
    
    MJWeakSelf
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.timer invalidate];
        [NetManager getRecommendHandler:^(JQRecommendModel *model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                weakSelf.model = model;
                [weakSelf headerView];
                weakSelf.pc.numberOfPages = model.result.focus.result.count;
                [weakSelf.ic reloadData];
                weakSelf.sectionCount = 10;
                [weakSelf.collectionView reloadData];
                weakSelf.timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
                    [weakSelf.ic scrollToItemAtIndex:weakSelf.ic.currentItemIndex + 1 duration:1];
                } repeats:YES];
            }
            [weakSelf.collectionView endHeaderRefresh];
            
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionCount;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 6;
            break;
        case 2:
            return 6;
            break;
        case 3:
            return 3;
            break;
        case 4:
            return 4;
            break;
        case 5:
            return 3;
            break;
        case 6:
            return 3;
            break;
        case 7:
            return 6;
            break;
        case 8:
            return 6;
            break;
        case 9:
            return 3;
            break;
            
            
        default:
            break;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.backgroundView = self.headerView;
    }
    if (indexPath.section == 1) {
        JQRecommendSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        Result *result = self.model.result.diy.result[indexPath.item];
        [cell.iconIv setImageURL:result.pic.jq_URL];
        cell.titleLb.text = result.title;
        return cell;
    }
    if (indexPath.section == 2) {
        JQRecommendNewSongCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"nameCell" forIndexPath:indexPath];
        Result *result = self.model.result.album.result[indexPath.item];
        [cell.iconIv setImageURL:result.pic.jq_URL];
        cell.nameLb.text = result.author;
        cell.titleLb.text = result.title;
        
        return cell;
    }
    if (indexPath.section == 3) {
        JQRecommendNewSongCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"nameCell" forIndexPath:indexPath];
        Result *result = self.model.result.mix_22.result[indexPath.item];
        [cell.iconIv setImageURL:result.pic.jq_URL];
        cell.nameLb.text = result.author;
        cell.titleLb.text = result.title;
        
        return cell;
    }
    if (indexPath.section == 4) {
        __weak JQRadioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"radioCell" forIndexPath:indexPath];
        RecommendSceneResult *result = self.model.result.scene.result;
        [cell.iconIv setImageWithURL:result.operation[indexPath.item].icon_ios.jq_URL placeholder:[UIImage imageNamed:@"ad_play_cover_pic_bg"] options:YYWebImageOptionShowNetworkActivity completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
            cell.iconIv.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            cell.iconIv.tintColor = [UIColor colorWithRed:0.490 green:0.686 blue:0.902 alpha:1.000];
        }];
        
        cell.nameLb.text = result.operation[indexPath.item].scene_name;
        return cell;
    }
    if (indexPath.section == 5) {
        JQRecommendTodayTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"todayCell" forIndexPath:indexPath];
        Result *result = self.model.result.recsong.result[indexPath.item];
        [cell.iconIv setImageURL:result.pic_premium.jq_URL];
        cell.titleLb.text = result.title;
        cell.nameLb.text = result.author;
        return cell;
    }
    if (indexPath.section == 6) {
        JQRecommendSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        Result *result = self.model.result.mix_9.result[indexPath.item];
        [cell.iconIv setImageURL:result.pic.jq_URL];
        cell.titleLb.text = result.title;
        return cell;
    }
    if (indexPath.section == 7) {
        JQRecommendNewSongCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"nameCell" forIndexPath:indexPath];
        Result *result = self.model.result.mix_5.result[indexPath.item];
        [cell.iconIv setImageURL:result.pic.jq_URL];
        cell.nameLb.text = result.author;
        cell.titleLb.text = result.title;
        
        return cell;
    }
    if (indexPath.section == 8) {
        JQSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"songCell" forIndexPath:indexPath];
        Result *result = self.model.result.radio.result[indexPath.item];
        [cell.iconIV setImageURL:result.pic.jq_URL];
        cell.titleLb.text = result.title;
        return cell;
    }
    if (indexPath.section == 9) {
        JQRecommendProprietaryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"proCell" forIndexPath:indexPath];
        Result *result = self.model.result.mod_7.result[indexPath.item];
        
        [cell.iconIv setImageURL:result.pic.jq_URL];
        cell.titleLb.text = result.title;
        cell.nameLb.text = result.desc;
        return cell;
    }
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        JQRecommendHeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        if(self.model)
            [view.moreBtn setAttributedTitle:[self getMoreBtn] forState:UIControlStateNormal];
        switch (indexPath.section) {
                
            case 1:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"diy"];
                return view;
            }
            case 2:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"album"];
                return view;
            }
            case 3:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"mix_22"];
                return view;
            }
            case 5:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"recsong"];
                return view;
            }
            case 6:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"mix_9"];
                return view;
            }
            case 7:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"mix_5"];
                return view;
            }
            case 8:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"radio"];
                return view;
            }
            case 9:
            {
                view.titleLb.attributedText = [self getTitleLbWithKey:@"mod_7"];
                return view;
            }
                
                
            default:
                break;
        }
        return view;
    }else{
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        view.backgroundColor = [UIColor colorWithWhite:0.907 alpha:1.000];
        return view;
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 4)
        return CGSizeZero;
    return CGSizeMake(0, 38);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 18 * 2 - 10 * 2 ) / 3;
    CGFloat height = width + 45;
    switch (indexPath.section) {
        case 0:
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 300 / 750);
            break;
        case 1:
            return CGSizeMake(width, height);
            break;
        case 2:
            return CGSizeMake(width, height);
            break;
        case 3:
            return CGSizeMake(width, height + 20);
            break;
        case 4:
            
            return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 18 * 2 - 30 * 3) / 4,([UIScreen mainScreen].bounds.size.width - 18 * 2 - 30 * 3) / 4);
            break;
        case 5:
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, 44);
            break;
        case 6:
            return CGSizeMake(width, height);
            break;
        case 7:
            return CGSizeMake(width, height);
            break;
        case 8:
            return CGSizeMake(width, height);
            break;
        case 9:
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, 44);
            break;
            
        default:
            return CGSizeZero;
            break;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 0:
            return UIEdgeInsetsZero;
            break;
        case 1:
            return UIEdgeInsetsMake(13, 18, 20, 18);;
            break;
        case 2:
            return UIEdgeInsetsMake(13, 18, 20, 18);;
            break;
        case 3:
            return UIEdgeInsetsMake(13, 18, 20, 18);;
            break;
        case 4:
            return UIEdgeInsetsMake(10, 18, 10, 18);
            break;
        case 5:
            return UIEdgeInsetsMake(10, 0, 10, 0);
            break;
        case 6:
            return UIEdgeInsetsMake(13, 18, 20, 18);;
            break;
        case 7:
            return UIEdgeInsetsMake(13, 18, 20, 18);;
            break;
        case 8:
            return UIEdgeInsetsMake(0, 18, 20, 18);;
            break;
        case 9:
            return UIEdgeInsetsMake(10, 0, 10, 0);
            break;
            
        default:
            return UIEdgeInsetsZero;
            break;
    }
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 13;
            break;
        case 2:
            return 13;
            break;
        case 3:
            return 13;
            break;
        case 4:
            return 0;
            break;
        case 5:
            return 10;
            break;
        case 6:
            return 13;
            break;
        case 7:
            return 13;
            break;
        case 8:
            return 13;
            break;
        case 9:
            return 10;
            break;
            
        default:
            return 0;
            break;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 10;
            break;
        case 2:
            return 10;
            break;
        case 3:
            return 10;
            break;
        case 4:
            return 30;
            break;
        case 5:
            return 0;
            break;
        case 6:
            return 10;
            break;
        case 7:
            return 10;
            break;
        case 8:
            return 10;
            break;
        case 9:
            return 0;
            break;
            
        default:
            return 0;
            break;
    }
}



#pragma mark - method
- (NSMutableAttributedString *)getTitleLbWithKey:(NSString *)key{
    
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] init];
    [self.model.module enumerateObjectsUsingBlock:^(Module * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.key isEqualToString:key]) {
            NSData *data = [NSData dataWithContentsOfURL:obj.picurl.jq_URL];
            NSTextAttachment *att = [[NSTextAttachment alloc]init];
            att.image = [UIImage imageWithData:data];
            att.bounds = CGRectMake(0, -2, 17, 17);
            NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:att];
            [mStr appendAttributedString:str];
            [mStr appendString:[NSString stringWithFormat:@" %@",obj.title]];
            
        }
    }];
    
    return mStr;
    
}
- (NSMutableAttributedString *)getMoreBtn{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"更多 >"];
    [str addAttribute:NSUnderlineStyleAttributeName value:@(YES) range:(NSMakeRange(0, 2))];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.412 green:0.420 blue:0.424 alpha:1.000] range:NSMakeRange(0, str.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, str.length)];
    return str;
}
#pragma mark - lazy
- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 0, [UIScreen mainScreen].bounds.size.width * 300 / 750))];
        
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
        _pc.currentPageIndicatorTintColor = [UIColor cyanColor];
        _pc.pageIndicatorTintColor = [UIColor whiteColor];
        _pc.userInteractionEnabled = NO;
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(5);
        }];
    }
    return _headerView;
}

@end
