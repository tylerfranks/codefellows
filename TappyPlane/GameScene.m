//
//  GameScene.m
//  TappyPlane
//
//  Created by TLR on 1/20/15.
//  Copyright (c) 2015 TLR. All rights reserved.
//

#import "GameScene.h"
#import "TPPlane.h"

@interface GameScene ()

@property (nonatomic) TPPlane *player;
@property (nonatomic) SKNode *world;

@end

@implementation GameScene


-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    // Leaving this here as an example of how to correctly print out the screen size.
    NSLog(@"Size: %@", NSStringFromCGSize(self.size));

    
    // Setup world
    _world = [SKNode node];
    [self addChild:_world];
    
    // Setup player
    _player = [[TPPlane alloc] init];
    _player.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
    [_world addChild:_player];

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
   
    
    
   
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
