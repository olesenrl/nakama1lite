//
//  NakamaFirstViewController.m
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NakamaFirstViewController.h"
#import "NakamaReviewViewController.h"

@interface NakamaFirstViewController ()

@end

@implementation NakamaFirstViewController
@synthesize chapterPicker;
@synthesize vocabListAll;
@synthesize chapterList;
@synthesize selectedChapter;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nakama1" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.vocabListAll = dict;
    
    NSArray *array = [[self.vocabListAll allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.chapterList = array;
    
    self.selectedChapter = [self.vocabListAll objectForKey:[self.chapterList objectAtIndex:0]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Picker View Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.chapterList count];
}

#pragma mark - Picker View Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // Assuming component is always 0
    return [self.chapterList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *selectedItem = [self.chapterList objectAtIndex:row];
    self.selectedChapter = [self.vocabListAll objectForKey:selectedItem];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSArray *japaneseList = [[NSArray alloc] init];
    NSArray *englishList = [[NSArray alloc] init];

    // For each vocabulary type (NSDictionary) in the chapter
    for (NSString *vocabTypeKey in self.selectedChapter) {
        NSDictionary *vocabType = [self.selectedChapter objectForKey:vocabTypeKey];
        
        NSArray *vocabItemArray = [vocabType allKeys];
        japaneseList = [japaneseList arrayByAddingObjectsFromArray:vocabItemArray];
            
        for (NSString *vocabItem in vocabItemArray) {
            englishList = [englishList arrayByAddingObject:[vocabType objectForKey:vocabItem]];
        }
    }

    if ([segue.identifier isEqualToString:@"reviewView"]) {
        NakamaReviewViewController *reviewViewController = [segue destinationViewController];
        reviewViewController.japaneseList = japaneseList;
        reviewViewController.englishList = englishList;
    }
    
}



@end
