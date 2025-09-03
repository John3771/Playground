
/*
 1. Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквы. Найти сумму всех этих констант приведя их к Int. (Используйте и optional binding и forced unwrapping)
 */

let string1: String? = "123"
let string2: String? = "a2"
let string3: String? = "95"
let string4: String? = "c7"
let string5: String? = "m9"

var sum = 0

//if let string1 {
//    Int(string1)
//} else {
//    string1 = nil
//}

//if let sum = string1 + string2 + string3 + string4 + string5 {
//    
//}

if let unwrappedString1 = Int(string1!) {
    sum += unwrappedString1
}
if let unwrappedString2 = Int(string2!) {
    sum += unwrappedString2
}
if let unwrappedString3 = Int(string3!) {
    sum += unwrappedString3
}
if let unwrappedString4 = Int(string4!) {
    sum += unwrappedString4
}
if let unwrappedString5 = Int(string5!) {
    sum += unwrappedString5
}

print(sum)



/*
 2. С сервера к нам приходит тюпл с тремя параметрами: statusCode, message, errorMessage (число, строка и строка) в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле если statusCode от 200 до 300 исключительно, то выводите message, в противном случает выводите errorMessage. После этого проделать тоже самое только без участия statusCode
 */

let serverAnswer = (statusCode: 404, message: "Something went wrong", errorMessage: "server doesn't responde")

if serverAnswer.statusCode > 200 && serverAnswer.statusCode < 300 {
    print(serverAnswer.message)
} else {
    print(serverAnswer.errorMessage)
}
print()

/*
 3. Создать 5 тюплов с тремя параметрами: имя, номер машины, оценка за контрольную. при создании этих тюплов не должно быть никаких данных, после создания каждому студенту установите имя, некоторым установить номер машины, некоторым установить результат контрольной .
 вывести  в консоль:
 - имена студента
 
 - есть ли у него машина
 - если да, то какой номер
 
 - был ли на контрольной
 - если да, то какая оценка
 */


var collection1: (name: String, carNumber: Int?, markOnTheTest: String?)
var collection2: (name: String, carNumber: Int?, markOnTheTest: String?)
var collection3: (name: String, carNumber: Int?, markOnTheTest: String?)
var collection4: (name: String, carNumber: Int?, markOnTheTest: String?)
var collection5: (name: String, carNumber: Int?, markOnTheTest: String?)

collection1 = (name: "Frank", carNumber: 223, markOnTheTest: "A")
collection2 = (name: "Joshua", carNumber: nil, markOnTheTest: "F+")
collection3 = (name: "Elizbeth", carNumber: 932, markOnTheTest: nil)
collection4 = (name: "Brad", carNumber: 291, markOnTheTest: "C")
collection5 = (name: "Kim", carNumber: nil, markOnTheTest: "A")

let students = [collection1, collection2, collection3, collection4, collection5]

//if collection1.carNumber != 000 && collection1.markOnTheTest != "" {
//    print("Student name is \(collection1.name). His car number is \(collection1.carNumber). And he has mark on the test - \(collection1.markOnTheTest)")
//} else if collection1.carNumber == 000 {
//    print("Student name is \(collection1.name). Has no car. And he has mark on the test - \(collection1.markOnTheTest)")
//} else if collection1.markOnTheTest == "" {
//    print("Student name is \(collection1.name). His car number is \(collection1.carNumber). And he has mark on the test - \(collection1.markOnTheTest)")
//}

for student in students {
    print("student name is \(student.name)")
    
    if let car = student.carNumber {
        print("Has a car with number \(car)")
    } else {
        print("Has no car")
    }
    
    if let mark = student.markOnTheTest {
        print("Was on the test. Mark: \(mark)")
    } else {
        print("This fucking faggot skip sacred day!")
    }
    print()
}

