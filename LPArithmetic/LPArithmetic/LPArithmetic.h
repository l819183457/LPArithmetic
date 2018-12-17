//
//  LPArithmetic.h
//  LPArithmetic
//
//  Created by pill on 2018/12/13.
//  Copyright © 2018 LP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LPArithmetic : NSObject

////算法  混合运算算式（不带括号）
+ (NSString *)arithmeticLevelEquel:(NSString *)FormulaStr;  //version 1.0


////算法  混合运算算式（带括号）

+ (NSString *)arithmeticHighLevelEquel:(NSString *)FormulaStr;  //version 1.0

//顺序执行
+ (NSString *)arithmeticQueueEquel:(NSString *)formulaStr; //version 1.0

//简单的计算
+ (NSString *)sinpleCalculationFisrt:(NSString *)fisrtStr second:(NSString *)secondStr calculation:(NSString *)calculation;  //version 1.0

/*
 科学计数法，保留n个有效值
 */
+(NSString *)scientific:(NSString * )doubleStr  rms:(NSInteger)n ;
@end

NS_ASSUME_NONNULL_END
