//
//  ViewController.m
//  Algorithm
//
//  Created by WSCN on 10/11/2016.
//  Copyright © 2016 wallstreetcn.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *elements = [self createElement];
    NSInteger count = [self getMaxElementCountWithResult:@20 elements:elements];
    NSLog(@"final count = %ld",(long)count);
    
    for (NSInteger index = 0; index < elements.count; index++) {
        NSNumber *num0 = elements[index];
        if (num0.integerValue == 20) {
            NSLog(@"%@=20",num0);
        }
        for (NSInteger i1 = index + 1; i1 < elements.count; i1++) {
            NSNumber *num1 = elements[i1];
            if (num0.doubleValue + num1.doubleValue == 20) {
                NSLog(@"%@+%@=20",num0,num1);
            }
            for (NSInteger i2 = i1 + 1; i2 < elements.count; i2++) {
                NSNumber  *num2 = elements[i2];
                if ((num0.integerValue + num1.integerValue + num2.integerValue) == 20) {
                    NSLog(@"%@+%@+%@=20",num0,num1,num2);
                }
                for (NSInteger i3 = i2 + 1; i3 < elements.count; i3++) {
                    NSNumber  *num3 = elements[i3];
                    if ((num0.integerValue + num1.integerValue + num2.integerValue + num3.integerValue) == 20) {
                        NSLog(@"%@+%@+%@+%@=20",num0,num1,num2,num3);
                    }
                    for (NSInteger i4 = i3 + 1; i4 < elements.count; i4++) {
                        NSNumber  *num4 = elements[i4];
                        if ((num0.integerValue + num1.integerValue + num2.integerValue + num3.integerValue + num4.integerValue  ) == 20) {
                            NSLog(@"%@+%@+%@+%@+%@=20",num0,num1,num2,num3,num4);
                        }
                    }
                }
            }
        }
//        NSNumber *num0 = elements[index];
//        double sum = num0.doubleValue;
//        [self recursionFunctionWithelements:elements
//                                      count:count
//                                  baseIndex:index
//                               currentIndex:1
//                                 previouSum:sum];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)createElement {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 1; i <= 20; i++) {
        [array addObject:[NSNumber numberWithInteger:i]];
    }
    return array;
}

- (NSInteger)getMaxElementCountWithResult:(NSNumber *)result
                                 elements:(NSArray *)elements {
    double sum = 0;
    NSInteger count;
    for (NSInteger index = 0; index < elements.count; index++) {
        NSNumber *element = elements[index];
        sum += element.doubleValue;
        if ((result.doubleValue - sum) <= element.doubleValue) {
            count = index;
            break;
        }
    }
    return count + 1;
}

- (void)recursionFunctionWithelements:(NSArray *)elements
                                count:(NSInteger)count
                            baseIndex:(NSInteger)baseIndex
                         currentIndex:(NSInteger)currentIndex
                           previouSum:(double)previouSum {
    for (NSInteger index = baseIndex + currentIndex; index < elements.count; index++) {
        NSNumber *num = elements[index];
        if ((previouSum + num.doubleValue) == 20) {
            NSString *printString = @"";
            for (NSInteger j = 0; j < currentIndex; j++) {
                NSNumber *previouNum = elements[j];
                printString = [NSString stringWithFormat:@"%@%ld+",printString ,(long)previouNum.integerValue];
            }
            NSLog(@"%@%.f=20",printString,num.doubleValue);
        } else {
            continue;
        }
        
        if (currentIndex == count - 1) {
            return;
        } else {
            double sum = previouSum + num.doubleValue;
            [self recursionFunctionWithelements:elements
                                          count:count
                                      baseIndex:baseIndex
                                   currentIndex:currentIndex + 1
                                     previouSum:sum];
        }
    }
}



@end
