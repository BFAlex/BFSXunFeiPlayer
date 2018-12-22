//
//  BFSXunFeiSpeaker.m
//  BFSXunFeiPlayer
//
//  Created by 刘玲 on 2018/12/22.
//  Copyright © 2018年 GKD. All rights reserved.
//

#import "BFSXunFeiSpeaker.h"
#import <iflyMSC/iflyMSC.h>


#define kXunFeiAppID   @"5c1dee40"

@interface BFSXunFeiSpeaker () <IFlySpeechSynthesizerDelegate>
@property (nonatomic, strong) IFlySpeechSynthesizer *speaker;

@end

@implementation BFSXunFeiSpeaker

static BFSXunFeiSpeaker *bfSpeaker;
static dispatch_once_t onceToken;

+ (BOOL)registeredXunFeiSpeaker {
    
    NSString *pAppId = [NSString stringWithFormat:@"appid=%@", kXunFeiAppID];
    [IFlySpeechUtility createUtility:pAppId];
    
    return true;
}

+ (instancetype)shareInstance {
    
    NSLog(@"111onceToken:%ld", onceToken);
    dispatch_once(&onceToken, ^{
        bfSpeaker = [[BFSXunFeiSpeaker alloc] init];
        NSLog(@"222onceToken:%ld", onceToken);
        if (bfSpeaker) {
            [bfSpeaker initDefaultConfiguratin];
        }
    });
    
    return bfSpeaker;
}

- (void)initDefaultConfiguratin {
    
    self.speaker = [IFlySpeechSynthesizer sharedInstance];
    self.speaker.delegate = self;
    
    // 设置合成方式
    [self.speaker setParameter:[IFlySpeechConstant TYPE_CLOUD] forKey:[IFlySpeechConstant ENGINE_TYPE]];
    [self.speaker setParameter:@"50" forKey:[IFlySpeechConstant VOLUME]];
    [self.speaker setParameter:@"xiaoyan" forKey:[IFlySpeechConstant VOICE_NAME]];
    [self.speaker setParameter:@"common.pcm" forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
    
}

- (void)destoryInstance {
    
    bfSpeaker = nil;
    onceToken = 0;
}

- (void)startSpeak:(NSString *)text {
    
    [self.speaker startSpeaking:text];
}

#pragma mark - IFlySpeechSynthesizerDelegate

- (void)onCompleted:(IFlySpeechError *)error {
    NSLog(@"合成完成");
}

@end
