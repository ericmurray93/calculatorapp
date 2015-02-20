
#import <Foundation/Foundation.h>

@interface Calculator : NSObject

//public properties go here
//public method signatures go here

- (void) setOperand1:(NSString *)operand1;
- (void) setOperand2:(NSString *) operand2;
- (void) setOperation:(NSString *) operation;
- (void) setOperand:(NSString *) operand;
- (void) runFunction:(NSString *) function;
- (void) runOperation;
- (NSString *) operation;
- (Boolean) getterForShouldRun;
- (NSString *) operand1;
- (NSString *) operand2;
- (Boolean) showSecondOperator;
- (Boolean) didPrevOp;

@end
