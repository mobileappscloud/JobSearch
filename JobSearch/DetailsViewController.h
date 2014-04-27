//
//  DetailsViewController.h
//  JobSearch
//
//  Created by iMac on 3/17/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
{
    NSString *webUrl;
    NSString *jobName;
}
@property (weak, nonatomic) IBOutlet UILabel *jobTitle;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UITextView *jobDesc;
@property (weak, nonatomic) IBOutlet UILabel *minimum;
@property (weak, nonatomic) IBOutlet UILabel *maximum;
@property (weak, nonatomic)NSString *jobTitleString;
@property (weak, nonatomic)NSString *companyNameString;
@property (weak, nonatomic)NSString *jobDescString;
@property (weak, nonatomic)NSString *minimumString;
@property (weak, nonatomic)NSString *maximumString;
@property (weak, nonatomic)NSString *properUrlString;
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property(strong)NSArray *dataArray;

- (IBAction)saveJob:(id)sender;

@end
