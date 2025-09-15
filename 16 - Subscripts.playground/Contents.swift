
/*
 Шахматная доска (Легкий уровень)
 1. Создать тип шахматная доска.
 2. Добавить сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
 3. Если юзер ошибся координатами - выдавать нил
 
 */

/*
 Каждая буква в компьютере имеет свой номер (это называется Unicode scalar value - a-97, h-104; один(1) - 1 скалярное значение
 в блоке гард можем перечислять условия через запятую
 .unicodeScalars.first?.value
 .contains()
 .dropFirst()
 
 file - буква - вертикаль
 rank - цифра - горизонталь
 */

struct Chessboard {
    enum SquareColor: String { case white = "white", black = "black"}
    
    private func fileIndex(for file: Character) -> Int? {
        guard let scalar = file.lowercased().unicodeScalars.first?.value,
              scalar >= 97,
              scalar <= 104
        else { return nil }
        
        return Int(scalar - 96)
    }
    
    subscript(_ file: Character, _ rank: Int) -> SquareColor? {
        guard let f = fileIndex(for: file), (1...8).contains(rank)
        else { return nil }
        
        let sum = f + rank
        return (sum % 2 == 0) ? .black : .white
    }
    //MARK: GPT
    subscript(_ coordinate: String) -> SquareColor? {
        guard let file = coordinate.first, //берет первый символ строки
              let rank = Int(coordinate.dropFirst()) //наоборот убирает первый символ
        else { return nil }
        return self[file, rank] //можно передать значения в другой сабскрипт по его сигнатуре
    }
}

let board = Chessboard()
print("a1 - \(board["a1"]?.rawValue ?? "nil")")
print(board["A", 6]?.rawValue ?? "nil")


/*
 Крестики нолики (Средний уровень)
 1. Создать тип, представляющий собой поле для игры в крестики нолики
 На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
 Добавьте возможность красиво распечатывать поле
 2. Добавить сабскрипт, который устанавливает значение клетки по ряду и столбцу,
 причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
 3. Также следить за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавить метод очистки поля.
 4. Если хотите, добавте алгоритм, который вычислит победителя
 */

//MARK: GPT

enum Mark: Equatable {
    case empty
    case cross
    case nough
}

struct TicTacToe {
    private(set) var board: [Mark] = Array(repeating: .empty, count: 9)
    
    let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    
    mutating func makeMove(at index: Int, as mark: Mark) -> Bool {
        guard board.indices.contains(index),
              board[index] == .empty
        else { return false }
 
        board[index] = mark
        return true
    }
    
    func winner() -> Mark? {
        for combo in winningCombinations {
            let marks = combo.map { board[$0] }
            if marks.allSatisfy({ $0 == .cross }) {
                return .cross
            }
            if marks.allSatisfy({ $0 == .nough }) {
                return .nough
            }
        }
        return nil
    }
}

let test = [1, 2, 3]
print(test.allSatisfy({ $0 > 0 }))

























































//struct TimesTable {
//    let multiplier: Int
//    subscript(index: Int) -> Int {
//        return multiplier * index
//    }
//}
//
//let threeTimesTable = TimesTable(multiplier: 3)
//print("six times three is \(threeTimesTable[32])")
//
//struct Matrix {
//    let rows: Int, columns: Int
//    var grid: [Double]
//
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//
//    func indexIsValid(row: Int, column: Int) -> Bool {
//        row >= 0 && row < rows && column >= 0 && column < columns
//    }
//
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValid(row: rows, column: columns), "Index out of range")
//            return grid[(row * column) + column]
//        }
//        set {
//            assert(indexIsValid(row: rows, column: columns), "Index out of range")
//            grid[(row * column) + column] = newValue
//        }
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//print(matrix)
//
//matrix[0, 1] = 1.5
//matrix[1, 0] = 3.2
//
//print(matrix)
//
//let somev = matrix[2, 2]
//print(somev)

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
greet(person: ["huy": "pizda"])
