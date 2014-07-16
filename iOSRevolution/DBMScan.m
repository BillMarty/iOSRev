//
//  DBMScan.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMScan.h"

@implementation DBMScan

- (void)calculateFilepath:(NSString *)file {
    _filepath = [[NSBundle mainBundle] pathForResource:file ofType:nil];
}

- (void)grabWholeScan {
    _wholeScan = [NSData dataWithContentsOfFile:_filepath];
}

- (void)calculateLength {
    _length = _wholeScan.length;
}

- (void)logScanInfo {
    NSLog(@"Scan data from the filepath: %@ \n Scan length: %zd", _filepath, _length);
}

@end
