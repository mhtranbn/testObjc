//
//  PKIImageCollectionViewCell.h
//  testObjc
//
//  Created by mhtran on 6/7/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKIImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameImageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageCollectionCell;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
