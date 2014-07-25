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


// My attempt at filling a 2D NSMutableArray with NSNumber objects for each sample

- (unsigned short *)populateLinesArray:(unsigned short *)shortPtr {
    
    // NSMutableArray *_linesArray = [[NSMutableArray alloc] init];
    
    if (self.lines == 0 || self.points == 0) {
        NSLog(@"ENCOUNTERED AN ERROR: attempting to populate the lines array but one or more variables are zero");
        return shortPtr;
    }
    
    for (int i = 0; i < self.lines; i++) {
        NSMutableArray *pointsArray = [[NSMutableArray alloc] init];
        [self.linesArray addObject:pointsArray];
        for (int j = 0; j < self.points; j++) {
            unsigned short tempNum = *shortPtr++;
            NSNumber *num = [NSNumber numberWithUnsignedShort:tempNum];
            [pointsArray addObject:num];
        }
    }
    
    return shortPtr;
    
}


// Currently a random sample, printed at every line just to text if there is data in the arrays

- (void)logTest {
    for (int n = 0; n < self.lines; n++) {
        NSLog(@"%@", self.linesArray[n][300]);
    }
}


@end
