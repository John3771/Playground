/*
 1. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
 */

enum HorizontalMove: String {
    case a, b, c, d, e, f, g, h
    
    var number: Int {
        switch self {
        case .a: 1
        case .b: 2
        case .c: 3
        case .d: 4
        case .e: 5
        case .f: 6
        case .g: 7
        case .h: 8
        }
    }
}

enum VerticalMove: Int {
    case one = 1, two, three, four, five, six, seven, eight
}

func checkSquare(letter: HorizontalMove, number: VerticalMove) -> String {

    let coordinate = "\(letter.rawValue)\(number.rawValue)"
    let color = (letter.number + number.rawValue) % 2 == 0 ? "black" : "white"

    return "\(coordinate) - this square has \(color) color"
}

let firstMove = checkSquare(letter: .e, number: .five)
print("Your move is \(firstMove)")

/*
 2. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделать так, чтобы функция с последовательностью вызывала первую.
 */

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var weirdSequence: any Sequence<Int> = 10...20

func prettyRegularArray(_ array: [Int]) -> [Int] {
    Array(array.reversed())
}

//MARK: ChatGPT Непонятно нихуя

func prettyWeirdSequence<S: Sequence>(
    _ sequence: S,
    using transformer: ([Int]) -> [Int]
) -> [Int] where S.Element == Int {
    let array = Array(sequence)      // превращаем последовательность в массив
    return transformer(array)        // применяем переданную функцию
}

let regularArray = prettyRegularArray(numbers)
let result = prettyWeirdSequence(weirdSequence, using: prettyRegularArray)

print("Резульат первой функции - \(regularArray),\nРезультат второй функции \(result)")

/*
 3. Inout: Выполнить задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 */

var inOutnumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

func prettyRegularArray2(_ array: inout [Int]) {
    array.reverse()
    
    for i in array.indices {
        array[i] += 3
    }
}

prettyRegularArray2(&inOutnumbers)
print(inOutnumbers)

//MARK: Если убрать ключевое слово INOUT то функция не сможет изменить уже существующую переменную так как все передаваемые в функцию значения являются константами. Соответственно придется объявлять новый let/var с вызовом функции

/*
 4. Создать функцию, которая принимает строку,
 убирает из нее все знаки препинания,
 делает все гласные большими буквами,
 согласные маленькими,
 а цифры меняет на соответствующие слова (9 -> nine и тд)
 */

let randomString = "An operator is a special symbol or phrase that you use to check, change, or combine values. For example, the addition operator (+) adds two numbers, as in let i = 1 + 2, and the logical AND operator (&&) combines two Boolean values, as in if enteredDoorCode && passedRetinaScan."
//formatter.numberStyle = .spellOut - SwiftUI

func magicalTransformation(_ string: String) -> String {
    let vowels: Set<Character> = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]
    let numberToChar: [Character : String] = [
        "0": "zero", "1": "one", "2": "two", "3": "three",
        "4": "four", "5": "five", "6": "six", "7": "seven",
        "8": "eight", "9": "nine"
    ]
    
    var result = ""
    
    //MARK: непонятно почему цифры превращенные в строку не подвергаются трансформации дальнейшей
    
    for char in string {
        if char.isPunctuation { continue }
        else if let word = numberToChar[char] { result += word }
        else if vowels.contains(char) { result += char.uppercased() }
        else if char.isLetter { result += char.lowercased() }
        else { result += String(char) }
    }
    return result
}

let anotherResult = magicalTransformation(randomString)
print(anotherResult)
