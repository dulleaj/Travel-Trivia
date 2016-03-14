//
//  Trivia.m
//  Travel Trivia
//
//  Created by Andrew Dulle on 3/9/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "Trivia.h"

@implementation Trivia

- (void) questionList {
    
    int questionInt = arc4random_uniform(5);
    
    if (questionInt == 0) {
        
        self.question = @"The Louvre is a museum in which city?";
        self.answer = @"Paris";
        self.questionAnswerOptions = [NSArray arrayWithObjects:@"Bruge",@"Rome",@"Paris",@"Valencia", nil];

    }else if (questionInt == 1) {
        
        self.question = @"The tallest waterfall in the world is located in which country?";
        self.answer = @"Venezuela";
        self.questionAnswerOptions = [NSArray arrayWithObjects:@"Venezuela",@"South Africa",@"Peru",@"Costa Rica", nil];
        
    }else if (questionInt == 2) {
        
        self.question = @"In which ocean does 0 degress latitude and 0 degress longitude fall?";
        self.answer = @"Atlantic";
        self.questionAnswerOptions = [NSArray arrayWithObjects:@"Indian",@"Atlantic",@"Pacific",@"Arctic", nil];
        
    }else if (questionInt == 3) {
        
        self.question = @"The tallest mountain in the continental United States lies in which mountain range?";
        self.answer = @"Sierra Nevada";
        self.questionAnswerOptions = [NSArray arrayWithObjects:@"Sierra Nevada",@"Appalachian",@"Rocky",@"Andes", nil];
        
    }else if (questionInt == 4) {
        
        self.question = @"Earth's lowest elevation on land is location on the shore of which body of water?";
        self.answer = @"Dead Sea";
        self.questionAnswerOptions = [NSArray arrayWithObjects:@"Caspian Sea",@"Dead Sea",@"Lake Eyre",@"Lake Frome", nil];
        
    }
    
}

@end
