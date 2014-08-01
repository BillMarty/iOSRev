//
//  DBMSlice.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMSlice.h"

@implementation DBMSlice


// Attempting to make an alternative init method that filled the important non-array instance variables

- (instancetype)initWithLines:(uint16_t)lines points:(uint16_t)points walls:(uint16_t)walls {
    
    self = [super init];
    
    if (self) {
        _lines = lines;
        _points = points;
        _walls = walls;
        _linesPointsArray = malloc(lines*points*sizeof(uint16_t));
        [self fillSliceArrayWith:7];
    }
    
    return self;
    
}

- (void)dealloc
{
    free(_linesPointsArray);
}

// Alternative to the above init method, just simple variable filling

- (void)populateVariablesWithLines:(uint16_t)lines points:(uint16_t)points walls:(uint16_t)walls {
    
    self.lines = lines;
    self.points = points;
    self.walls = walls;
    
}

// Filling the array with the short pointer method
- (void)fillSliceArrayWith:(uint16_t)fillValue
{
    // fill the array with fillValue
    uint16_t *arrayPointer = _linesPointsArray;
    for (NSInteger line = 0; line < self.lines; line++) {
        for (NSInteger point = 0; point < self.points; point++) {
            *arrayPointer++ = fillValue;
        }
    }
}

- (const uint16_t *)fillArray:(const uint16_t *)rawDataOffsetPtr {
    for (int i = 0; i < LINES_ARRAY_SIZE; i++) {
        for (int j = 0; j < POINTS_ARRAY_SIZE; j++) {
//            _linesPointsArray[i][j] = *rawDataOffsetPtr++;
        }
    }
    return rawDataOffsetPtr;
}

- (void)logTest
{
    for (int i = 0; i < 120; i++) {
//        NSLog(@"%hu", linesPointsArray[i][601]);
    }
}


@end
