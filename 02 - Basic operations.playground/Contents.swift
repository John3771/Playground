
// 1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)

let DaysInMonth = 30
let secondsInDay = 60*60*24

let birthdayDay = 25
var birthdayMonth = 10

let secondsUntilBirthday = ((birthdayMonth - 1) * DaysInMonth + birthdayDay - 1) * secondsInDay

print("Количество секунд с начала года до моего дня рождеения - \(secondsUntilBirthday).\n")


// 2. Посчитайте в каком квартале вы родились

let monthsInQuarter = 3
let quarter = (birthdayMonth - 1) / monthsInQuarter + 1

if quarter < 1 || quarter > 4 {
    print("Invalid value")
} else {
    print("Я родился в \(quarter) квартале.")
}






// 3. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h
enum File: Int { //vertical numbers
    case one = 1, two, three, four, five, six, seven,  eight
}

enum Rank: Int {
    case a = 1, b, c, d, e, f, g, h
}

let file: File = .eight
let rank: Rank = .d

if (file.rawValue + rank.rawValue) % 2 == 0 {
    print("BBC")
} else {
    print("opposite 4 BBC no one know what is it")
}

//for vertical in 1...8 {
//    for horizontal in 0..<letters.count {
//        if vertical % 2 == 0 || horizontal % 2 == 0 {
//            print("1")
//        } else {
//            print("0")
//        }
//    }
//}

//if (vertical + horizontal) % 2 == 0 && vertical > 0 && horizontal > 0 && vertical < 9 && horizontal < 9 {
//    print("black square")
//} else if (vertical + horizontal) % 2 == 1 && vertical > 0 && horizontal > 0 && vertical < 9 && horizontal < 9 {
//    print("white square")
//} else {
//    print("Invalid inserted value.")
//}

