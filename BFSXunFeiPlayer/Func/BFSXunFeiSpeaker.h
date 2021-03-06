//
//  BFSXunFeiSpeaker.h
//  BFSXunFeiPlayer
//
//  Created by 刘玲 on 2018/12/22.
//  Copyright © 2018年 GKD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFSXunFeiSpeaker : NSObject

+ (BOOL)registeredXunFeiSpeaker;
+ (instancetype)shareInstance;
- (void)destoryInstance;
- (void)startSpeak:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
