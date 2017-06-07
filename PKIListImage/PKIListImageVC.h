//
//  PKIListImageVC.h
//  testObjc
//
//  Created by mhtran on 6/7/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviCustom.h"
#import "AdDisplayInfo.h"
#import <ImobileSdkAds/ImobileSdkAds.h>

@interface PKIListImageVC : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,NavicustomDelegate,IMobileSdkAdsDelegate>
@property (nonatomic) AdDisplayInfo *adDisplayInfo;

@end
