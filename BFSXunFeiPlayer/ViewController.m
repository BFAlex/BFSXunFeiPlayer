//
//  ViewController.m
//  BFSXunFeiPlayer
//
//  Created by 刘玲 on 2018/12/22.
//  Copyright © 2018年 GKD. All rights reserved.
//

#import "ViewController.h"
#import "BFSXunFeiSpeaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testSpeaker];
    
    
    [NSTimer scheduledTimerWithTimeInterval:5.f repeats:NO block:^(NSTimer * _Nonnull timer) {
        [[BFSXunFeiSpeaker shareInstance] destoryInstance];
        [self testSpeaker];
    }];
}

- (void)testSpeaker {
    
    [BFSXunFeiSpeaker registeredXunFeiSpeaker];
    [[BFSXunFeiSpeaker shareInstance] startSpeak:@"你好吗,贝贝"];
}


@end
