//
//  DBMScan.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMScan.h"

@implementation DBMScan

- (void)calculateLength {
    NSLog(@"Starting calculateLength");
    
    _length = _wholeScan.length;
    
    NSLog(@"Finished calculateLength");
}

- (void)logScanInfo {
    NSLog(@"Starting logScanInfo");
    
    NSLog(@"Scan length: %zd", _length);
    // NSLog(@"%@", _wholeScan);
    
    NSLog(@"Finished logScanInfo");
}

- (void)headerMake {
    NSLog(@"Starting headerMake");
    
    _header = [[DBMHeader alloc] init];
    
    [_header firstFour:_wholeScan];
    [_header dimensionsFour:_wholeScan];
    [_header resolutionFive:_wholeScan];
    [_header schemeAndWallsTwo:_wholeScan];
    [_header volumeOne:_wholeScan];
    [_header rsrvd2:_wholeScan];
    [_header n:_wholeScan];
    // [_header logHeader];
    
    NSLog(@"Finished headerMake");
}

@end
