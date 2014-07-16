//
//  DBMScan.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBMHeader.h"

@interface DBMScan : NSObject

@property (nonatomic, readonly) unsigned int length;
@property (nonatomic) NSData *wholeScan;
@property (nonatomic) DBMHeader *header;

- (void)calculateLength;
- (void)logScanInfo;
- (void)headerMake;

@end
