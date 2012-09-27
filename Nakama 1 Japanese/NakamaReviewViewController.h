//
//  NakamaReviewViewController.h
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NakamaReviewViewController : UIViewController <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *frontLabel;
@property (weak, nonatomic) IBOutlet UILabel *backLabel;
@property (nonatomic, strong) NSArray *japaneseList; //!Ming: copy?? 
@property (nonatomic, strong) NSArray *englishList;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *doubleTapRecognizer;
@property (strong, nonatomic) IBOutlet UIButton *endReviewButton;
@property (weak, nonatomic) IBOutlet UIButton *changeLanguageButton;
@property (weak, nonatomic) IBOutlet UILabel *swipeInstructionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *swipeInstructionsButton;

@property (nonatomic) NSInteger currentIndex;

- (IBAction)endReview:(id)sender;

- (IBAction)handleDoubleTapFrom:(UITapGestureRecognizer *)recognizer;
- (IBAction)handleSwipeRightFrom:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)handleSwipeLeftFrom:(UISwipeGestureRecognizer *)recognizer;

@end
