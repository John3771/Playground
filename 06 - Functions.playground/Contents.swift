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

//var verticalMove = 1
//
//switch verticalMove {
//case 1: 1
//case 2: 2
//case 3: 3
//case 4: 4
//case 5: 5
//case 6: 6
//case 7: 7
//case 8: 8
//default: 1
//}


func checkSquare(letter: HorizontalMove, number: VerticalMove) -> String {
//    let x = letter.number
//    let y = number
    let coordinate = "\(letter.rawValue)\(number.rawValue)"
    let color = (letter.number + number.rawValue) % 2 == 0 ? "black" : "white"
//    (x + y) % 2 == 0 ? "black" : "white"
    
    //MARK: Вопрос почему я не могу созданные константы (Х, У) использовать в тернарном операторе
    
//    return("твой ход: по горизонтали \(letter), по вертикали \(number)")
    return "\(coordinate) - this square has \(color) color"
}

let firstMove = checkSquare(letter: .e, number: .five)
print("Your move is \(firstMove)")


//checkSquare(letter: letterInNumber.b, number: 3)

/*
 2. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделать так, чтобы функция с последовательностью вызывала первую.
 */

func prettyRegularArray(_: [Int]) -> [Int] {
    
}

/*
 3. Inout: Выполнить задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

 */

/*
 4. Создать функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

 */
