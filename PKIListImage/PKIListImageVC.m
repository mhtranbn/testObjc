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
@property (strong, nonatomic) UIImage *myImage;

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
    [naviCustom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(60);
    }];
    self.myImage = [UIImage imageNamed:@"2.jpg"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"PKIImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PKIImageCollectionViewCell"];
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
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     PKIImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PKIImageCollectionViewCell" forIndexPath:indexPath];
    cell.imageCollectionCell.image = self.myImage;
    cell.nameImageLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
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


@end
