//
//  ThreadCell.h
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadCell : UITableViewCell {
  NSString *msgText;
  NSString *imgName;
}

@property (nonatomic, retain) NSString *msgText;
@property (nonatomic, retain) NSString *imgName;

+ (CGSize)calcTextHeight:(NSString *)str;

@end
