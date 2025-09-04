
/*
 1. Создать энум с шахматными фигруами (король, ферзь и т.д.).
 Каждая фигура должна иметь цвет белый либо черный, а так же букву и цифру для позиции.
 Создать пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместить эти фигуры в массив фигур
 */

enum PiecesType: String {
    case pawn = "Pawn"
    case knight = "Knight"
    case bishop = "Bishop"
    case rook = "Rook"
    case queen = "Queen"
    case king = "King"
}

enum Color: String {
    case black = "black"
    case white = "white"
}

struct Position {
    let horizontal: Character
    let vertical: Int
}

struct ChessPieces {
    let type: PiecesType
    let color: Color
    let position: Position
}

let whiteQueen = ChessPieces(
    type: .queen,
    color: .white,
    position: Position(horizontal: "g", vertical: 1)
)

let whiteKing = ChessPieces (
    type: .knight,
    color: .white,
    position: Position(horizontal: "h", vertical: 1)
)

let blackKing = ChessPieces (
    type: .king,
    color: .black,
    position: Position(horizontal: "h", vertical: 8)
)

let currentCgessSituation: [ChessPieces] = [whiteKing, whiteQueen, blackKing]


/*
 2. Сделать так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установить соответствующее английское название.
 Создать функцию, которая выводит в консоль (текстово, без юникода)
 название фигуры, цвет и расположение. Используя эту функцию, распечатать все фигуры в массиве.
 */

func iformationAboutPiecesOnTheDesk(_ piece: ChessPieces) {
    print("\(piece.type.rawValue), \(piece.color.rawValue), \(piece.position.horizontal)\(piece.position.vertical)")
}

for piece in currentCgessSituation {
    iformationAboutPiecesOnTheDesk(piece)
}

/*
 3. Используя красивые юникодовые представления шахматных фигур, вывести в консоль вашу доску.
 Если клетка не содержит фигуры, то использовать белую или черную клетку.
 Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 */

func asd() {
    
}
