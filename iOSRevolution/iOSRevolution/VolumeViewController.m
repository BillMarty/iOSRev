//
//  VolumeViewController.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "VolumeViewController.h"
#import "DBMHeader.h"
#import "DBMMediator.h"
#import "DBMScan.h"

@interface VolumeViewController ()

@end

@implementation VolumeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DBMMediator *mediator = [[DBMMediator alloc] init];
    [mediator putItAllTogether];
    [mediator.scan calculateLength];
    [mediator.scan logScanInfo];
    [mediator.scan headerMake];
    self.volume3DVVC = mediator.scan.header.volume3D;
    
    NSString *testText = [NSString stringWithFormat:@"%huml", _volume3DVVC];
    self.volumeNumDisplay.text = testText;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
