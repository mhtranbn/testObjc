//
//  PKIImageCollectionViewCell.m
//  testObjc
//
//  Created by mhtran on 6/7/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PKIImageCollectionViewCell.h"

@implementation PKIImageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageCollectionCell.layer.borderColor = [[UIColor blackColor] CGColor];
    self.imageCollectionCell.layer.borderWidth = 1.0;
    // Initialization code
}

@end
