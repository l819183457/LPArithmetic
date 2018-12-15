//
//  LPArithmetic.m
//  LPArithmetic
//
//  Created by pill on 2018/12/13.
//  Copyright © 2018 LP. All rights reserved.
//

#import "LPArithmetic.h"


//#  商户好 + 水技术 + 时间错

@implementation LPArithmetic
////算法  混合运算算式
+ (NSString *)arithmeticLevelEquel:(NSString *)formulaStr{
    NSMutableArray * letters = [LPArithmetic formulaSeparationUnit:formulaStr];
    NSMutableArray * levelLetters = [LPArithmetic hightLevelCalculation:letters];
    return [LPArithmetic queueCalculation:levelLetters];
    
}
//顺序执行
+ (NSString *)arithmeticQueueEquel:(NSString *)formulaStr {
    NSMutableArray * letters = [LPArithmetic formulaSeparationUnit:formulaStr];
    return [LPArithmetic queueCalculation:letters];
}
////算法  混合运算算式（带括号）

+ (NSString *)arithmeticHighLevelEquel:(NSString *)FormulaStr{
    NSMutableArray * letters = [self formulaSeparationUnit_brackets:FormulaStr];
    NSMutableArray * levelLetters1 = [LPArithmetic hightLevelCalculation_brackets:(NSArray *)letters];
    NSMutableArray * levelLetters2 = [LPArithmetic hightLevelCalculation:levelLetters1];
    
    return [LPArithmetic queueCalculation:levelLetters2];
}


//数据与算法分离 （当前不支持（））
+(NSMutableArray *)formulaSeparationUnit:(NSString * )formulaStr {
    if ([formulaStr hasPrefix:@"-"]) {
        formulaStr =   [NSString stringWithFormat:@"0%@",formulaStr ];
    }
    NSMutableString *middleData = [NSMutableString stringWithFormat:@""];
    NSMutableArray * letters = [NSMutableArray array];
    for(int i  = 0 ;i < formulaStr.length; i++) {
        unichar letter = [formulaStr characterAtIndex:i];
        NSLog(@"%d", letter);
        // letter ==  1234567890 . E  e
        if ((letter >= 48 && letter <= 57) || letter == 46|| letter == 101||letter == 69) {
            char ch = (char)letter;
            [middleData appendFormat:@"%c", ch];
        }else {
            [letters addObject:[middleData copy]];
            middleData = [NSMutableString stringWithFormat:@""];
            char ch = (char)letter;
            NSString *character = [NSString stringWithFormat:@"%c", ch];
            [letters addObject:[character copy]];
        }
        if (formulaStr.length == i+1&&middleData.length >0) {
            [letters addObject:[middleData copy]];
            middleData = [NSMutableString stringWithFormat:@""];
        }
    }
    return letters;
}



//数据与算法分离 （当前不支持（））
+(NSMutableArray *)formulaSeparationUnit_brackets:(NSString * )formulaStr {
    if ([formulaStr hasPrefix:@"-"]) {
        formulaStr =   [NSString stringWithFormat:@"0%@",formulaStr ];
    }
    NSMutableString *middleData = [NSMutableString stringWithFormat:@""];
    NSMutableArray * letters = [NSMutableArray array];
    NSMutableArray * subLetters = nil;
    for(int i  = 0 ;i < formulaStr.length; i++) {
        unichar letter = [formulaStr characterAtIndex:i];
        NSLog(@"%d", letter);
        // letter ==  1234567890 . E  e
    if ((letter >=   48 && letter <= 57) || letter == 46|| letter == 101||letter == 69) {
            char ch = (char)letter;
            [middleData appendFormat:@"%c", ch];
       } else if (letter == 40) {
           subLetters = [NSMutableArray array];
       }else if (letter == 41) {
           if (subLetters) {
               [subLetters addObject:[middleData copy]];
               [letters addObject:[subLetters copy]];
               middleData = [NSMutableString stringWithFormat:@""];
           }
           subLetters = nil;
       }
       else {
           if (subLetters) {
               [subLetters addObject:[middleData copy]];
           }else if (![middleData isEqualToString:@""]) {
               [letters addObject:[middleData copy]];
           }
            middleData = [NSMutableString stringWithFormat:@""];
            char ch = (char)letter;
            NSString *character = [NSString stringWithFormat:@"%c", ch];
            if (subLetters) {
                [subLetters addObject:[character copy]];
            }else {
                [letters addObject:[character copy]];
            }
            
        }
        if (formulaStr.length == i+1&&middleData.length >0) {
            if (subLetters) {
                [subLetters addObject:[middleData copy]];
            }else {
                [letters addObject:[middleData copy]];
            }
            middleData = [NSMutableString stringWithFormat:@""];
        }
    }
    return letters;
}

+ (NSMutableArray  *)hightLevelCalculation_brackets:(NSArray *)letters {
    NSMutableArray *tempLetters = [NSMutableArray arrayWithArray:letters];
    for (int j = 0; j <letters.count ; j++) {
        NSString * letter = letters[j];
        if ([letter isKindOfClass:[NSArray class]]) {
            NSArray * temp1 =[NSMutableArray arrayWithArray:(NSArray *)letter];
            NSArray * subLetter1 =  [LPArithmetic hightLevelCalculation:temp1];
            NSString * temp2 = [LPArithmetic queueCalculation:subLetter1];
            [tempLetters removeObjectAtIndex:j ];
            [tempLetters insertObject:temp2 atIndex:j];
            return [LPArithmetic hightLevelCalculation_brackets:tempLetters];
        
        }
    }
    return tempLetters;
}



+ (NSMutableArray  *)hightLevelCalculation:(NSArray *)letters {
    
    NSMutableArray *tempLetters = [NSMutableArray arrayWithArray:letters];
    for (int j = 0; j <letters.count ; j++) {
        NSString * letter = letters[j];
        if ([letter isEqualToString:@"*"] ||[letter isEqualToString:@"/"]) {
            NSInteger tag = j - 1;
            if (j -1 >= 0 && (j +1) < (letters.count)) {
                NSString *  one  = letters[tag];
                NSString *  two = letters[j + 1];
                [tempLetters removeObjectAtIndex:j + 1];
                [tempLetters removeObjectAtIndex:j ];
                [tempLetters removeObjectAtIndex:j -1];
                [tempLetters insertObject:[LPArithmetic sinpleCalculationFisrt:one second:two calculation:letter] atIndex:tag];
                return [LPArithmetic hightLevelCalculation:tempLetters];
                break;
            }
        }
    }
    return tempLetters;
}


//顺序运算  可能后期增加多维数组
+ (NSString  *)queueCalculation:(NSArray *)letters {
    
    NSMutableArray *tempLetters = [NSMutableArray arrayWithArray:letters];
    for (int j = 0; j <letters.count ; j++) {
        NSString * letter = letters[j];
        if ([letter isEqualToString:@""]||[letter isEqualToString:@" "]) {
            continue;
        }
        NSInteger tag = j - 1;
        if (j -1 >= 0 && (j +1) < (letters.count)) {
            NSString *  one  = letters[tag];
            NSString *  two = letters[j + 1];
            [tempLetters removeObjectAtIndex:j + 1];
            [tempLetters removeObjectAtIndex:j ];
            [tempLetters removeObjectAtIndex:j -1];
            [tempLetters insertObject:[LPArithmetic sinpleCalculationFisrt:one second:two calculation:letter] atIndex:tag];
            return [LPArithmetic queueCalculation:tempLetters];
            break;
        }
    }
    return tempLetters.count == 1?[tempLetters firstObject]:@"0";
}



//简单的计算
+ (NSString *)sinpleCalculationFisrt:(NSString *)fisrtStr second:(NSString *)secondStr calculation:(NSString *)calculation {
    NSDecimalNumber *result ;
    //    CGFloat top = [one floatValue];
    NSDecimalNumber*fisrt = [NSDecimalNumber decimalNumberWithString:fisrtStr];
    NSDecimalNumber*second = [NSDecimalNumber decimalNumberWithString:secondStr];
    
    //    CGFloat second = [two floatValue];
    switch([calculation characterAtIndex:0])
    {
        case '*':
            result = [fisrt decimalNumberByMultiplyingBy:second];;
            break;
        case '/':
            result = [fisrt decimalNumberByDividingBy:second];;
            break;
        case '+':
            result =  [fisrt decimalNumberByAdding:second];
            break;
        case '-':
            result = [fisrt decimalNumberBySubtracting:second];;
            break;
    }
    return [NSString stringWithFormat:@"%@",result];
}
@end
