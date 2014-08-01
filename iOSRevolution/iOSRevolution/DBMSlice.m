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

- (instancetype)initWithLines:(unsigned short)lines Points:(unsigned short)points Walls:(unsigned short)walls {
    
    self = [super init];
    
    if (self) {
        self.lines = lines;
        self.points = points;
        self.walls = walls;
    }
    
    return self;
    
}


// Alternative to the above init method, just simple variable filling

- (void)populateVariablesWithLines:(unsigned short)lines Points:(unsigned short)points Walls:(unsigned short)walls {
    
    self.lines = lines;
    self.points = points;
    self.walls = walls;
    
}

// Filling the array with the short pointer method

- (unsigned short *)fillArray:(const unsigned short *)shortPtr {
    for (int i = 0; i < LINES_ARRAY_SIZE; i++) {
        for (int j = 0; j < POINTS_ARRAY_SIZE; j++) {
            linesPointsArray[i][j] = *shortPtr++;
        }
    }
    return shortPtr;
}

- (void)logTest
{
    for (int i = 0; i < 120; i++) {
        NSLog(@"%hu", linesPointsArray[i][601]);
    }
}


@end
