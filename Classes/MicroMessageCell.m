//
//  MicroMessageCell.m
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright 2010 home. All rights reserved.
//

#import "MicroMessageCell.h"


#pragma mark -
#pragma mark SubviewFrames category

@interface MicroMessageCell (SubviewFrames)
- (CGRect)_imageViewFrame;
- (CGRect)_nameLabelFrame;
- (CGRect)_descriptionLabelFrame;
- (CGRect)_prepTimeLabelFrame;
- (CGRect)_clientLabelFrame;
@end




#pragma mark -
#pragma mark MicroMessageCell implementation


@implementation MicroMessageCell

@synthesize messageInfo, imageView, nameLabel, messageLabel, prepTimeLabel, clientLabel;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
		
        nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [nameLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
        [nameLabel setTextColor:[UIColor blackColor]];
        [nameLabel setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:nameLabel];
				
        messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [messageLabel setFont:[UIFont systemFontOfSize:12.0]];
        [messageLabel setTextColor:[UIColor blackColor]];
        [messageLabel setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:messageLabel];

		prepTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		prepTimeLabel.textAlignment = UITextAlignmentRight;
		[prepTimeLabel setFont:[UIFont systemFontOfSize:10.0]];
		[prepTimeLabel setTextColor:[UIColor darkGrayColor]];
		[prepTimeLabel setHighlightedTextColor:[UIColor whiteColor]];
		prepTimeLabel.minimumFontSize = 6.0;
		prepTimeLabel.lineBreakMode = UILineBreakModeTailTruncation;
		prepTimeLabel.textAlignment = UITextAlignmentLeft;
		[self.contentView addSubview:prepTimeLabel];

		clientLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		clientLabel.textAlignment = UITextAlignmentRight;
		[clientLabel setFont:[UIFont systemFontOfSize:10.0]];
		[clientLabel setTextColor:[UIColor darkGrayColor]];
		[clientLabel setHighlightedTextColor:[UIColor whiteColor]];
		clientLabel.minimumFontSize = 6.0;
		clientLabel.textAlignment = UITextAlignmentLeft;
		clientLabel.lineBreakMode = UILineBreakModeTailTruncation;
		[self.contentView addSubview:clientLabel];
    }
	
    return self;
}


#pragma mark -
#pragma mark Laying out subviews

/*
 To save space, the prep time label disappears during editing.
 */
- (void)layoutSubviews {
    [super layoutSubviews];
	
    [imageView setFrame:[self _imageViewFrame]];
    [nameLabel setFrame:[self _nameLabelFrame]];
    [messageLabel setFrame:[self _descriptionLabelFrame]];

	[prepTimeLabel setFrame:[self _prepTimeLabelFrame]];
	if (self.editing) {
		prepTimeLabel.alpha = 0.0;
	} else {
		prepTimeLabel.alpha = 1.0;
	}
	[clientLabel setFrame:[self _clientLabelFrame]];
	
	
	//CGRect rcFrame = [self.contentView frame];
	//[self.contentView setFrame:CGRectMake(rcFrame.origin.x, rcFrame.origin.y, rcFrame.size.width, rcFrame.size.height * 2)];
}

#define IMAGE_MARGIN        5.0
#define IMAGE_SIZE          42.0
#define EDITING_INSET       10.0
#define TEXT_LEFT_MARGIN    8.0
#define TEXT_RIGHT_MARGIN   5.0
#define PREP_TIME_WIDTH     50.0
#define CLIENT_WIDTH        80.0

/*
 Return the frame of the various subviews -- these are dependent on the editing state of the cell.
 */
- (CGRect)_imageViewFrame {
    if (self.editing) {
        return CGRectMake(EDITING_INSET + IMAGE_MARGIN, IMAGE_MARGIN, IMAGE_SIZE, IMAGE_SIZE);
    }
	else {
        return CGRectMake(IMAGE_MARGIN, IMAGE_MARGIN, IMAGE_SIZE, IMAGE_SIZE);
    }
}

- (CGRect)_nameLabelFrame {
    if (self.editing) {
        return CGRectMake(IMAGE_MARGIN + IMAGE_SIZE + EDITING_INSET + TEXT_LEFT_MARGIN, 4.0, self.contentView.bounds.size.width - IMAGE_SIZE - EDITING_INSET - TEXT_LEFT_MARGIN - IMAGE_MARGIN, 16.0);
    }
	else {
        return CGRectMake(IMAGE_SIZE + TEXT_LEFT_MARGIN + IMAGE_MARGIN, 4.0, self.contentView.bounds.size.width - IMAGE_SIZE - TEXT_RIGHT_MARGIN * 2 - PREP_TIME_WIDTH - IMAGE_MARGIN, 16.0);
    }
}

- (CGRect)_descriptionLabelFrame {
    if (self.editing) {
        return CGRectMake(IMAGE_SIZE + EDITING_INSET + TEXT_LEFT_MARGIN + IMAGE_MARGIN, 22.0, self.contentView.bounds.size.width - IMAGE_SIZE - EDITING_INSET - TEXT_LEFT_MARGIN - IMAGE_MARGIN, 16.0);
    }
	else {
        return CGRectMake(IMAGE_SIZE + TEXT_LEFT_MARGIN + IMAGE_MARGIN, 22.0, self.contentView.bounds.size.width - IMAGE_SIZE - TEXT_LEFT_MARGIN - IMAGE_MARGIN, 16.0);
    }
}

- (CGRect)_prepTimeLabelFrame {
    //CGRect contentViewBounds = self.contentView.bounds;
    //return CGRectMake(contentViewBounds.size.width - PREP_TIME_WIDTH - TEXT_RIGHT_MARGIN, 4.0, PREP_TIME_WIDTH, 16.0);
	return CGRectMake(IMAGE_SIZE + TEXT_LEFT_MARGIN + IMAGE_MARGIN, 42.0, PREP_TIME_WIDTH, 16.0);
}

- (CGRect)_clientLabelFrame {
    //CGRect contentViewBounds = self.contentView.bounds;
	return CGRectMake(IMAGE_SIZE + TEXT_LEFT_MARGIN + PREP_TIME_WIDTH + IMAGE_MARGIN, 42.0, CLIENT_WIDTH, 16.0);	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [messageInfo release];
    [imageView release];
    [nameLabel release];
    [messageLabel release];
    [prepTimeLabel release];
    [super dealloc];
}


- (void)setMessageInfo:(MicroMessageInfo *)newMsgInfo {
    if (newMsgInfo != messageInfo) {
        [messageInfo release];
        messageInfo = [newMsgInfo retain];
	}

	imageView.image = [messageInfo portrait];
	nameLabel.text = [messageInfo name];
	messageLabel.text = [messageInfo message];
	prepTimeLabel.text = [messageInfo date];
	clientLabel.text = [NSString stringWithFormat:@"来自 %@", [messageInfo client]];
}

- (CGFloat)cellHeight {
	return 64;
	//return [[self contentView] frame].size.height;
}

@end
