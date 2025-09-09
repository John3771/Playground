

let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func isPrimalNumber(number: Int) -> Bool {
    if number < 2 { return false }
    if number == 2 { return true }
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

let result = numbers.filter { !isPrimalNumber(number: $0) }
print(result)

