//
//  ViewController.m
//  Random Color Frenzy
//
//  Created by iOS Developer on 2013. 11. 18..
//  Copyright (c) 2013년 iOS Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//쉬운 길이기에 아직 쓰면 안되는 거였지만 어쨌든 @synthesize. 정확한 개념은 아직 모름
//이젠 필요 없다는 말도 있고, 혼란스럽다.
//근데 안 쓰면 확실히 뭔가 달라지는 거 같다.
//잠깐 근데 이거 액션에는 원래 안 써도 되네? 이해안감.

@synthesize player;

@synthesize display;
@synthesize achievementlabel;
@synthesize slidervalue;
@synthesize count;
@synthesize red, green, blue, alpha;
@synthesize achievement;
@synthesize countstring;
@synthesize songnum;
@synthesize songname;


-(IBAction)click1
{
    //랜덤 색 생성
    red=(double)arc4random()/4264967296;
    green=(double)arc4random()/4264967296;
    blue=(double)arc4random()/4264967296;
    
    //카운트 변수가 늘어나고, 이걸 스트링에 넣음. 숫자를 그대로 display.text에 넣을 수 있는지는 아직 모르겠다.
    count+=1;
    countstring=[NSString stringWithFormat:@"%i", count];
    
    //누른 횟수를 표기해주고, 문자 색은 반대색으로(보색이 맞는지 모르겠다), 배경색은 랜덤으로 지정한다.
    display.text = countstring;
    display.textColor=[UIColor colorWithRed:1-red green:1-green blue:1-blue alpha:1];
    achievementlabel.textColor=[UIColor colorWithRed:1-red green:1-green blue:1-blue alpha:1];
    self.view.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:alpha];
 
    /*
    //원시적인 업적 스위치
    if(achievement==0)
        return;
    이해할 수 없는 에러
     */
    //다소 원시적인 방식의 메시지 표기
    
    if(achievement==0)
        return;
    
        
    if(count==10)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement: Loser" message:@"Study instead of pushing buttons" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Nope", nil];
        alert.tag=0;
        [alert show];
    }
    
    if(count==50)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement: Stanley" message:@"We deny responsibility for the consequences after 100" delegate:nil cancelButtonTitle:@"I Agree" otherButtonTitles: nil];
        alert.tag=0;
        [alert show];
        
    }
    
    if(count==99)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Last Warning" message:@"DO NOT PRESS AGAIN" delegate:nil cancelButtonTitle:@"I understand" otherButtonTitles: nil];
        alert.tag=0;
        [alert show];
        
    }
    
    
    if(count==100)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"We warned you" message:@"This will continue forever and ever and ever" delegate:self cancelButtonTitle:@"I'm sorry" otherButtonTitles:@"I'm sorry", nil];
        alert.tag=1;
        [alert show];
    }
    
    
}

//exit(0)은 사용하면 안되지만 심심해서 패닉버튼 삽입

- (IBAction)panic
{
    exit(0);
}

//업적 켜고 끄기

- (IBAction)select:(id)sender
{
    if(achievement==0)
        achievement=1;
    else
        achievement=0;
    
}

//work in progress: slider가 움직일 때 백그라운드 알파가 변해야 함. 아직 알파만 변하게 할 줄 모름.
//edit: done. slider 움직이면 백그라운드 알파만 변함.

- (IBAction)slider
{
    
    alpha=slidervalue.value;
    self.view.backgroundColor = [UIColor  colorWithRed:red green:green blue:blue alpha:alpha];

}

//또 뻘짓. 음악 재생/멈추기

- (IBAction)play
{
    [player play];
}

- (IBAction)stop
{
    [player stop];
}


//잠자기 전 새벽 6시에 10분만에 만든거라 매우 야매성이 강할 다음 곡 넘기기 로직
- (IBAction)next
{
    if(songnum<3)
        songnum++;
    else
        songnum=1;
    
    if(songnum==1)
    {
        songname=@"Nocturne";
    }
    else if(songnum==2)
    {
        songname=@"Amelie";
    }
    else
    {
        songname=@"Inception";
    }
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:songname ofType:@"mp3"]];
    
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.numberOfLoops = -1;
    
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",[error description]);
    }
    else
    {
        [player play];
    }
}


//alert delegate 정의

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==0)
    {
        if (buttonIndex==0)
        {
            //User complied, insert termination code here?
            //exit(0);
            //edit: at this time I do not know if this will keep allocated memory from being returned. Also, Apple very strongly discourages this.
        }
        else
        {
            //User didn't comply
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement: Rebel" message:@"This will continue until you give in" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Fuck you", nil];
            alert.tag=0;
            [alert show];
        }
    }
    else
    {
        if (buttonIndex==0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"We warned you" message:@"This will continue forever and ever and ever" delegate:self cancelButtonTitle:@"I'm sorry" otherButtonTitles:@"I'm sorry", nil];
            alert.tag=1;
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"We warned you" message:@"This will continue forever and ever and ever" delegate:self cancelButtonTitle:@"I'm sorry" otherButtonTitles:@"I'm sorry", nil];
            alert.tag=1;
            [alert show];
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //count, achievement 초기설정
    count=0;
    achievement=1;
    red=1, green=1, blue=1, alpha=1;
    songnum=1;
    
    //AVAudioPlayer *player; 배경음악 재생
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Nocturne" ofType:@"mp3"]];
    
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.numberOfLoops = -1;
    
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",[error description]);
    }
    else
    {
        [player play];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
