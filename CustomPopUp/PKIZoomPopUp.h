//
//  PKIZoomPopUp.h
//  testObjc
//
//  Created by mhtran on 6/6/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKIZoomPopUp : UIView
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *numberImage;
@property (weak, nonatomic) IBOutlet UILabel *nameImage;


- (IBAction)closeButton:(UIButton *)sender;

@end
