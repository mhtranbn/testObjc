//
//  PKIListShowAd.m
//  testObjc
//
//  Created by mhtran on 6/7/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PKIListShowAd.h"
#import "Masonry.h"
#import <QuartzCore/QuartzCore.h>

@interface PKIListShowAd ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *adsView;

@end

@implementation PKIListShowAd

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

- (void)setUpView{
    NaviCustom *naviCustom = [[NaviCustom alloc] init];
    [naviCustom setViewWithImage:nil withBackImage:@"ic_back" withSeconImage:@"ic_next" andController:self];
    [naviCustom setTitel:@"List Show ads"];

    [self.view addSubview:naviCustom];
    naviCustom.translatesAutoresizingMaskIntoConstraints = NO;
    [naviCustom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(60);
    }];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
}

//MARK: NaviCustom Delegate

//MARK: TableView Scroll Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.adsView setHidden:YES];
    UIEdgeInsets padding = UIEdgeInsetsMake(60, 0, 0, 0);
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(padding);
    }];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    UIEdgeInsets padding = UIEdgeInsetsMake(60, 0, 60, 0);
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(padding);
    }];
    [self setViewAnimate:self.adsView hidden:NO];
}

- (void)setViewAnimate:(UIView *)view hidden:(BOOL)hidden {
    [self.adsView setHidden:NO];
    [self.adsView setAlpha:0.2];
    [UIView transitionWithView:view duration:2.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.adsView setAlpha:0.5];
    } completion:^(BOOL finished) {
        [self.adsView setAlpha:1.0];
    }];
}

//MARK: UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
