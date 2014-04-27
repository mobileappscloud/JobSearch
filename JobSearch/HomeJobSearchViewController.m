//
//  HomeJobSearchViewController.m
//  JobSearch
//
//  Created by iMac on 3/10/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "HomeJobSearchViewController.h"
#import "FoundJobsTableViewController.h"
#import "DetailsViewController.h"
#import "Job.h"

@interface HomeJobSearchViewController ()

@end

@implementation HomeJobSearchViewController
@synthesize jobDescription, location;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        jobs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:TRUE];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.usa.gov/jobs/search.json?query=%@+jobs+in+%@", [jobDescription text], [location text]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    jobs = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
   
    
   
    
    //  NSLog(@"%@", jobs);
    
    
    for (NSDictionary *theJob in jobs)
    {
        //    NSLog(@"%@", theJob[@"position_title"]);
         NSArray *jobArray = theJob[@"position_title"];
        NSLog(@"%@", jobArray);
    
        
    }
    
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
    if ([segue.identifier isEqualToString:@"push"])
    {
        NSString *urlString = [NSString stringWithFormat:@"http://api.usa.gov/jobs/search.json?query=%@+jobs+in+%@", [jobDescription text], [location text]];
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSError *error;
        
        NSMutableArray *jobsCallArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSMutableArray *positionArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *theJob in jobsCallArray)
        {
            NSString *jobDesc = theJob[@"position_title"];
            [positionArray addObject:jobDesc];
        }

        FoundJobsTableViewController *detailVC = (FoundJobsTableViewController*)segue.destinationViewController;
    
        [detailVC  setArray:positionArray];
        [detailVC setTheUrlString:urlString];
     
       
        
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearTextFields:(id)sender {
    
    location.text = @"";
    jobDescription.text = @"";
    location.placeholder = @"ex. CA for California";
    jobDescription.placeholder = @"ex. Nursing";
    
}
@end
