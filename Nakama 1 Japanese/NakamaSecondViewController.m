//
//  NakamaSecondViewController.m
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NakamaSecondViewController.h"
#import "NakamaVocabListController.h"

@interface NakamaSecondViewController ()

@end

@implementation NakamaSecondViewController
@synthesize vocabListAll;
@synthesize chapterList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // This fragment duplicated in FirstViewController----------
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nakama1" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.vocabListAll = dict;
    
    NSArray *array = [[self.vocabListAll allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.chapterList = array;
    //----------------------------------------------------------
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.vocabListAll = nil;
    self.chapterList = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chapterList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ChapterCellIdentifier = @"ChapterItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ChapterCellIdentifier];

    cell.textLabel.text = [self.chapterList objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = @"ok";
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"listVocabulary"]) {
        NakamaVocabListController *vocabListController = [segue destinationViewController];
        
        NSString *chapterKey = [self.chapterList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        vocabListController.vocabListSpecific = [self.vocabListAll objectForKey:chapterKey];
        vocabListController.navigationItem.title = chapterKey;
    }
}

@end
