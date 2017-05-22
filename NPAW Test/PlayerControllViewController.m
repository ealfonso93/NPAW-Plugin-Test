//
//  PlayerControllViewController.m
//  NPAW Test
//
//  Created by Sergio Sanchez Del Rio on 21/5/17.
//  Copyright © 2017 Sergio Sanchez Del Rio. All rights reserved.
//

#import "PlayerControllViewController.h"
#import "Plugin/Plugin.h"

AVPlayer *player;
Plugin *plugin;
@interface PlayerControllViewController ()

@end

@implementation PlayerControllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    plugin = [[Plugin alloc] init];
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    player = [AVPlayer playerWithURL:videoURL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerDidFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:player.currentItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnPlay:(id)sender {
    [player play];
    [plugin addPlay];
}
- (IBAction)btnPause:(id)sender {
    [player pause];
    [plugin addStop];
}

-(void)playerDidFinishPlaying:(NSNotification *) notification {
    [plugin videoFinished];
}

@end
