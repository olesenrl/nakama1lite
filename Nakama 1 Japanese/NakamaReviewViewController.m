//
//  NakamaReviewViewController.m
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NakamaReviewViewController.h"

#define atInstructionPage   -1

@interface NakamaReviewViewController ()

@end

@implementation NakamaReviewViewController
@synthesize frontLabel = _frontLabel;
@synthesize backLabel = _backLabel;
@synthesize japaneseList = _japaneseList;
@synthesize englishList = _englishList;
@synthesize swipeRightRecognizer = _swipeRightRecognizer;
@synthesize swipeLeftRecognizer = _swipeLeftRecognizer;
@synthesize doubleTapRecognizer = _doubleTapRecognizer;
@synthesize currentIndex = _currentIndex;
@synthesize endReviewButton = _endReviewButton;
@synthesize changeLanguageButton = _changeLanguageButton;
@synthesize swipeInstructionsLabel = _swipeInstructionsLabel;
@synthesize swipeInstructionsButton = _swipeInstructionsButton;

- (IBAction)changeLanguage:(UIButton *)sender {
    NSArray *swap = self.japaneseList;
    self.japaneseList = self.englishList;
    self.englishList = swap;
    
    if ([self.changeLanguageButton.titleLabel.text isEqualToString:@"Japanese -> English"]) {   
        [self.changeLanguageButton setTitle:@"English -> Japanese" forState:UIControlStateNormal];
    } else {
        [self.changeLanguageButton setTitle:@"Japanese -> English" forState:UIControlStateNormal];
    }
    
    if (self.currentIndex > atInstructionPage) {
        self.frontLabel.text = [self.japaneseList objectAtIndex:self.currentIndex];
        self.backLabel.hidden = YES;
        self.backLabel.text = [self.englishList objectAtIndex:self.currentIndex];
    }
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
	// Do any additional setup after loading the view.
    self.currentIndex = atInstructionPage;
    [self.endReviewButton setExclusiveTouch:YES];
    self.swipeInstructionsButton.hidden = YES;
    
}

- (void)viewDidUnload
{
    [self setFrontLabel:nil];
    [self setBackLabel:nil];
    [self setSwipeRightRecognizer:nil];
    [self setSwipeLeftRecognizer:nil];
    [self setDoubleTapRecognizer:nil];
    self.japaneseList = nil;
    self.englishList = nil;
    
    [self setChangeLanguageButton:nil];
    [self setSwipeInstructionsLabel:nil];
    [self setSwipeInstructionsButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    //!M: More?
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)endReview:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    // Disallow recognition of tap gestures in the segmented control.
    if ((touch.view == self.endReviewButton) && (gestureRecognizer == self.doubleTapRecognizer)) {
        return NO;
    }
    return YES;
}

#pragma mark -
#pragma mark Responding to Gestures
- (IBAction)handleDoubleTapFrom:(UITapGestureRecognizer *)recognizer {
    if (self.currentIndex != atInstructionPage) {
        self.backLabel.hidden = NO;
    }
}

- (IBAction)handleSwipeRightFrom:(UISwipeGestureRecognizer *)recognizer {
    self.swipeInstructionsLabel.hidden = YES;
    self.swipeInstructionsButton.hidden = NO;
    
    if (self.currentIndex > 0) {
        self.currentIndex--;
    } else {
        self.currentIndex = [self.japaneseList count] - 1;
    }
    
    self.frontLabel.text = [self.japaneseList objectAtIndex:self.currentIndex];
    self.backLabel.hidden = YES;
    self.backLabel.text = [self.englishList objectAtIndex:self.currentIndex];
}

- (IBAction)handleSwipeLeftFrom:(UISwipeGestureRecognizer *)recognizer {
    self.swipeInstructionsButton.hidden = NO;
    
    if (self.currentIndex <= atInstructionPage) {
        self.swipeInstructionsLabel.hidden = YES;
        self.currentIndex = 0;
    } else {
        self.currentIndex++;
        if (self.currentIndex == [self.japaneseList count]) {
            self.currentIndex = 0;
        }
    }
    
    self.frontLabel.text = [self.japaneseList objectAtIndex:self.currentIndex];
    self.backLabel.hidden = YES;
    self.backLabel.text = [self.englishList objectAtIndex:self.currentIndex];
    
}

- (IBAction)showUsageInstructions:(id)sender {
    self.currentIndex = atInstructionPage;
    self.swipeInstructionsLabel.hidden = NO;
    self.frontLabel.text = @"Swipe to begin      >";
    self.backLabel.text = @"Single tap for definition";
    self.backLabel.hidden = NO;
    self.swipeInstructionsButton.hidden = YES;
}

@end
