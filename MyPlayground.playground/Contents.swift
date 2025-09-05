
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(2)
let summ = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(summ, ArithmeticExpression.number(2))

print(product)


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))


let base = 3
let power = 10

var answer = 1

for _ in 1...power {
    answer *= base
}

print(answer)
