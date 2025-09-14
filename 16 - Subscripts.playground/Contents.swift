
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
