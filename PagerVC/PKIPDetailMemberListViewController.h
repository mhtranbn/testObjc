//
//  PKIPDetailMemberListViewController.h
//  testObjc
//
//  Created by mhtran on 6/5/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaviCustom.h"

@interface PKIPDetailMemberListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,NavicustomDelegate>{
    NaviCustom *naviCustom;
    NSArray *tableData;

}
@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
