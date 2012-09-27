//
//  NakamaFirstViewController.h
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NakamaFirstViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *chapterPicker;
@property (nonatomic, strong) NSDictionary *vocabListAll;
@property (nonatomic, strong) NSArray *chapterList;
@property (nonatomic, strong) NSDictionary *selectedChapter;

@end
