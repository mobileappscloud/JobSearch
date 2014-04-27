//
//  HomeJobSearchViewController.h
//  JobSearch
//
//  Created by iMac on 3/10/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeJobSearchViewController : UIViewController <UITextFieldDelegate>
{
    NSMutableArray *jobs;
}
@property (weak, nonatomic) IBOutlet UITextField *jobDescription;
@property (weak, nonatomic) IBOutlet UITextField *location;
- (IBAction)clearTextFields:(id)sender;

@end
