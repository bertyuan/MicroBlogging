//
//  MicroMessageCell.h
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright 2010 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MicroMessageInfo.h"


@interface MicroMessageCell : UITableViewCell {
    MicroMessageInfo *messageInfo;
    UIImageView *imageView;
    UILabel *nameLabel;
    UILabel *messageLabel;
    UILabel *prepTimeLabel;	
	UILabel * clientLabel;
}


@property (nonatomic, retain) MicroMessageInfo *messageInfo;

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *messageLabel;
@property (nonatomic, retain) UILabel *prepTimeLabel;
@property (nonatomic, retain) UILabel *clientLabel;

- (CGFloat)cellHeight;
@end
