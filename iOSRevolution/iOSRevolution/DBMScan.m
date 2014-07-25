//
//  DBMScan.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/25/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMScan.h"
#import "DBMHeader.h"

@interface DBMScan ()
@property (nonatomic, strong) DBMHeader *header;
@property (nonatomic, copy) NSData *rawData;
@property (nonatomic, strong) NSArray *slices;
@end


@implementation DBMScan

+ (DBMScan *)scanWithData:(NSData *)data
{
    DBMScan *result;
    result = [[DBMScan alloc] init];
    result.rawData = data;
    return result;
}

- (DBMHeader *)header
{
    // this is the "lazy getter" pattern
    if (!_header) {
        _header = [DBMHeader headerFromScan:self];
    }
    return _header;
}

- (NSArray *)slices
{
    // _slices = [DBSlice slicesForScan:self]
    return _slices;
}
@end
