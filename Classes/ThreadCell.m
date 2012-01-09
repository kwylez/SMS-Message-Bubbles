//
//  ThreadCell.m
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ThreadCell.h"


@implementation ThreadCell

@synthesize msgText;
@synthesize imgName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    self.accessoryType   = UITableViewCellAccessoryNone;
    self.backgroundColor = [UIColor clearColor];
  }
  
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}

- (void)layoutSubviews {

  CGSize size           = [ThreadCell calcTextHeight:self.msgText];
  UIImage *balloon      = [[UIImage imageNamed:self.imgName] stretchableImageWithLeftCapWidth:24 topCapHeight:15];
  UIImageView *newImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width + 35, size.height + 10)];
  UIView *newView       = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
  
  UILabel *txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, size.width, size.height)];

  txtLabel.lineBreakMode   = UILineBreakModeWordWrap;
  txtLabel.numberOfLines   = 0;
  txtLabel.text            = msgText;
  txtLabel.backgroundColor = [UIColor clearColor];
  txtLabel.font            = [UIFont systemFontOfSize:14.0];
  txtLabel.tag             = 42;

  [txtLabel sizeToFit];
  
  [newImage setImage:balloon];
  [newView addSubview:newImage];

  [self setBackgroundView:newView];

  [[self.contentView viewWithTag:42] removeFromSuperview];
  [self.contentView addSubview:txtLabel];
  
  [txtLabel release];
  
  [newImage release];
  [newView release];
}

+ (CGSize)calcTextHeight:(NSString *)str {
  
  CGSize textSize = {260.0, 20000.0};
  CGSize size     = [str sizeWithFont:[UIFont systemFontOfSize:14.0] 
                    constrainedToSize:textSize];
  
  return size;
}

- (void)dealloc {
  [msgText release];
  [imgName release];
  [super dealloc];
}


@end
