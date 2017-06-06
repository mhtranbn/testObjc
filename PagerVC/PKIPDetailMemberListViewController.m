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
@interface PKIPDetailMemberListViewController ()
@end

@implementation PKIPDetailMemberListViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)setUpView {
    naviCustom = [[NaviCustom alloc] init];
    [naviCustom setViewWithImage:nil withBackImage:@"ic_back" andController:self];
    [self.view addSubview:naviCustom];
    naviCustom.translatesAutoresizingMaskIntoConstraints = NO;
    [naviCustom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(60);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:@"PagerCellCustom" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PagerCellCustom"];
    imagesArray = [[NSMutableArray alloc] init];
    for (int index = 0; index < 7; index ++ ) {
        UIImageView *image;
        image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",index]];
        [imagesArray addObject:image];

    }

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
    
    if (cell == nil) {
        cell = (PagerCellCustom *)[[PagerCellCustom alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];

    }
    [cell setImageArray:imagesArray];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

-(void)tapImage:(NSInteger)index{
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Click"
                                 message:[NSString stringWithFormat:@"You tapped on index %ld",index]
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self setUpView];
}

@end
