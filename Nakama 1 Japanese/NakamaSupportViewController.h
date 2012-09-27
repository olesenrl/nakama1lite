//
//  NakamaSupportViewController.h
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface NakamaSupportViewController : UIViewController <MFMailComposeViewControllerDelegate>

-(IBAction)displaySupportEmailDraft:(id)sender;

@end
