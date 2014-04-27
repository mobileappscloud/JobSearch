//
//  FoundJobsTableViewController.m
//  JobSearch
//
//  Created by iMac on 3/10/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "FoundJobsTableViewController.h"
#import "HomeJobSearchViewController.h"

@interface FoundJobsTableViewController ()



@end

@implementation FoundJobsTableViewController

@synthesize myArray, theUrlString;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)setArray:(NSMutableArray *)a
{
    
    theJobPopulateArray = a;

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView reloadData];



}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [theJobPopulateArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
    NSString *currentItem = [theJobPopulateArray objectAtIndex:indexPath.row];

    cell.textLabel.text = currentItem;
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 

   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"next"])
    {
        DetailsViewController *dVC = (DetailsViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        NSString *theCorrectUrlString = [NSString stringWithFormat:@"%@", theUrlString];
        NSURL *url = [NSURL URLWithString:theCorrectUrlString];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSError *error;
        
        NSMutableArray *jobsCallArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        
        
        for (NSDictionary *theJob in jobsCallArray)
        {
            
            
            
            NSString *currentObject = [theJobPopulateArray objectAtIndex:indexPath.row];
            
            
            if ([currentObject isEqualToString:theJob[@"position_title"]])
            {
                NSString *minString = [NSString stringWithFormat:@"%@", theJob[@"minimum"]];
                NSString *maxString = [NSString stringWithFormat:@"%@", theJob[@"maximum"]];
                
                
                
                [dVC setJobTitleString:[NSString stringWithFormat:@"%@", currentObject]];
                [dVC setCompanyNameString:[NSString stringWithFormat:@"%@", theJob[@"organization_name"]]];
                [dVC setMinimumString:[NSString stringWithFormat:@"$%.2lf", [minString doubleValue]]];
                [dVC setMaximumString:[NSString stringWithFormat:@"$%.2lf", [maxString doubleValue]]];
                [dVC setProperUrlString:[NSString stringWithFormat:@"%@", theJob[@"url"]]];
                
                
                
            
                
                
            }
            
        }
        
    
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
