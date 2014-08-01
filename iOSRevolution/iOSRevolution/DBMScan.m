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
    //DBLog(@"%@", self.rawData);
    DBLog(@"%p", self.rawData);
    const unsigned short *shortPtr = [self.rawData bytes];
    shortPtr += (HEADER_BYTES / 2);
    
    for (int i = 0; i < 8; i++) {
        DBMSlice *slice = [[DBMSlice alloc] init];
        shortPtr = [slice fillArray:shortPtr];
        [self.slices addObject:slice];
        DBLog(@"Created slice #%u. \n %@", i, slice);
        DBLog(@"Fred: %p", self.slices);
    }
    
}

- (void)slicesLogTest
{
    for (int s = 0; s < 8; s++) {
        for (int l = 0; l < 120; l++) {
            DBLog(@"Slice #%u: %@", s, self.slices[l]);
        }
    }
}

@end
