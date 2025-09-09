
/*
 1. Создать класс студент со свойствами имя, фамилия и фраза приветствия.
 2. Создать 10 - 15 объектов этого класса.
 */

class Student {
    let name: String
    let surname: String
    let greeting: String
    
    init(name: String, surname: String, greeting: String) {
        self.name = name
        self.surname = surname
        self.greeting = ("\(greeting) \(name)")
    }
}

let studentOne = Student(
    name: "Frank",
    surname: "Ocean",
    greeting: "sup G"
)

let studentTwo = Student(
    name: "Emily",
    surname: "Straight",
    greeting: "Hi"
)

let studentThree = Student(
    name: "Clark",
    surname: "Rain",
    greeting: "wasup"
)

let studentFour = Student(
    name: "Sheena",
    surname: "Shown",
    greeting: "Nice 2 meet u"
)

let studentFive = Student(
    name: "Malcolm",
    surname: "X",
    greeting: "KKK 💋"
)

print(studentFive.greeting)

/*
 2. Создать словарь типо школьный журнал, где ключ будет фамилия + имя, а значение сам студент.
 */

var journal: [String: Student] = [:]
var students = [
    studentOne,
    studentTwo,
    studentThree,
    studentFour,
    studentFive
]

for student in students {
    let key = "\(student.name) \(student.surname)"
    journal[key] = student
}

/*
 3. Распечатать дикшинари
 4. В цикле пройтись по всем ключам в словаре и распечатать имя и фамилию каждого студента + его фразу приветствия.
 */

for (key, value) in journal {
    print("\(key): \(value.greeting)")
}

// какая-то строка для проверки пул реквеста
