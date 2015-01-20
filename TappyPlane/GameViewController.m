//
//  GameViewController.m
//  TappyPlane
//
//  Created by TLR on 1/20/15.
//  Copyright (c) 2015 TLR. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

// Creating this so that the width and height of the scene are correct
-  (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    // Configure the view.
        SKView * skView = (SKView *)self.view;
        if (!skView.scene) {
            skView.showsFPS = YES;
            skView.showsNodeCount = YES;
            skView.showsDrawCount = YES;
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = NO;
            
            
            // Create and configure the scene.
            GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
            scene.scaleMode = SKSceneScaleModeAspectFill;
            
            // Swapping the heigth and width
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            float landscapeWidth = screenRect.size.height;
            float landscapeHeight = screenRect.size.width;
            
            // Present the scene.
            [skView presentScene:scene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
