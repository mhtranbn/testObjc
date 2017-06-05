//
//  PKIPDetailMemberListViewController.h
//  testObjc
//
//  Created by mhtran on 6/5/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviCustom.h"

@interface PKIPDetailMemberListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NaviCustom *naviCustom;
    NSArray *tableData;

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
