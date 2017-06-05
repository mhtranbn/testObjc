//
//  PKIPDetailMemberListViewController.m
//  testObjc
//
//  Created by mhtran on 6/5/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PKIPDetailMemberListViewController.h"
#import "Masonry.h"
@interface PKIPDetailMemberListViewController ()
@end

@implementation PKIPDetailMemberListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
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
}


//MARK: Data Source, Delegate TableView;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
