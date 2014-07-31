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

@end
