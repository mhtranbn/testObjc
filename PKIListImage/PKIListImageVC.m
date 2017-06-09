//
//  PKIListImageVC.m
//  testObjc
//
//  Created by mhtran on 6/7/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PKIListImageVC.h"
#import "PKIImageCollectionViewCell.h"
#import "Masonry.h"
#import "PKIListShowAd.h"


@interface PKIListImageVC ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) ImobileSdkAdsNativeObject *ads;
@end

@implementation PKIListImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    
}

-(void)setUpUI {
    NaviCustom *naviCustom = [[NaviCustom alloc] init];
    [naviCustom setViewWithImage:nil withBackImage:@"ic_back" withSeconImage:@"ic_next" andController:self];
    [naviCustom setTitel:@"List Image"];
    naviCustom.delegate = self;
    [self.view addSubview:naviCustom];
    naviCustom.translatesAutoresizingMaskIntoConstraints = NO;
    __weak PKIListImageVC *weakSelf;
    [naviCustom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(0);
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.height.mas_equalTo(60);
    }];
    [self.collectionView registerNib:[UINib nibWithNibName:@"PKIImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PKIImageCollectionViewCell"];
    
    NSString *pid = @"34816";//self.adDisplayInfo.pid;
    NSString *mid = @"135002";//self.adDisplayInfo.mid;
    NSString *sid = @"564743";//self.adDisplayInfo.sid;
    [ImobileSdkAds registerWithPublisherID:pid MediaID:mid SpotID:sid];
    [ImobileSdkAds setSpotDelegate:sid delegate:self];
    [ImobileSdkAds startBySpotID:sid];
    [ImobileSdkAds getNativeAdData:sid ViewController:self Delegate:self];
}

//MARK: NaviCustom Delegate;

- (void)secondNaviCustomDidPress{
    PKIListShowAd *controller = [[PKIListShowAd alloc] initWithNibName:@"PKIListShowAd" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
    
}

//MARK : UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PKIImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PKIImageCollectionViewCell" forIndexPath:indexPath];
    cell.nameImageLabel.text = [NSString stringWithFormat:@"%@",[_ads getAdTitle]];
    cell.descriptionLabel.text = [NSString stringWithFormat:@"%@",[_ads getAdDescription]];
    [_ads getAdImageCompleteHandler:^(UIImage *loadimg) {
        cell.imageCollectionCell.image =  loadimg;
    }];
    [_ads addClickFunction:cell.imageCollectionCell];
    [_ads addClickFunction:cell.nameImageLabel];
    [_ads addClickFunction:cell.descriptionLabel];
    return cell;
}

//MARK : UIcollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth / 2.06;
    float cellHeight = screenWidth / 1.8;
    CGSize size = CGSizeMake(cellWidth,cellHeight);
    return size;
}

#pragma mark - i-mobileデリゲードメソッド
- (void)onNativeAdDataReciveCompleted:(NSString *)spotId nativeArray:(NSArray *)nativeArray{
    _ads = (ImobileSdkAdsNativeObject *)[nativeArray objectAtIndex:0];
//    __weak PKIListImageVC *weakSelf;
    [_ads getAdImageCompleteHandler:^(UIImage *loadimg) {
        [self.collectionView reloadData];
    }];
}



@end
