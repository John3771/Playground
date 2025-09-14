
/*
 Шахматная доска (Легкий уровень)
 1. Создать тип шахматная доска.
 2. Добавить сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
 3. Если юзер ошибся координатами - выдавать нил

 */

class checkDesk {
    
    subscript squareFinder(_ file: Int) -> String {
        
    }
}







































































struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[32])")

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * column) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * column) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print(matrix)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

print(matrix)

let somev = matrix[2, 2]
print(somev)
