//
//  NaviCustom.h
//  testObjc
//
//  Created by mhtran on 6/5/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavicustomDelegate <NSObject>

@optional
-(void)backNaviCustomDidPress;
-(void)secondNaviCustomDidPress;

@end

@interface NaviCustom : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageBack;
@property (weak, nonatomic) IBOutlet UIImageView *imageSecond;
@property (nonatomic, weak) UIViewController *controller;

@property (nonatomic, weak) id<NavicustomDelegate>delegate;
- (IBAction)backAction:(UIButton *)sender;
- (IBAction)secondAction:(UIButton *)sender;

- (void) setViewWithImage:(NSString *) imageNameBackGround withBackImage:(NSString *) imageNameButtonBack andController:(UIViewController *)aController;
- (void) setViewWithImage:(NSString *) imageNameBackGround withBackImage:(NSString *) imageNameButtonBack  withSeconImage:(NSString *) imageNameSecond andController:(UIViewController *)aController;
@end

