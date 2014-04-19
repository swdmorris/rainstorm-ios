//
//  GameVC.m
//  rainstorm
//
//  Created by Spencer Morris on 4/19/14.
//  Copyright (c) 2014 Lakeview Labs. All rights reserved.
//

#import "GameVC.h"
#import "Ball.h"
#import "Drop.h"
#import "Droplet.h"

@interface GameVC ()
@property (weak, nonatomic) IBOutlet Ball *ball;
@property (weak, nonatomic) IBOutlet UIImageView *paddleImageView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) NSMutableArray *drops;
@property (strong, nonatomic) NSMutableArray *droplets;

@end

@implementation GameVC

@synthesize ball, paddleImageView, startButton, timer, droplets, drops;

float TIMER_INTERVAL = 0.01f;
float INITIAL_VELOCITY = 1.0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self populateDrops];
    self.ball.layer.cornerRadius = self.ball.frame.size.width / 2;
}

- (void)populateDrops
{
    self.drops = [[NSMutableArray alloc] init];
    self.droplets = [[NSMutableArray alloc] init];
    int rows = 5, columns = 20, paddingX = 30, paddingY = 5, heightOfRows = 50;
    for (int i = 0; i < columns; i++) {
        for (int j = 0; j < rows; j++) {
            Drop *drop = [[Drop alloc] initWithFrame:CGRectMake(paddingX + ((self.view.frame.size.width - 2 * paddingX) / (float) columns) * (float) i, paddingY + (heightOfRows / (float) rows) * (float) j, 12, 15)];
            [self.drops addObject:drop];
            [self.view addSubview:drop];
        }
    }
}

#pragma mark- Game Logic

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:NO];
}

- (void)timerFired
{
    [self moveBall];
    [self moveDroplets];
    [self checkForNewDroplets];
    
    if (! [self isGameOver])
        [self startTimer];
}

- (void)moveBall
{
    [self.ball setCenter:CGPointMake(self.ball.center.x + self.ball.direction.x * self.ball.speed, self.ball.center.y + self.ball.direction.y * self.ball.speed)];
    
    // check within x bounds
    if (self.ball.center.x > self.view.frame.size.width)
        self.ball.direction = CGPointMake(-abs(self.ball.direction.x), self.ball.direction.y);
    else if (self.ball.center.x < 0)
        self.ball.direction = CGPointMake(abs(self.ball.direction.x), self.ball.direction.y);
    // check within y bounds
    if (self.ball.center.y < 0)
        self.ball.direction = CGPointMake(self.ball.direction.x, abs(self.ball.direction.y));
}

- (void)moveDroplets
{
    for (Droplet *droplet in self.droplets) {
        [droplet setCenter:CGPointMake(droplet.direction.x * droplet.speed, droplet.direction.y * droplet.speed)];
        
        if (droplet.center.x < 0
            || droplet.center.x > self.view.frame.size.width
            || droplet.center.y > self.view.frame.size.height) {
            [droplet removeFromSuperview];
            [self.droplets removeObject:droplet];
            NSLog(@"DROPLET DONE");
        }
    }
}

- (void)checkForNewDroplets
{
    NSMutableArray *dropsToRemove = [[NSMutableArray alloc] init];
    for (Drop *drop in self.drops) {
        CGFloat xDist = (drop.center.x - self.ball.center.x);
        CGFloat yDist = (drop.center.y - self.ball.center.y);
        CGFloat distanceSq = (xDist * xDist) + (yDist * yDist);
        if (distanceSq < self.ball.frame.size.width * 2) {
            Droplet *droplet = [[Droplet alloc] init];
            droplet.center = drop.center;
            [self.view addSubview:droplet];
            [self.droplets addObject:droplet];
            [dropsToRemove addObject:drop];
        }
    }
    
    for (Drop *drop in dropsToRemove) {
        [drop removeFromSuperview];
        [self.drops removeObject:drop];
    }
}

- (BOOL)isGameOver
{
    return self.ball.center.y >= self.view.frame.size.height
        || (self.drops.count == 0 && self.droplets.count == 0);
}

#pragma mark- Actions

- (IBAction)startButtonPressed
{
    self.ball.speed = INITIAL_VELOCITY;
    self.ball.direction = CGPointMake(1.0, -1.5);
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
