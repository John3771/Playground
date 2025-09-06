
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

func unicodeSymbol(for piece: ChessPieces) -> String {
    switch piece.type {
    case .pawn:     return piece.color == .white ? "♙" : "♟"
    case .knight:   return piece.color == .white ? "♘" : "♞"
    case .bishop:   return piece.color == .white ? "♗" : "♝"
    case .rook:     return piece.color == .white ? "♖" : "♜"
    case .queen:    return piece.color == .white ? "♕" : "♛"
    case .king:     return piece.color == .white ? "♔" : "♚"
    }
}

let king = unicodeSymbol(for: blackKing)
print(king)

func printChessBoard(with pieces: [ChessPieces]) {
    let files: Array<Character> = ["a","b","c","d","e","f","g","h"]
    let ranks: Array<Int> = Array((1...8).reversed())

    for rank in ranks {
        var row = ""
        for file in files {
            if let piece = pieces.first(
                where: {
                    $0.position.horizontal == file && $0.position.vertical == rank
                }) {
                row += unicodeSymbol(for: piece)
            } else {
                // Чередуем цвета клеток: белая и черная
                let isWhiteSquare = (files.firstIndex(of: file)! + rank) % 2 == 0
                row += isWhiteSquare ? "⬜️" : "⬛️"
            }
            row += " " // пробел между клетками
        }
        print(row)
    }
}

printChessBoard(with: currentCgessSituation)


/*
 4. Создать функцию, которая будет принимать шахматную фигуру и тюпл новой позиции.
 Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным:
 нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
 */

func nextMove1(_ piece: inout ChessPieces, move: (String, Int)) {
    let file = move.0.lowercased()
    let rank = move.1
}

func nextMove(_ piece: inout ChessPieces, move: (String, Int)) {
    let file = move.0.lowercased()
    let rank = move.1
    
    guard file.count == 1,
          let fileChar = file.first,
          "a"..."h" ~= fileChar,
          1...8 ~= rank else {
        print("Неверная позиция.")
        return
    }
    piece = ChessPieces(
        type: piece.type,
        color: piece.color,
        position: Position(horizontal: fileChar, vertical: rank)
    )
}
