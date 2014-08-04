//
//  DBMSlice.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMSlice.h"

@implementation DBMSlice


// an alternative init method that fills the important non-array instance variables and mallocs space for the data

- (instancetype)initWithLines:(uint16_t)lines points:(uint16_t)points walls:(uint16_t)walls {
    
    self = [super init];
    
    if (self) {
        _lines = lines;
        _points = points;
        _walls = walls;
        _linesPointsArray = malloc(2*lines*points*sizeof(uint16_t));
    }
    
    return self;
    
}

- (void)dealloc
{
    free(_linesPointsArray);
}

- (void)fillSliceNumber:(NSInteger)sliceNum fromData:(NSData*)wholeScan
{
    NSRange range;
    // location and length are in bytes, and our samples are in 2 byte chunks, hence the *2s
    range.location = (32 + 2*(self.lines * self.points) * sliceNum);
    range.length = 2*(self.lines * self.points);
    
    [wholeScan getBytes:self.linesPointsArray range:range];
}

- (uint16_t)sampleForLine:(uint16_t)line point:(uint16_t)point
{
    return self.linesPointsArray[((self.points * line) + point)];
}


@end
