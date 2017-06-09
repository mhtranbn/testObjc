//
//  PKIPDetailMemberListViewController.m
//  testObjc
//
//  Created by mhtran on 6/5/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PKIPDetailMemberListViewController.h"
#import "Masonry.h"
#import "PagerCellCustom.h"
#import "PKIZoomVC.h"
#import "PKIListImageVC.h"
@interface PKIPDetailMemberListViewController ()
@end
@implementation PKIPDetailMemberListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView {
    naviCustom = [[NaviCustom alloc] init];
    __weak PKIPDetailMemberListViewController *weakSelf = self;
    [naviCustom setViewWithImage:nil withBackImage:@"ic_back" withSeconImage:@"ic_next" andController:self];
    naviCustom.delegate = self;
    [naviCustom setTitel:@"List Member"];
    [self.view addSubview:naviCustom];
    naviCustom.translatesAutoresizingMaskIntoConstraints = NO;
    [naviCustom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(0);
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.height.mas_equalTo(60);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:@"PagerCellCustom" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PagerCellCustom"];
    _imagesArray = [[NSMutableArray alloc] init];
    for (int index = 0; index < 7; index ++ ) {
        UIImageView *image;
        image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",index]];
        [_imagesArray addObject:image];
    }
}

//MARK: NaviCustomDelegate

- (void)secondNaviCustomDidPress {
    PKIListImageVC *controller = [[PKIListImageVC alloc] initWithNibName:@"PKIListImageVC" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}


//MARK: Data Source, Delegate TableView;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"PagerCellCustom";
    
    PagerCellCustom *cell =  (PagerCellCustom *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    [cell onNext:nil];
    
    if (cell == nil) {
        cell = (PagerCellCustom *)[[PagerCellCustom alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    [cell setImageArray:_imagesArray];
    __weak PKIPDetailMemberListViewController *weakSelf = self;
    [cell setDidTapImageBlock:^(NSInteger index){
        [weakSelf tapImage:index];
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

-(void)tapImage:(NSInteger)index{
    PKIZoomVC *controller = [[PKIZoomVC alloc] initWithNibName:@"PKIZoomVC" bundle:nil];
    [controller setData:[NSString stringWithFormat:@"%ld.jpg ",(long)index] :[NSString stringWithFormat:@"%ld / %ld ",(long)index,(long)_imagesArray.count]];
    [self.navigationController pushViewController:controller animated:NO];
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


@end
