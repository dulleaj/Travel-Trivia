//
//  ViewController.m
//  Travel Trivia
//
//  Created by Andrew Dulle on 3/9/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"
#import "Trivia.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *aButton;
@property (weak, nonatomic) IBOutlet UIButton *bButton;
@property (weak, nonatomic) IBOutlet UIButton *cButton;
@property (weak, nonatomic) IBOutlet UIButton *dButton;
@property Trivia *randomQuestion;
@property NSString *aButtonString;
@property NSString *bButtonString;
@property NSString *cButtonString;
@property NSString *dButtonString;
@property NSMutableArray *incorrectAnswers;
@property (weak, nonatomic) IBOutlet UILabel *percentCorrectLabel;
@property int totalQuestionsAsked;
@property int totalCorrectAnswers;
@property int totalIncorrectAnswers;
@property float percentCorrect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.startButton.hidden = NO;
    self.questionLabel.hidden = YES;
    self.aButton.hidden = YES;
    self.bButton.hidden = YES;
    self.cButton.hidden = YES;
    self.dButton.hidden = YES;
    self.percentCorrectLabel.hidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startButtonWasTapped:(id)sender {
    
    self.startButton.hidden = YES;
    self.questionLabel.hidden = NO;
    self.aButton.hidden = NO;
    self.aButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.bButton.hidden = NO;
    self.bButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.cButton.hidden = NO;
    self.cButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.dButton.hidden = NO;
    self.dButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.percentCorrectLabel.hidden = NO;
    [self askQuestion];
    //use text view for question
}

- (void) askQuestion {
    
    self.randomQuestion = [[Trivia alloc] init];
      
    [self.randomQuestion questionList];
      
    self.questionLabel.text = self.randomQuestion.question;
    
    self.aButtonString = self.randomQuestion.questionAnswerOptions [0];
    self.bButtonString = self.randomQuestion.questionAnswerOptions [1];
    self.cButtonString = self.randomQuestion.questionAnswerOptions [2];
    self.dButtonString = self.randomQuestion.questionAnswerOptions [3];
    
    [self.aButton setTitle: self.aButtonString forState:UIControlStateNormal];
    [self.bButton setTitle: self.bButtonString forState:UIControlStateNormal];
    [self.cButton setTitle: self.cButtonString forState:UIControlStateNormal];
    [self.dButton setTitle: self.dButtonString forState:UIControlStateNormal];
   
}

//Button A
- (IBAction)aButtonWasTapped:(id)sender {
    
    if (self.aButtonString == self.randomQuestion.answer) {
        
        [self answeredCorrectly];
        
        [self askQuestion];
        
    }else{
        
        [self answeredIncorrectly];
        
        [self askQuestion];
        
    }
    
}

//Button B
- (IBAction)bButtonWasTapped:(id)sender {

    if (self.bButtonString == self.randomQuestion.answer) {
        
        [self answeredCorrectly];
        
        [self askQuestion];
        
    }else{
        
        [self answeredIncorrectly];
     
        [self askQuestion];
        
    }

}

//Button C
- (IBAction)cButtonWasTapped:(id)sender {

    if (self.cButtonString == self.randomQuestion.answer) {
        
        [self answeredCorrectly];
        
        [self askQuestion];
        
    }else{
        
        [self answeredIncorrectly];
        
        [self askQuestion];
        
    }

}

//Button D
- (IBAction)dButtonWasTapped:(id)sender {

    if (self.dButtonString == self.randomQuestion.answer) {
        
        [self answeredCorrectly];
        
        [self askQuestion];
        
    }else{
        
        [self answeredIncorrectly];
        
        [self askQuestion];
    
    }

}

//If the question is answered correctly
- (void) answeredCorrectly {
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.totalQuestionsAsked += 1;
    
    self.totalCorrectAnswers += 1;
    
    self.percentCorrect = (100 * self.totalCorrectAnswers)/self.totalQuestionsAsked;
    int percentRounded = (int)roundf(self.percentCorrect);
    self.percentCorrectLabel.text = [NSString stringWithFormat:@"Correct = %d%%",percentRounded];
    //http://stackoverflow.com/questions/5755197/simple-percentange-calculation
    //http://stackoverflow.com/questions/8785468/convert-float-to-int-in-objective-c

}

//If the question is answered incorrectly
- (void) answeredIncorrectly {
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.totalQuestionsAsked += 1;
    
    self.totalIncorrectAnswers += 1;
    
    self.percentCorrect = (100 * self.totalCorrectAnswers)/self.totalQuestionsAsked;
    int percentRounded = (int)roundf(self.percentCorrect);
    self.percentCorrectLabel.text = [NSString stringWithFormat:@"Correct = %d%%",percentRounded];
    //http://stackoverflow.com/questions/5755197/simple-percentange-calculation
    //http://stackoverflow.com/questions/8785468/convert-float-to-int-in-objective-c
    
    [self.incorrectAnswers addObject:self.randomQuestion];
    
    for (Trivia *incorrectLog in self.incorrectAnswers){
        NSLog(@"Question = %@",incorrectLog.question);
        NSLog(@"Answer = %@",incorrectLog.answer);
    
    }

    
    
}

// create a new app - Then - have another button that is "Help", which, when clicked, will tell them which question they've gotten wrong. Will need a custom class for each question, will want question to store and present everything, and use an array to store questions. Also - on the top left of screen, have a running percentage of how many questions they've gotten correct.
    

@end
