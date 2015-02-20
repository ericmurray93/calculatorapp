
#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorAppTests : XCTestCase

@property (strong, nonatomic) Calculator *calc;

@end

@implementation CalculatorAppTests

- (Calculator *) calc{
    if (!_calc){
        _calc = [[Calculator alloc] init];
    }
    return _calc;
}

- (void)setUp
{
    [super setUp];
    self.calc.operand1 = @"4";
    self.calc.operand2 = @"2";
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testAddition
{
    self.calc.operation = @"+";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"6");
}

- (void)testSubstraction
{
    self.calc.operation = @"-";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"2");
}

- (void)testMultiply
{

    self.calc.operation = @"X";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"8");
}

- (void)testDivision
{
    self.calc.operation = @"/";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"2");
}

- (void)testClear
{
    [self.calc runFunction:@"C"];
    XCTAssertEqualObjects(self.calc.operand2, @"0");
}

/*Test for All clear feature
- (void)testAllClear
{
    self.calc.operation = @"AC";
    XCTAssertEqualObjects(self.calc.operand1, @"0");
    XCTAssertEqualObjects(self.calc.operand2, @"0");
    XCTAssertEqualObjects(self.calc.operation, @"");
    XCTAssertEqualObjects(self.calc.operand1, @"1.1");
}
*/

- (void)testPercent
{
    [self.calc runFunction:@"%"];
    XCTAssertEqualObjects(self.calc.operand1, @"0.04");
}

- (void)testPosNeg
{
    [self.calc runFunction:@"+/-"];
    XCTAssertEqualObjects(self.calc.operand1, @"-4");
    [self.calc runFunction:@"+/-"];
    XCTAssertEqualObjects(self.calc.operand1, @"4");
}


- (void)testAdditionDecimal
{
    self.calc.operand1 = @"2.2";
    self.calc.operand2 = @"1.1";
    self.calc.operation = @"+";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"3.3");
}

- (void)testSubstractionDecimal
{
    self.calc.operand1 = @"2.2";
    self.calc.operand2 = @"1.1";
    self.calc.operation = @"-";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"1.1");
}

- (void)testMultiplyDecimal
{
    self.calc.operand1 = @"2.2";
    self.calc.operand2 = @"1.1";
    self.calc.operation = @"X";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"2.42");
}

- (void)testDivisionDecimal
{
    self.calc.operand1 = @"2.2";
    self.calc.operand2 = @"1.1";
    self.calc.operation = @"/";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"2");
}

- (void)testSeveralValues
{
    self.calc.operand1 = @"2";
    self.calc.operand2 = @"1";
    self.calc.operation = @"+";
    [self.calc runFunction:@"="];
    self.calc.operation = @"X";
    self.calc.operand2 = @"3";
    [self.calc runFunction:@"="];
    self.calc.operation = @"/";
    self.calc.operand2 = @"3";
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"3");
}


- (void)testSeveralValues2
{
    self.calc.operand1 = @"2";
    self.calc.operand2 = @"2";
    self.calc.operation = @"+";
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"14");
}


- (void)testSeveralValues3
{
    self.calc.operand1 = @"2";
    self.calc.operand2 = @"2";
    self.calc.operation = @"-";
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    self.calc.operand2 = @"8";
    self.calc.operation = @"X";
    [self.calc runFunction:@"="];
    [self.calc runFunction:@"="];
    XCTAssertEqualObjects(self.calc.operand1, @"-256");
}

/*
- (void)testMemoryAdd
{
    [self.calc runFunction:@"M+"];
    //self.calc.memory = self.calc.operand2 value
    XCTAssertEqualObjects(self.calc.memory, @"1.1");
}*/

/*
 - (void)testMemoryClear
 {
 [self.calc runFunction:@"MR"];
 //self.calc.memory = self.calc.operand2;
 XCTAssertEqualObjects(self.calc.memory, self.calc.operand2);
 }*/

/*
 - (void)testMemoryClear
 {
 [self.calc runFunction:@"MC"];
 //self.calc.memory = @""
 XCTAssertEqualObjects(self.calc.memory, @"");
 }*/



@end
