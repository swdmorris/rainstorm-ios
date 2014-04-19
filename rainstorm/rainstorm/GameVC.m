//
//  GameVC.m
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Lakeview Labs. All rights reserved.
//

#import "GameVC.h"

@interface GameVC ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImageView;
@property (weak, nonatomic) IBOutlet UIImageView *paddleImageView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation GameVC

@synthesize ballImageView, paddleImageView, startButton, timer;

float TIMER_INTERVAL = 0.01f;
float INITIAL_VELOCITY = 1.0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark- Game Logic

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:NO];
}

- (void)timerFired
{
    NSLog(@"TIMER FIRED");
    
    
    
    
    [self startTimer];
}

#pragma mark- Actions

- (IBAction)startButtonPressed
{
    [self startTimer];
    [self.startButton setHidden:YES];
}

#pragma mark- End of life cycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
