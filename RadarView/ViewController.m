//
//  ViewController.m
//  RadarView
//
//  Created by Kshitiz Ghimire on 11/20/14.
//  Copyright (c) 2014 Javra Software. All rights reserved.
//

#import "ViewController.h"

#define RGB(r, g, b) [UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : 1.0]
@interface ViewController ()

@property (nonatomic, strong) UIImageView *hand;

- (void) createCircle;
- (void)createHand;
- (void)start;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createCircle];
    [self createHand];
    [self start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createCircle {
    float radius[] = {150, 100, 50};
    for (int i=0; i<3; i++) {
        float size = radius[i] * 2.0;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
        if (i==0) {
            line.backgroundColor = RGB(188, 226, 248);
            line.layer.borderColor = RGB(188, 226, 248).CGColor;
        } else if (i==1) {
            line.backgroundColor = RGB(158, 219, 247);
            line.layer.borderColor = RGB(158, 219, 247).CGColor;
        } else {
            line.backgroundColor = RGB(116, 206, 246);
            line.layer.borderColor = RGB(116, 206, 246).CGColor;
        }
        
        line.layer.borderWidth = 2;
        line.center = CGPointMake(160, 220);
        line.layer.cornerRadius = radius[i];
        [self.view addSubview:line];
    }


}
- (void)createHand {
    self.hand = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 8)];
    self.hand.image = [UIImage imageNamed:@"line.png" ];
    [self.view addSubview:self.hand];
    self.hand.layer.anchorPoint = CGPointMake(0, 0.5);
    self.hand.layer.position = CGPointMake(160, 220);
}
- (void)start
{
    [NSTimer scheduledTimerWithTimeInterval:1.5/60.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

- (void)tick:(NSTimer*)sender
{
    self.hand.transform = CGAffineTransformRotate(self.hand.transform, M_PI * 0.01);
    
}

@end
