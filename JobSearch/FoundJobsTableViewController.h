//
//  FoundJobsTableViewController.h
//  JobSearch
//
//  Created by iMac on 3/10/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface FoundJobsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *theJobArray;
    NSMutableArray *theJobPopulateArray;
}
-(void)setArray:(NSMutableArray *)a;

@property(nonatomic, strong) NSMutableArray *myArray;
@property(nonatomic, strong)NSString *theUrlString;

@end
