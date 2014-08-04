//
//  DBMScan.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/25/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DBMHeader;
@class DBMSlice;

#define HEADER_BYTES    32

@interface DBMScan : NSObject

@property (nonatomic, strong, readonly) DBMHeader *header;
@property (nonatomic, copy, readonly) NSData *rawData;
@property (nonatomic, strong, readonly) NSArray *slices;

+ (DBMScan *)scanWithData:(NSData *)data;
- (void)createAndFill8Slices;
// - (void)fill8Slices;
- (void)slicesLogTest;

@end
