//
//  DBMScan.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/25/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMScan.h"
#import "DBMHeader.h"
#import "DBMSlice.h"

@interface DBMScan ()
@property (nonatomic, strong) DBMHeader *header;
@property (nonatomic, copy) NSData *rawData;
@property (nonatomic, strong) NSMutableArray *slices;
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

/*- (NSArray *)slices
{
    // _slices = [DBSlice slicesForScan:self]
    return _slices;
} */

- (void)fill8Slices
{
    DBLog(@"%p", self.rawData);
    const unsigned short *rawDataOffsetPtr = [self.rawData bytes];
    rawDataOffsetPtr += (HEADER_BYTES / 2);
    
    for (NSInteger sliceNumber = 0; sliceNumber < 8; sliceNumber++) {
        DBMSlice *slice = [[DBMSlice alloc] init];
        rawDataOffsetPtr = [slice fillArray:rawDataOffsetPtr];
        [self.slices addObject:slice];
        DBLog(@"Created slice #%zu. \n %@", sliceNumber, slice);
        DBLog(@"Memory Location: %p", self.slices);
    }
    
}

- (void)slicesLogTest
{
    for (NSInteger sliceNumber = 0; sliceNumber < 8; sliceNumber++) {
        DBLog(@"Slice #%zu: %@", sliceNumber, self.slices[sliceNumber]);
        for (NSInteger lineNumber = 0; lineNumber < 120; lineNumber++) {
            DBMSlice *thisSlice = self.slices[sliceNumber];
//            DBLog(@"lineNumber %zu: %zu", lineNumber, thisSlice[lineNumber]);
        }
    }
}

@end
