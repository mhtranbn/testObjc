//
//  NaviCustom.m
//  testObjc
//
//  Created by mhtran on 6/5/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "NaviCustom.h"

@implementation NaviCustom
@synthesize backButton;
@synthesize secondButton;
@synthesize imageBack;
@synthesize imageSecond;
@synthesize controller;
@synthesize backgroundImage;
@synthesize delegate;

- (instancetype)init {
    self = [[[NSBundle mainBundle]loadNibNamed:@"NaviCustom" owner:nil options:nil] objectAtIndex:0];
    return self;
}

-(void)setViewWithImage:(NSString *)imageNameBackGround withBackImage:(NSString *)imageNameButtonBack andController:(UIViewController *)aController {
    controller = aController;
    UIImage *imageBackGround = [UIImage imageNamed:imageNameBackGround];
    [backgroundImage setImage:imageBackGround];
    UIImage *imageBackButton = [UIImage imageNamed:imageNameButtonBack];
    [imageBack setImage:imageBackButton];
    
    
}

-(void)setViewWithImage:(NSString *)imageNameBackGround withBackImage:(NSString *)imageNameButtonBack withSeconImage:(NSString *)imageNameSecond andController:(UIViewController *)aController {
    controller = aController;
    UIImage *imageBackGround = [UIImage imageNamed:imageNameBackGround];
    [backgroundImage setImage:imageBackGround];
    UIImage *imageBackButton = [UIImage imageNamed:imageNameButtonBack];
    [imageBack setImage:imageBackButton];
    UIImage *imageSeconButton = [UIImage imageNamed:imageNameSecond];
    [imageSecond setImage:imageSeconButton];
    
}

- (IBAction)backAction:(UIButton *)sender {
    if (imageBack.image != nil) {
        if (self.delegate != nil) {
            [delegate backNaviCustomDidPress];
        } else {
            [controller.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (IBAction)secondAction:(UIButton *)sender {
    if (imageBack.image != nil) {
        if (self.delegate != nil) {
            [delegate secondNaviCustomDidPress];
        }
    }
}
@end
