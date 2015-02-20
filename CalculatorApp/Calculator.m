
#import "Calculator.h"

@interface Calculator()

//private properties go here
//private method signatures go here


@property (nonatomic, strong) NSString* operation;
@property (nonatomic, strong) NSString* operand1;
@property (nonatomic, strong) NSString* operand2;

@end

@implementation Calculator

//implementation of public and private methods goes here

Boolean shouldRun = NO;
Boolean prevOp = NO;
Boolean prevOp2 = NO;
Boolean showSecondOper = NO;
Boolean decimalMode = NO;
Boolean decimalDone = NO;

- (NSString *) operand1 {
    if (!_operand1){
        _operand1 = @"0";
    }
    return _operand1;
}

- (NSString *) operand2 {
    if (!_operand2){
        _operand2 = @"0";
    }
    return _operand2;
}

- (Boolean) getterForShouldRun {
    return shouldRun;
}

- (NSString *) operation {
    if (!_operation){
        _operation = @"";
    }
    return _operation;
}


- (Boolean) showSecondOperator{
    return showSecondOper;
}


- (Boolean) didPrevOp{
    return prevOp;
}

- (void) endDecimal{
    decimalDone = NO;
    decimalMode = NO;
}


- (void) setOperand:(NSString *) operand{
    if([operand isEqualToString:@"."]){
        decimalMode = YES;
    }
    
    if([operand isEqualToString:@"."] && decimalDone){
        return;
    }
    
    if([self.operand1 isEqualToString:@"0"] && [self.operation isEqualToString:@""]){
        if(decimalMode  && !decimalDone){
            decimalDone = YES;
        }
        self.operand1 = operand;
    }
    
    else if ([self.operation isEqualToString:@""]  && !prevOp) {
        if(decimalMode  && !decimalDone){
            decimalDone = YES;
        }
        self.operand1 = [NSString stringWithFormat:@"%@%@", self.operand1, operand];
    }
    
    
    else if([self.operand2 isEqualToString:@"0"] && ! [self.operation isEqualToString:@""]){
        
        if(decimalMode  && !decimalDone){
            decimalDone = YES;
        }
        showSecondOper = YES;
        self.operand2 = operand;
        shouldRun = YES;
    }
    
    else if (![self.operand2 isEqualToString:@"0"] && ! [self.operation isEqualToString:@""] && !prevOp){
        
        if(decimalMode  && !decimalDone){
            decimalDone = YES;
        }
        showSecondOper = YES;
        
        NSLog(@"Number 1");
        
        self.operand2 = [NSString stringWithFormat:@"%@%@", self.operand2, operand];
        shouldRun = YES;
    }
    
    else if(prevOp && prevOp2){
        if(decimalMode  && !decimalDone){
            decimalDone = YES;
        }
        self.operand2 = operand;
        showSecondOper = YES;
        prevOp2 = YES;
        prevOp = YES;
        shouldRun = YES;
        NSLog(@"Number 2");
    }
    
    else if(prevOp && !prevOp2){
        if(decimalMode  && !decimalDone){
            decimalDone = YES;
        }
        self.operand2 = [NSString stringWithFormat:@"%@%@", self.operand2, operand];
        showSecondOper = YES;
        prevOp2 = YES;
        shouldRun = YES;
        NSLog(@"Number 3");
    }
    
}


- (void) setOperator:(NSString *) operation{
    self.operation = operation;
    shouldRun = YES;
    [self endDecimal];
    showSecondOper = YES;
}


- (void) runOperation{
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setPositiveFormat:@"###0.###"];
    
    if(shouldRun){
        
        float oper1  = [self.operand1 floatValue];
        float oper2  = [self.operand2 floatValue];
        float result;
    
        if([self.operation isEqualToString:@"+"]){
        
        result = oper1 + oper2;
        }
    
        else if([self.operation isEqualToString:@"-"]){
            result = oper1 - oper2;
        }
    
        else if([self.operation isEqualToString:@"X"]){
            result = oper1 * oper2;
        }
    
        else if([self.operation isEqualToString:@"/"]){
            if(oper2 == 0){
                self.operand1 = @"ERROR";
                showSecondOper = NO;
                prevOp = YES;
                [self endDecimal];
                return;
            }
            else{
                result = oper1 / oper2;
        }
    }
        NSString *fixedFloat = [f stringFromNumber:@(result)];
        self.operand1 = fixedFloat;
        showSecondOper = NO;
        prevOp = YES;
        prevOp2 = YES;
    }
    [self endDecimal];
}

- (void) runFunction:(NSString *) function{
    
    float oper1  = [self.operand1 floatValue];
    float oper2  = [self.operand2 floatValue];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setPositiveFormat:@"###0.###"];
    
    
    if([function isEqualToString:@"+/-"]){
        
        if(showSecondOper){
            oper2 = oper2 *  -1;
            NSString *fixedFloat = [f stringFromNumber:@(oper2)];
            self.operand2 = fixedFloat;
        }
        else{
            oper1 = oper1 * -1;
            NSString *fixedFloat = [f stringFromNumber:@(oper1)];
            self.operand1 = fixedFloat;
        }
    }
    
    else if([function isEqualToString:@"%"]){

        if(showSecondOper){
            oper2 = oper2 *  .01;
            NSString *fixedFloat = [f stringFromNumber:@(oper2)];
            self.operand2 = fixedFloat;
        }
        else{
            oper1 = oper1 * .01;
            NSString *fixedFloat = [f stringFromNumber:@(oper1)];
            self.operand1 = fixedFloat;
        }
    }
    
    else if([function isEqualToString:@"C"]){
        self.operand1 = @"0";
        self.operand2 = @"0";
        self.operation = @"";
        shouldRun = NO;
        showSecondOper = NO;
        prevOp = NO;
        prevOp2 = NO;
        [self endDecimal];
    }
    
    
    else if([function isEqualToString:@"="]){
        shouldRun = YES;
        [self runOperation];
        prevOp = YES;
        showSecondOper = NO;
        [self endDecimal];
    }
    
}

@end
