//
//  ViewController.h
//  Random Color Frenzy
//
//  Created by iOS Developer on 2013. 11. 18..
//  Copyright (c) 2013년 iOS Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) AVAudioPlayer *player;

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *achievementlabel;
@property (weak, nonatomic) IBOutlet UISlider *slidervalue;


@property int count;
@property double red, green, blue, alpha;
@property int achievement;
@property NSString* countstring;




- (IBAction) click1;
- (IBAction) panic;
- (IBAction) select:(id)sender;
- (IBAction) slider;
- (IBAction) play;
- (IBAction) stop;


@end

