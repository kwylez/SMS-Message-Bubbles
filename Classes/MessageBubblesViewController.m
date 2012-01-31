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
@synthesize tblView;
@synthesize inputView;
@synthesize sendButton;

- (void)dealloc {
  
  [messages release];
  [tblView release];
  [inputView release];
  [sendButton release];
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {

  [super viewDidLoad];
  
  self.view.autoresizesSubviews = YES;
  self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
  
  self.messages = [NSMutableArray arrayWithObjects:@"This is the first message", 
                                                   @"This is the second message", 
                                                   @"This is the third message which is longer than most", 
                                                   @"This is the fourth message that is super super super long, This is the fourth message that is super super super long", nil];
}

- (void)viewDidUnload {
  
  [super viewDidUnload];
  
  self.tblView    = nil;
  self.inputView  = nil;
  self.sendButton = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [self.messages count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	
  // create the parent view that will hold header Label
	UIView *customView   = [[[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 20.0)] autorelease];
	UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];

	customView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  
  headerLabel.backgroundColor      = [UIColor clearColor];
	headerLabel.opaque               = NO;
	headerLabel.textColor            = [UIColor darkGrayColor];
	headerLabel.highlightedTextColor = [UIColor whiteColor];
	headerLabel.font                 = [UIFont boldSystemFontOfSize:12];
	headerLabel.frame                = CGRectMake(115.0, 0.0, 300.0, 20.0);
	
  	
	headerLabel.text = @"June 18th, 2010 4:52pm";
	
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
    cell = [[[ThreadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }

  cell.imgName      = (indexPath.section % 2 == 0) ? @"aqua.png" : @"purple.png";
  cell.tipRightward = (indexPath.section % 2 == 0);
  cell.msgText      = [self.messages objectAtIndex:indexPath.section];
      
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *aMsg = [self.messages objectAtIndex:indexPath.section];
  CGFloat widthForText ;
  
  UIInterfaceOrientation orient = [self interfaceOrientation];
  
  if (UIInterfaceOrientationIsPortrait(orient)) {
    widthForText = 260.f;
  } else {
    widthForText = 400.f;
  }
    
	CGSize size = [ThreadCell calcTextHeight:aMsg withinWidth:widthForText];

	size.height += 5;
	
	CGFloat height = (size.height < 36) ? 36 : size.height;
	
	return height;
}

#pragma mark - UITextViewDelegate Methods

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  
  if ([text isEqualToString:@"\n"]) {
    
    [textView resignFirstResponder];
    
    return NO;
  }
  
  return YES;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  return YES;
}

#pragma mark - Public Methods

- (IBAction)updateChatFromTextView:(id)sender {

  [self.inputView resignFirstResponder];
  
  NSString *newValue = [NSString stringWithFormat:@"%@", self.inputView.text];
  
  [self.messages addObject:newValue];
  
  self.inputView.text = @"";
  
  [self.tblView reloadData];
  
  NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:0 inSection:([self.messages count] - 1)];

  [self.tblView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


@end

