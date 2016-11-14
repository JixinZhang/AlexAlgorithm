//
//  ViewController.m
//  Algorithm
//
//  Created by WSCN on 10/11/2016.
//  Copyright © 2016 wallstreetcn.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger count0;
@property (nonatomic, assign) NSInteger count1;
@property (nonatomic, assign) NSInteger countLog0;
@property (nonatomic, assign) NSInteger countLog1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *elements = [self createElement];
    NSInteger count = [self getMaxElementCountWithResult:@20 elements:elements];
    NSLog(@"final count = %ld",(long)count);
    _count0 = _count1 = 0;
    _countLog0 = _countLog1 = 0;
    
    NSLog(@"\n method one ");
    for (NSInteger index = 0; index < elements.count; index++) {
        NSNumber *num0 = elements[index];
        if (num0.integerValue == 20) {
            NSLog(@"%@=20",num0);
            _countLog0++;
        }
        for (NSInteger i1 = index + 1; i1 < elements.count; i1++) {
            NSNumber *num1 = elements[i1];
            if (num0.doubleValue + num1.doubleValue == 20) {
                NSLog(@"%@+%@=20",num0,num1);
                _countLog0++;
            }
            for (NSInteger i2 = i1 + 1; i2 < elements.count; i2++) {
                NSNumber  *num2 = elements[i2];
                if ((num0.integerValue + num1.integerValue + num2.integerValue) == 20) {
                    NSLog(@"%@+%@+%@=20",num0,num1,num2);
                    _countLog0++;
                }
                for (NSInteger i3 = i2 + 1; i3 < elements.count; i3++) {
                    NSNumber  *num3 = elements[i3];
                    if ((num0.integerValue + num1.integerValue + num2.integerValue + num3.integerValue) == 20) {
                        NSLog(@"%@+%@+%@+%@=20",num0,num1,num2,num3);
                        _countLog0++;
                    }
                    for (NSInteger i4 = i3 + 1; i4 < elements.count; i4++) {
                        NSNumber  *num4 = elements[i4];
                        if ((num0.integerValue + num1.integerValue + num2.integerValue + num3.integerValue + num4.integerValue  ) == 20) {
                            NSLog(@"%@+%@+%@+%@+%@=20",num0,num1,num2,num3,num4);
                            _countLog0++;
                        }
                        _count0++;
                    }
                    _count0++;
                }
                _count0++;
            }
            _count0++;
        }
        _count0++;
    }
    
    NSLog(@"\n method two");
    [self recursionFunctionWithelements:elements
                           previouString:@""
                                  count:count
                              baseIndex:-1
                             previouSum:0];
    NSLog(@"\n 方法一循环次数 = %ld \n 方法二循环次数 = %ld",_count0,_count1);
    NSLog(@"\n 方法一得到的组合个数：%ld \n 方法二得到的组合个数：%ld",_countLog0,_countLog1);


    
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
                        previouString:(NSString *)previouString
                                count:(NSInteger)count
                            baseIndex:(NSInteger)baseIndex
                           previouSum:(double)previouSum {
    if (count == 0) {
        return;
    }
    for (NSInteger index = baseIndex + 1; index < elements.count; index++) {
        NSNumber *num = elements[index];
        double sum = previouSum + num.doubleValue;
        if (sum == 20) {
            NSString *pringString = [NSString stringWithFormat:@"%@+%@=20",previouString,num];
            NSLog(@"%@",pringString);
            _countLog1++;
        }
        NSString *string = @"";
        if (previouString.length) {
            string = [NSString stringWithFormat:@"%@+%@",previouString,num];
        } else {
            string = [NSString stringWithFormat:@"%@",num];
        }
        [self recursionFunctionWithelements:elements
                              previouString:string
                                      count:count - 1
                                  baseIndex:index
                                 previouSum:sum];
        _count1++;
    }
}

@end
