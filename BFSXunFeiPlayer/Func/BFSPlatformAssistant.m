//
//  BFSPlatformAssistant.m
//  BFSXunFeiPlayer
//
//  Created by 刘玲 on 2018/12/22.
//  Copyright © 2018年 GKD. All rights reserved.
//

#import "BFSPlatformAssistant.h"
#import "BFSXunFeiSpeaker.h"


@implementation BFSPlatformAssistant

+ (instancetype)platformAssistant {
    
    BFSPlatformAssistant *assistant = [[BFSPlatformAssistant alloc] init];
    if (assistant) {
//        [assistant configXunFeiPlatform];
    }
    
    return assistant;
}

- (BOOL)configXunFeiPlatform {
    
    return [BFSXunFeiSpeaker registeredXunFeiSpeaker];
}

@end
