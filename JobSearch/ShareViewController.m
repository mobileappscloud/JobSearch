//
//  ShareViewController.m
//  JobSearch
//
//  Created by iMac on 3/10/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //Tell him with what social plattform to use it, e.g. facebook or twitter
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"Using this amazing app to find jobs!"]]; //the message you want to post
                //  [mySLComposerSheet addImage:yourimage]; //an image you could post
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        } //check if everything worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];

}

- (IBAction)shareTwitter:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Using this amazing to find jobs!"];
    
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }

}

- (IBAction)shareEmail:(id)sender {
    
    //Play audio soundas
    
    
    MFMailComposeViewController *mViewController = [[MFMailComposeViewController alloc] init];
    mViewController.mailComposeDelegate = self;
    [mViewController setSubject:@"Check out this iOU app!"];
    [mViewController setMessageBody:@"Using this amazing app fins jobs!" isHTML:NO];
    
    [self presentViewController:mViewController animated:YES completion:nil];
    

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
