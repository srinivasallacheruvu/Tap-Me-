//
//  HelloWorldViewController.h
//  Tap Me
//
//  Created by Karthik on 09/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HelloWorldViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
    
    
}
// @property (strong,nonatomic) NSInteger count;
@property(retain,nonatomic) UILabel *scoreLabel;

@property(retain,nonatomic) UILabel *timerLabel;

-(IBAction)buttonPressed;

@end
