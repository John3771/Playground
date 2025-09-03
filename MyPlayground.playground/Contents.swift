enum HorizontalMove: String {
    case a, b, c, d, e, f, g, h
}

var horizontalMove = HorizontalMove.a

switch horizontalMove {
case .a: 1
case .b: 2
case .c: 3
case .d: 4
case .e: 5
case .f: 6
case .g: 7
case .h: 8
}

var verticalMove = 1

switch verticalMove {
case 1: 1
case 2: 2
case 3: 3
case 4: 4
case 5: 5
case 6: 6
case 7: 7
case 8: 8
default: 1
}


let zero = 0%0

print(zero)
