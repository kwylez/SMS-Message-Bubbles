//
//  MessageBubblesViewController.m
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MessageBubblesViewController.h"

@implementation MessageBubblesViewController

@synthesize messages;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {

  self.messages = [NSArray arrayWithObjects:@"This is the first message", 
                                            @"This is the second message", 
                   @"This is the third message which is longer than most", 
                   @"This is the fourth message that is super super super long, This is the fourth message that is super super super long", nil];
  
  self.tableView.backgroundColor  = [UIColor groupTableViewBackgroundColor];
  self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;

  [super viewDidLoad];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.messages count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	
  // create the parent view that will hold header Label
	UIView* customView = [[[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 20.0)] autorelease];
	
	// create the button object
	UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	
  headerLabel.backgroundColor      = [UIColor clearColor];
	headerLabel.opaque               = NO;
	headerLabel.textColor            = [UIColor darkGrayColor];
	headerLabel.highlightedTextColor = [UIColor whiteColor];
	headerLabel.font                 = [UIFont boldSystemFontOfSize:12];
	headerLabel.frame                = CGRectMake(115.0, 0.0, 300.0, 20.0);
	
  	
	headerLabel.text = @"June 18th, 2010 4:52pm"; // i.e. array element
	
  [customView addSubview:headerLabel];
	
  [headerLabel release];
	
  return customView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 20.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"MsgListCell";
  
  ThreadCell *cell = (ThreadCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

  if (cell == nil) {
    cell = [[[ThreadCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
  }

  cell.imgName = (indexPath.section % 2 == 0) ? @"aqua.png" : @"purple.png";
  cell.msgText = [self.messages objectAtIndex:indexPath.section];
      
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *aMsg = [self.messages objectAtIndex:indexPath.section];
	CGSize size    = [ThreadCell calcTextHeight:aMsg];

	size.height += 5;
	
	CGFloat height = (size.height < 36) ? 36 : size.height;
	
	return height;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dealloc {
  
  [messages release];
  [super dealloc];
}

@end

