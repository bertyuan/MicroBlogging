//
//  MicroMessageInfo.h
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MicroMessageInfo : NSObject {
	NSString* name;
	UIImage* portrait;
	NSString* client;
	NSString* date;
	NSString* message;
	
	NSString* portraitStr;
}

@property(nonatomic, readonly) NSString* name;
@property(nonatomic, readonly) UIImage* portrait;
@property(nonatomic, readonly) NSString* client;
@property(nonatomic, readonly) NSString* date;
@property(nonatomic, readonly) NSString* message;

- (id)initWithName:(NSString*)_name portrait:(NSString*)_portraitStr client:(NSString*)_client date:(NSString*)_date message:(NSString*)_message;

@end
