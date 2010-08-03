//
//  MessageBubblesViewController.h
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreadCell.h"

@interface MessageBubblesViewController : UITableViewController {
  NSArray *messages;
}

@property (nonatomic, retain) NSArray *messages;

@end
