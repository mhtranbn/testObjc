//
//  PKIZoomVC.h
//  testObjc
//
//  Created by mhtran on 6/6/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKIZoomVC : UIViewController
- (IBAction)closeAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameImageLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberImageLabel;
- (void)setData:(NSString *)nameImage :(NSString *)numberImage;
@end
