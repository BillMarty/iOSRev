//
//  DBMScan.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMScan : NSObject

@property (nonatomic, readonly) unsigned int length;
@property (nonatomic, readonly) NSString *filepath;
@property (nonatomic, copy) NSData *wholeScan;

- (void)calculateFilepath:(NSString *)file;
- (void)grabWholeScan;
- (void)calculateLength;
- (void)logScanInfo;

@end
