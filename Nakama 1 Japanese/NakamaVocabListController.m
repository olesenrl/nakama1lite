//
//  NakamaVocabListController.m
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NakamaVocabListController.h"

@interface NakamaVocabListController ()

@end

@implementation NakamaVocabListController
@synthesize vocabListSpecific = _vocabListSpecific;
@synthesize vocabTypes = _vocabTypes;

//- (void)setVocabList:(NSDictionary *)vocabList {
//    NSLog(@"CALLED");
//}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSArray *array = [self.vocabListSpecific.allKeys sortedArrayUsingSelector:@selector(compare:)];
    self.vocabTypes = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.vocabListSpecific = nil;
    self.vocabTypes = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.vocabTypes count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *vocabType = [self.vocabTypes objectAtIndex:section];
    NSArray *vocabListInSection = [self.vocabListSpecific objectForKey:vocabType];
    
    return [vocabListInSection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *vocabCellIdentifier = @"VocabItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vocabCellIdentifier];
    
    // Identify section of vocabulary
    NSUInteger section = indexPath.section;
    NSString *vocabType = [self.vocabTypes objectAtIndex:section];
    NSDictionary *vocabListInSection = [self.vocabListSpecific objectForKey:vocabType];
    NSArray *vocabListItemArray = [vocabListInSection.allKeys sortedArrayUsingSelector:@selector(compare:)];
    
    // Retrieve vocabulary item and definition
    NSUInteger row = indexPath.row;
    NSString *vocabItem = [vocabListItemArray objectAtIndex:row];
    NSString *vocabDefinition = [vocabListInSection objectForKey:vocabItem];
    
    cell.textLabel.text = vocabItem;
    cell.detailTextLabel.text = vocabDefinition;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.vocabTypes objectAtIndex:section];
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Identify section
    NSUInteger section = indexPath.section;
    NSString *vocabType = [self.vocabTypes objectAtIndex:section];
    NSDictionary *vocabListInSection = [self.vocabListSpecific objectForKey:vocabType];
    
    // Identify row in section
    NSUInteger row = indexPath.row;
    NSArray *vocabListItemArray = [vocabListInSection.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSString *vocabItem = [vocabListItemArray objectAtIndex:row];
    NSString *vocabDefinition = [vocabListInSection objectForKey:vocabItem];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:vocabItem message:vocabDefinition delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
  
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
  
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


@end
