//
//  main.m
//  Calculator
//
//  Created by Ovi Bortas on 9/5/13.
//  Copyright (c) 2013 Ovi Bortas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

// Accumulator methods
- (void)    setAccumulator: (double) value;
- (void)    clear;
- (double)  accumulator;
- (double) changeSign;
- (double) reciprocal;
- (double) xSquared;

// Memory methods
- (double) memoryClear;
- (double) memoryStore;
- (double) memoryRecall;
- (double) memoryAdd:       (double) value;
- (double) memorySubtract:  (double) value;

// Arthmetic methods
- (double) add:       (double) value;
- (double) subtract:  (double) value;
- (double) multiply:  (double) value;
- (double) divide:    (double) value;

@end

@implementation Calculator
{
    double acculumator;
    double memory;
}

- (void) setAccumulator:(double)value
{
    acculumator = value;
}

- (void) clear
{
    acculumator = 0;
}

- (double) accumulator
{
    return  acculumator;
}

- (double) add:(double)value
{
    acculumator += value;
    return acculumator;
}

- (double) subtract:(double)value
{
    acculumator -= value;
    return acculumator;
}

- (double) multiply:(double)value
{
    acculumator *= value;
    return acculumator;
}

- (double) divide:(double)value
{
    if (value != 0.0) {
        acculumator /= value;
    } else {
        NSLog(@"Division by zero");
        acculumator = NAN;
    }
    return acculumator;
}

- (double) changeSign
{
    return -acculumator;
}

- (double) reciprocal
{
    return 1 / acculumator;
}

- (double) xSquared
{
    return acculumator * acculumator;
}

- (double) memoryClear
{
    memory = 0;
    return acculumator;
}

- (double) memoryStore
{
    memory = acculumator;
    return acculumator;
}

- (double) memoryRecall
{
    acculumator = memory;
    return acculumator;
}

- (double) memoryAdd:(double)value
{
    memory += value;
    acculumator = memory;
    return acculumator;
}

- (double)memorySubtract:(double)value
{
    memory -= value;
    acculumator = memory;
    return acculumator;
}


@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        double value1;
        double value2;
        char operator;
        
        Calculator *deskCalc = [[Calculator alloc] init];
        
        NSLog(@"Type in your expression.");
        scanf("%lf %c %lf", &value1, &operator, &value2);
        
        [deskCalc setAccumulator:value1];
        
        switch (operator) {
            case '+':
                [deskCalc add:value2];
                break;
            case '-':
                [deskCalc subtract:value2];
                break;
            case '*':
                [deskCalc multiply:value2];
                break;
            case '/':
                [deskCalc divide:value2];
                break;
            default:
                NSLog(@"Unknown operator");
                [deskCalc clear];
                break;
        }
        
        NSLog(@"%.2f", [deskCalc accumulator]);
    }
    return 0;
}



















