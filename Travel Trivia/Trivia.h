//
//  Trivia.h
//  Travel Trivia
//
//  Created by Andrew Dulle on 3/9/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trivia : NSObject

@property NSString *question;

@property NSString *answer;

@property NSArray *questionAnswerOptions;

- (void) questionList;

@end
