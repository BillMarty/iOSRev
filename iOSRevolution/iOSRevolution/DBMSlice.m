//
//  DBMSlice.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMSlice.h"

@implementation DBMSlice

- (instancetype)initWithLines:(unsigned short)lines Points:(unsigned short)points Walls:(unsigned short)walls {
    
    self = [super init];
    
    if (self) {
        self.lines = lines;
        self.points = points;
        self.walls = walls;
    }
    
    return self;
    
}

- (void)populateVariablesWithLines:(unsigned short)lines Points:(unsigned short)points Walls:(unsigned short)walls {
    
    self.lines = lines;
    self.points = points;
    self.walls = walls;
    
}

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

- (void)logTest {
    for (int n = 0; n < self.lines; n++) {
        NSLog(@"%@", self.linesArray[n][300]);
    }
}


@end
