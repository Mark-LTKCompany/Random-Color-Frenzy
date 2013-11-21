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

@synthesize display;
@synthesize achievementlabel;
@synthesize slidervalue;
@synthesize count;
@synthesize red, green, blue;
@synthesize achievement;
@synthesize countstring;

-(IBAction)click1
{
    //랜덤 색 생성
    red=(double)arc4random()/4264967296;
    green=(double)arc4random()/4264967296;
    blue=(double)arc4random()/4264967296;
    
    //카운트 변수가 늘어나고, 이걸 스트링에 넣음. 숫자를 그대로 display.text에 넣을 수 있는지는 아직 모르겠다.
    count+=2;
    countstring=[NSString stringWithFormat:@"%i", count];
    
    //누른 횟수를 표기해주고, 문자 색은 반대색으로(보색이 맞는지 모르겠다), 배경색은 랜덤으로 지정한다.
    display.text = countstring;
    display.textColor=[UIColor colorWithRed:1-red green:1-green blue:1-blue alpha:1];
    achievementlabel.textColor=[UIColor colorWithRed:1-red green:1-green blue:1-blue alpha:1];
    self.view.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:1];
 
    /*
    //원시적인 업적 스위치
    if(achievement==0)
        return;
    이해할 수 없는 에러
     */
    //다소 원시적인 방식의 메시지 표기
    
    if(achievement==0)
        return;
    
        
    if(count==10){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"업적:잉여" message:@"버튼 10번 누를 시간에 공부를" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"계속할래", nil];
        [alert show];
    }
    
    if(count==50){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"업적:청개구리" message:@"100번을 넘으면 발생하는 일에 대해 책임지지 않습니다" delegate:nil cancelButtonTitle:@"동의합니다" otherButtonTitles: nil];
        [alert show];
        
    }
    
    if(count==99){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"업적:청개구리" message:@"다시는 누르지 마십시오" delegate:nil cancelButtonTitle:@"동의합니다" otherButtonTitles: nil];
        [alert show];
        
    }
    
    
    if(count==100){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"셧다운제" message:@"순간의 상황변화를 받아들이지 못한 당신은 폰을 던집니다" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        [alert show];
        
    }
    
    
}

//exit(0)은 사용하면 안되지만 심심해서 패닉버튼 삽입

- (IBAction)panic {
    exit(0);
}

//업적 켜고 끄기

- (IBAction)select:(id)sender {
    if(achievement==0)
        achievement=1;
    else
        achievement=0;
    
}
//work in progress: slider가 움직일 때 백그라운드 알파가 변해야 함. 아직 알파만 변하게 할 줄 모름.

- (IBAction)slider {

    self.view.backgroundColor = [UIColor  colorWithRed:red green:green blue:blue alpha:slidervalue.value];

}



//alert delegate 정의

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0)
    {
        //User complied, insert termination code here?
        //exit(0);
        //edit: at this time I do not know if this will keep allocated memory from being returned. Also, Apple very strongly discourages this.
    }
    else
    {
        //User didn't comply
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"업적:레지스탕스" message:@"순응할때까지 계속됩니다" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"계속할래", nil];
        [alert show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //count, achievement 초기설정
    count=0;
    achievement=1;
    red=1, green=1, blue=1;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
