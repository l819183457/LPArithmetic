////
////  NSString+LPExtension.h
////  PPCalculator
////
////  Created by pill on 2018/12/8.
////  Copyright © 2018 公平. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//@interface NSString (LPExtension)
//-(NSString *)valueStr ;
//-(NSString *)keyStr;
//+ (NSString *)calcNormalFormula:(NSString *)formula;
//// 复杂计算公式计算,接口主方法
//+ (NSString *)calcComplexFormulaString:(NSString *)formula;
//
//
//-(NSString *)quling;
//@end
//
//NS_ASSUME_NONNULL_END
//
//  NSString+LPExtension.h
//  PPCalculator
//
//  Created by pill on 2018/12/8.
//  Copyright © 2018 公平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LPExtension)


/**
 千位分隔符
 */
+ (NSString *)thousandsSeparatorWithStr:(NSString *)str;

/**
 去逗号
 */
+ (NSString *)cleanCommaSymbolWithStr:(NSString *)str;

-(NSString *)valueStr ;
-(NSString *)keyStr;
//+ (NSString *)calcNormalFormula:(NSString *)formula;
// 复杂计算公式计算,接口主方法
//+ (NSString *)calcComplexFormulaString:(NSString *)formula;


//-(NSString *)quling;
////算法  放入算式
+ (NSString *)formulaEquel:(NSString *)suanshi;

//wendu
- (NSString *)converseToTemp:(NSString *)suanshi;



@end

NS_ASSUME_NONNULL_END

