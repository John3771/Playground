
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
        self.greeting = ("Hello \(name)")
    }
}

let studentOne = Student(
    name: "Frank",
    surname: "Ocean",
    greeting: "sup G"
)

print(studentOne.greeting)













