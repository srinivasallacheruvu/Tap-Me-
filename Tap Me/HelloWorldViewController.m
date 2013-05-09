//
//  HelloWorldViewController.m
//  Tap Me
//
//  Created by Karthik on 09/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController

@synthesize scoreLabel,timerLabel;

-(IBAction)buttonPressed{
    NSLog(@"buttonpressed!");
    count++;
    scoreLabel.text=[NSString stringWithFormat:@"score\n %i",count];
   // count++;
    // scoreLabel.text=@"%i",count;
    [buttonBeep play];
}

-(void)setupGame{
    seconds=30;
    count=0;
    timerLabel.text=[NSString stringWithFormat:@"Time:%i",seconds];
    scoreLabel.text=[NSString stringWithFormat:@"Score\n:%i",count];
    timer=[NSTimer scheduledTimerWithTimeInterval:1.0f
                                           target:self
                                         selector:@selector(subtractTime)
                                         userInfo:nil
                                          repeats:YES];
    [backgroundMusic setVolume:0.5];
    [backgroundMusic play];
}

-(void)subtractTime{
    seconds--;
    timerLabel.text=[NSString stringWithFormat:@"Time: %i",seconds];
    if (seconds==0) {
        [timer invalidate];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"time up"
                                            message:[NSString stringWithFormat:@"you scored %i points",count]
                                                    delegate:self
                                           cancelButtonTitle:@"Play Again"
                                           otherButtonTitles:nil];
        [alert show];
        [secondBeep play];
    }
    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setupGame];
    
    
}
-(AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *) file type:(NSString *)type{
    NSString *path=[[NSBundle mainBundle]pathForResource:file ofType:type];
    
    NSURL *url=[NSURL fileURLWithPath:path];
    NSError *error;
    
    AVAudioPlayer *audioplayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url  error:&error];
    if (!audioplayer) {
        NSLog(@"%@",[error description]);
    }
    return audioplayer;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupGame];
    buttonBeep=[self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep=[self setupAudioPlayerWithFile:@"secondBeep" type:@"wav"];
    backgroundMusic=[self setupAudioPlayerWithFile:@"HallofTheMountainKing" type:@"mp3"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
