//
//  DetailsViewController.m
//  JobSearch
//
//  Created by iMac on 3/17/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "DetailsViewController.h"
#import "ApplyWebViewController.h"
#import "Job.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize jobDesc,jobTitle,minimum,maximum,companyName, jobDescString, jobTitleString, minimumString, maximumString, companyNameString, properUrlString, managedObjectContext;

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  

    jobTitle.text = jobTitleString;
    companyName.text = companyNameString;
    minimum.text = minimumString;
    maximum.text = maximumString;
    webUrl = properUrlString;
    jobName = jobTitleString;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Job" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    self.dataArray =[managedObjectContext executeFetchRequest:fetchRequest error:&error];

    

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"shareData"])
    {
        ApplyWebViewController *webView = (ApplyWebViewController *)segue.destinationViewController;
        
       
        NSString *theWebUrl = webUrl;
        
        NSLog(@"This is the url: %@", webUrl);

        [webView setWebUrl:theWebUrl];
        
    
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveJob:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    Job *savedJob = [NSEntityDescription insertNewObjectForEntityForName:@"Job" inManagedObjectContext:context];
    [savedJob setValue:jobName forKey:@"name"];
    
    NSError *error;
    
    if (![context save:&error])
    {
        NSLog(@"Whoops! Couldnt find the save %@", error.localizedDescription);
    }
    else
    {
        UIAlertView *myAlertview = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Job Saved!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [myAlertview show];
    }
    
    
}
@end
