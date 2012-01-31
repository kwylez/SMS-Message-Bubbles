//
//  MessageBubblesViewController.h
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreadCell.h"

@interface MessageBubblesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate> {
  NSMutableArray *messages;
  UITableView *tblView;
  UITextView *inputView;
  UIButton *sendButton;
}

@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, retain) IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet UITextView *inputView;
@property (nonatomic, retain) IBOutlet UIButton *sendButton;

- (IBAction)updateChatFromTextView:(id)sender;

@end
