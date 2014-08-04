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

- (void)createAndFill8Slices
{
    NSMutableArray *tempSliceArray = [[NSMutableArray alloc] init];
    for (NSInteger sliceCount = 0; sliceCount < 8; sliceCount++) {
        DBMSlice *slice = [[DBMSlice alloc] initWithLines:self.header.bmodeScanlines points:self.header.amodeBytes walls:self.header.includedWalls];
        [slice fillSliceNumber:sliceCount fromData:self.rawData];
        [tempSliceArray addObject:slice];
    }
    self.slices = tempSliceArray;
}

@end
