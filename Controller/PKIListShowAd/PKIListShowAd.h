//
//  PKIListShowAd.h
//  testObjc
//
//  Created by mhtran on 6/7/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviCustom.h"
#import "AdDisplayInfo.h"
#import <ImobileSdkAds/ImobileSdkAds.h>

@interface PKIListShowAd : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,IMobileSdkAdsDelegate>
@property (nonatomic) AdDisplayInfo *adDisplayInfo;
- (void)setViewAnimate:(UIView *)view hidden:(BOOL)hidden ;

@end
