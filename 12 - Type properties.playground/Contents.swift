import Foundation
/*
 1. Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)
 Главная задача - это использовать правильные свойства там, где нужно,
 чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
 */

/*
 1.    Путь к файлу / папке
Вместо String обычно используют URL с указанием fileURLWithPath:
 
 2.    Имя файла
 Его можно хранить как отдельное свойство fileName: String, либо вычислять из fileURL.lastPathComponent. Чтобы не дублировать данные, лучше оставить только URL, а имя получать через вычисляемое свойство.
 
 3.    Максимальный размер файла
В реальных API для размера используют Int или UInt64 (байты). Для удобства в учебном задании можно сделать maxSizeInBytes: Int.
 
 Мои мысли - Максимальный размер при этом в байтах в UInt64 - примерно 16 эксабайт. Что крайне излишне. Особенно для мобильной разработки. Тогда имеет ли смысл использовать именно UInt64? окей. Мы делаем невозможным отрицательное значение файла, но возможно ли вообще чтоб что-то имело отрицательный размер? Простой инт соответствует разрядности системы - у эпла она везде 64. Будет ли вариант UInt16 являться в какой-то степени оптимизацией? Плюс размер файла ограничен файловой системой. Наверняка все эти значения очень далеки от 16EB.
 
 Ответ GPT - окей - UInt16 - слишком мало - всего 16 кб и разницы в сложности никакой нет. Так что вообще не стоит думать о единицах измерения размера.
 - по поводу отрицательного размера - тоже не важно. Даже если ты его каки-мто образом получишь, то фс все равно вернет неотрицательное значение.
 
 4.    Тип файла (скрытый или нет)
 Булевое поле isHidden: Bool — это нормально. В macOS/iOS система определяет скрытые файлы по точке в имени, так что можно тоже вычислять через fileName.hasPrefix(".").
 */
//struct Description {
//    let fileName: String
//    let fileURL: String
//    let folderURL: String
//    let maxSizeInBytes: Int
//    let isHide: Bool
//    let data: [String]
//}

struct FileDescription {
    let fileURL: URL
    let maxSizeInBytes: Int
    var content: Data //что-то очень сложное. Забить хуй
    var isHidden: Bool {
        fileURL.lastPathComponent.hasPrefix(".")
    }
    
    var fileName: String {
        fileURL.lastPathComponent
    }
    
    var folderURL: URL {
//        fileURL.absoluteString
//        fileURL.deletingLastPathComponent() //ошибка потому что в данном случае возвразается URL а не строка в отличии от .lastPathComponent
        fileURL.deletingLastPathComponent()
            
    }
}

/*
 2. Создать энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавить в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
 
 Что написано в задании

 ...

 Где возникает несостыковка
     1.    Ты сделал так:
 case red = "FFFFFF"

 Ошибка в том, что "FFFFFF" — это строка, а не Int. Компилятор сразу скажет: «чувак, rawValue должен быть Int».

 2.    Что имели в виду авторы задания:
«3-байтное представление цвета» — это число в шестнадцатеричном виде, например:
 •    красный 0xFF0000
 •    зелёный 0x00FF00
 •    синий 0x0000FF
Это просто целые числа (Int), записанные в 16-ричной системе.
 
 */

enum ColorWheel: Int, CaseIterable { // чтоб пройтись по элементам энама надо чтоб этот педик соответствовал протоколу CaseIterable
    case red = 0xFF0000
    case blue = 0x00FF00
    case green = 0x0000FF
    
    static var numberOfStoredColors: Int {
        ColorWheel.allCases.count
}
    static var firstColor: ColorWheel { .red }
    static var lastColor: ColorWheel { .green }
}

/*
 3. Создать класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавить несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
 */

@MainActor class Human {
    let name: String
    let surname: String
    let age: Int
    let height: Double
    let weight: Double
    
    //static используется для хранения значений чтоб были общими для каждого экземпляра
    static let minAge = 0
    static let maxAge = 110
    
    static let minNameLenght = 2
    static let maxNameLenght = 20
    
    static let minHeight = 20.0
    static let maxHeight = 240.0
    
    static let minWeight = 3.0
    static let maxWeight = 300.0
    
    static var instanceCount = 0 //ебаная ошибка - особенность новой версии свифта. чет с многопоточность. связано. Пока присваиваем ьэйнактор и не выебываемся -> присваивание его переменной instanceCount не решает проблему - тогда нужно писать еще какой-то громоздкий код при присваивании нового значения. Но можно присвоить мэйн актор самому классу тогда проблема решается.
    
    //Почему инициализатор опциональный? окей. при распаковке в любом случае нужен опционал, точно. Значения то может и не быть.
    init?(name: String, surname: String, age: Int, height: Double, weight: Double) {
        guard age >= Human.minAge && age <= Human.maxAge,
              name.count >= Human.minNameLenght && name.count <= Human.maxNameLenght,
              surname.count >= Human.minNameLenght && surname.count <= Human.maxNameLenght,
              height >= Human.minHeight && height <= Human.maxHeight,
              weight >= Human.minWeight && weight <= Human.maxWeight
        else { return nil }
        
        self.name = name
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.instanceCount += 1
    }
    
    
}
