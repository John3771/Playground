
/*
 1. Создать структуру студент. Добавить свойства: имя, фамилия, год рождения, средний бал. Создать несколько экземпляров этой структуры и заполнить их данными. Положить их всех в массив (журнал).
 */

var journal: [Student] = []

struct Student {
    let name: String
    let surname: String
    let birthday: String
    let averageGradePoint: Double
//    
//    init(name: String, surname: String, birthday: String, averageGradePoint: Double) {
//        self.name = name
//        self.surname = surname
//        self.birthday = birthday
//        self.averageGradePoint = averageGradePoint
//        Student.journal.append(self)
//    }
//    
//    static var journal: [Student] = []
}

let firstStudent = Student(
    name: "Alfredo",
    surname: "Gonzles",
    birthday: "25.01.1997",
    averageGradePoint: 4.3
)

let secondStudent = Student(
    name: "Andre",
    surname: "Johanson",
    birthday: "17.09.1982",
    averageGradePoint: 3.9
)

let thirdStudent = Student(
    name: "Florida",
    surname: "Shane",
    birthday: "29.05.1999",
    averageGradePoint: 4.1
)

journal.append(contentsOf: [firstStudent, secondStudent, thirdStudent])

/*
 2. Написать функцию, которая принимает массив студентов
 и выводит в консоль данные каждого.
 Перед выводом каждого студента добавлять порядковый номер в “журнале”,
 начиная с 1.
 */

func printInformationAboutStudents(in collection: [Student]) {
    var prefix = 0
    for i in collection {
        prefix += 1
        print("\(prefix) - \(i.name) \(i.surname), birthday: \(i.birthday), average grade point - \(i.averageGradePoint)")
    }
}

printInformationAboutStudents(in: journal)

/*
 3. С помощью функции sorted отсортировать массив по среднему баллу,
 по убыванию и распечатать “журнал”.
 */

let sortedJournal = journal.sorted { $0.averageGradePoint > $1.averageGradePoint }

//let sortedJournal = journal.sorted { Student1, Student2 in
//    Student1.averageGradePoint > Student2.averageGradePoint
//}

printInformationAboutStudents(in: sortedJournal)
