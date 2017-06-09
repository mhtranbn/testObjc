//
//  PagerCellCustom.h
//  testObjc
//
//  Created by mhtran on 6/6/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSlideView.h"
#import <QuartzCore/QuartzCore.h>

@interface PagerCellCustom : UITableViewCell<RSlideViewDelegate,RSlideViewDataSource>{}
@property (nonatomic,strong)NSMutableArray *imagesArray;
@property (nonatomic, weak) IBOutlet RSlideView *slideView;
@property (weak, nonatomic) IBOutlet UILabel *nameImageLabel;
//@property (nonatomic,strong)NSTimer *nst_Timer;
@property (weak, nonatomic) IBOutlet UILabel *numberImage;
@property (copy, nonatomic) void (^didTapImageBlock)(NSInteger index);
//- (void)setDidTapImageBLock:(void (^)())didTapImageBlock;
-(NSMutableArray *)imagesArray;
-(NSMutableArray *)setImageArray:(NSMutableArray *)newImageArray;
- (IBAction)onNext:(id)sender;

@end
