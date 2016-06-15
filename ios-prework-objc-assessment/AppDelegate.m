//
//  AppDelegate.m
//  ios-prework-objc-assessment
//
//  Created by Joel Bell on 5/23/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *numbersArray = @[];
    NSArray *lettersArray = @[];
    NSDictionary *alphabetDictionary = [NSDictionary new];
    
    numbersArray = [self generateArrayOfNumbers];
    lettersArray = [self generateArrayOfLetters];
    alphabetDictionary = [self generateNumbersAndLettersDictionaryWithNumbers:numbersArray Letters:lettersArray];
    NSLog(@"%@ is the final assortment", alphabetDictionary);
    numbersArray = [alphabetDictionary allKeys];
    NSMutableArray *mutableLettersArray = [lettersArray mutableCopy];
    [mutableLettersArray removeAllObjects];
    for (NSNumber *numberInDict in numbersArray) {
        [mutableLettersArray addObject:alphabetDictionary[numberInDict]];
    }
    NSLog(@"numbers : %@, \n letters : %@", numbersArray, mutableLettersArray);
    
    return YES;
}

-(NSArray *)generateArrayOfNumbers{
    NSMutableArray *numberArray = [NSMutableArray new];
    for (NSUInteger i = 1; i <= 26; i++) {
        NSNumber *intToNum = @(i);
        [numberArray addObject:intToNum];
    }
    return numberArray;
}

-(NSArray *)generateArrayOfLetters{
    NSMutableArray *charArray = [NSMutableArray new];
    char a = 'a';
    
    for (NSUInteger i = 0; i < 26; i++) {
        char letterToInsert = a+i;
        [charArray addObject:[NSString stringWithFormat:@"%c",letterToInsert]];
    }
    return charArray;
}
-(NSDictionary *)generateNumbersAndLettersDictionaryWithNumbers:(NSArray *)numbersArray Letters:(NSArray *)lettersArray{
    NSArray *arrayWithMinLength = [NSArray new];
    NSMutableDictionary *numberAssignedToLetterDict = [NSMutableDictionary new];
    if ([numbersArray count]<=[lettersArray count]) {
        arrayWithMinLength = lettersArray;
    }else{
        arrayWithMinLength = numbersArray;
    }
    for (NSUInteger i = 0; i < arrayWithMinLength.count; i++){
        [numberAssignedToLetterDict setObject:lettersArray[i] forKey:numbersArray[i]];
    }
    return numberAssignedToLetterDict;
}

@end