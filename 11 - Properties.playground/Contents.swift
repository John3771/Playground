import Foundation
import SwiftUI
/*
 1. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
 */

class Student {
    let name: String
    let surname: String
    let greeting: String
    let birthday: Birthday
    
    init(
        name: String,
        surname: String,
        greeting: String,
        birthday: Birthday
    ) {
        self.name = name
        self.surname = surname
        self.greeting = ("\(greeting) \(name)")
        self.birthday = birthday
    }
}

struct Birthday {
    let day: Int
    let month: Int
    let year: Int
    
    var age: Int {
        let currentYear = 2025
        let currentMonth = 10
        let currentDay = 10
        
        var age = currentYear - year
        
        if (month > currentMonth) || (month == currentMonth) && (day > currentDay) {
            age -= 1
        }
        
        return age
    }
    
    var yearsStudied: Int {
        let studiedYears = max(0, age - 6)
        return studiedYears
    }
}

/*
 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки».
 Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е.
 Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties).
 Добавить два computed properties: «середина отрезка» и «длина» (считать математическими функциями)
 */

//MARK: что за структура "точка" уже существующая так и не понял

struct Segment {
    
    struct PointA {
        var coordinate: Double
    }
    
    struct PointB {
        var coordinate: Double
    }
    
    var a: PointA
    var b: PointB
    
    var middleOfPoint: Double {
        get { // читаем значение
            (a.coordinate + b.coordinate) / 2
        }
        set { // вписываем новое значение       segment.middleOfPoint = 200 -> newValue = 200
            let currentMiddle = (a.coordinate + b.coordinate) / 2
            let shift = newValue - currentMiddle
            a.coordinate += currentMiddle
            b.coordinate += currentMiddle
        }
    }
    
    var lenght: Double {
        a.coordinate + b.coordinate
    }
}

let pointA = Segment.PointA(coordinate: 10)
let pointB = Segment.PointB(coordinate: 20)

var segment = Segment(a: pointA, b: pointB)
//let lenght = segment.lenght


print("середина - \(segment.middleOfPoint)")
print(segment.lenght)

/*
 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
 
 че от меня хотят?
 
 Сейчас твои middleOfPoint и lenght — это только вычисляемые свойства (get-only). Ты их можешь читать, но не можешь менять.
 Задание хочет, чтобы они стали вычисляемыми свойствами с get и set. То есть:
     1.    Когда ты читаешь segment.middleOfPoint, оно считает середину по формулам.
     2.    Когда ты присваиваешь segment.middleOfPoint = 100, твой код должен «сдвинуть» точки так, чтобы середина оказалась в 100.
 */


segment.middleOfPoint = 200
print(segment.middleOfPoint)



//
//let numbers = [1, 2, 3, 4, 5, 6, 78]
//
//numbers.filter { !isPrime($0) }
