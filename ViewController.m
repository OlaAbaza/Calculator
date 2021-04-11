//
//  ViewController.m
//  Calculator
//
//  Created by ola abaza on 3/24/21.
//  Copyright © 2021 ola abaza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)equalBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displayLable;
- (IBAction)clearBtn:(id)sender;
- (IBAction)addBtn:(id)sender;
- (IBAction)minsBtn:(id)sender;
- (IBAction)divBtn:(id)sender;
- (IBAction)mulBtn:(id)sender;
-(IBAction)numberBtn:(UIButton*)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    operationPressed=false;
    firstNum=NULL;
    secondNum=NULL;
    _displayLable.text=@"0";
    
}

-(IBAction)numberBtn:(UIButton*)sender{
    int tag =sender.tag;
    if(operationPressed==false){
        if(firstNum==NULL)
        {
            firstNum=[NSString stringWithFormat:@"%i",tag];
            _displayLable.text=firstNum;
        }
            else{
                firstNum=[NSString stringWithFormat:@"%@%i",firstNum,tag];
                _displayLable.text=firstNum;
            }
    }
    else{
        if(secondNum==NULL)
               {
                   secondNum=[NSString stringWithFormat:@"%i",tag];
                   _displayLable.text=secondNum;
               }
                   else{
                       secondNum=[NSString stringWithFormat:@"%@%i",secondNum,tag];
                       _displayLable.text=secondNum;
                   }
    }
}
- (IBAction)clearBtn:(id)sender {
     operationPressed=false;
    _displayLable.text=NULL;
    firstNum=NULL;
       secondNum=NULL;
}
- (IBAction)mulBtn:(id)sender {
    op='*';
       operationPressed=true;
}

- (IBAction)divBtn:(id)sender {
    op='/';
       operationPressed=true;
}

- (IBAction)minsBtn:(id)sender {
    op='-';
     operationPressed=true;
}

- (IBAction)addBtn:(id)sender {
    op='+';
       operationPressed=true;
}
- (IBAction)equalBtn:(id)sender {
    int output=0;
    switch (op) {
        case '+':{
             output= [firstNum intValue]+[secondNum intValue];
                _displayLable.text=[NSString stringWithFormat:@"%i",output];
     break;
        }
        case '-':{
                 output= [firstNum intValue]-[secondNum intValue];
                _displayLable.text=[NSString stringWithFormat:@"%i",output];
        break;
        }
        case '/':{
            if([secondNum intValue]!=0){
                output= [firstNum intValue]/[secondNum intValue];
                _displayLable.text=[NSString stringWithFormat:@"%i",output];
                
            }
            else
                _displayLable.text=@"Not Valid";
                
        break;
        }
        case '*':{
                output= [firstNum intValue]*[secondNum intValue];
                _displayLable.text=[NSString stringWithFormat:@"%i",output];
        break;
        }
                     
    }

    operationPressed=false;
       firstNum=NULL;
       secondNum=NULL;
}
@end
