
#import "CalculatorViewController.h"
#import "Calculator.h"

@interface CalculatorViewController ()

// Put any outlets you want here.
// Just control+click and drag them
// from the storyboard to here. See
// the provided demo code for examples.

@property (strong, nonatomic) Calculator *calc;
@property (weak, nonatomic) IBOutlet UILabel *screen;

@end



@implementation CalculatorViewController


- (Calculator *) calc{
    if (!_calc){
        _calc = [[Calculator alloc] init];
    }
    return _calc;
}

// Put any actions you want here.
// Just control+click and drag from a
// UI element to here. You can connect
// multiple UI elements to the same action.
// For example, you might want all the number
// buttons to be connected to the same action.

// This is a sample action (not connected to anything)
// You can see that the sender argument is actually the
// UI element that was pressed. You can use this argument
// to retrieve valuable information about the ui element.
- (IBAction)numberPressed:(id)sender
{
    // Explicit cast to a UIButton
    UIButton *buttonPressed = (UIButton *)sender;
    NSString *operand = buttonPressed.titleLabel.text;
    NSLog(@"%@", operand);
    [self.calc setOperand:operand];
    [self updateScreen];
}


- (IBAction)operationPressed:(UIButton *)sender{
    UIButton *buttonPressed = (UIButton *)sender;
    NSString *operation = buttonPressed.titleLabel.text;
    NSLog(@"%@", operation);
    [self.calc runOperation];
    [self.calc setOperation:operation];
    [self updateScreen];
}


- (IBAction)functionPressed:(UIButton *)sender{
    UIButton *buttonPressed = (UIButton *)sender;
    NSString *function = buttonPressed.titleLabel.text;
    [self.calc runFunction:function];
    [self updateScreen];
}

- (void) updateScreen {
    if([self.calc showSecondOperator])
    {
        self.screen.text = [self.calc operand2];
    }
    else{
        self.screen.text = [self.calc operand1];
    }
}


@end
