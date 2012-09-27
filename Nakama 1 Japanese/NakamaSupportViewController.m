//
//  NakamaSupportViewController.m
//  Nakama 1 Japanese
//
//  Created by Ming Loong Chng on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NakamaSupportViewController.h"

@interface NakamaSupportViewController ()

@end

@implementation NakamaSupportViewController

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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)displaySupportEmailDraft:(id)sender
{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    [picker setSubject:@"Feedback for Nakama 1 Vocab Review app"];
    
    // Set up the recipients.
    NSArray *toRecipients = [NSArray arrayWithObjects:@"vocabreview@gmail.com",
                             nil];
    [picker setToRecipients:toRecipients];
    
    // Fill out the email body text.
    NSString *emailBody = @"Found a bug?\n Want more features?\n Looking to advertise on the app?\n Like the app?\n Would like to help me out?\n Just wanted to say hi?\n\n This is my very first iPhone app and I'd like to hear from you!";
    [picker setMessageBody:emailBody isHTML:NO];
    
    // Present the mail composition interface.
    [self presentModalViewController:picker animated:YES];
}

// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
