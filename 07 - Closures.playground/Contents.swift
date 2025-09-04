
/*
 1. Написать функцию, которая ничего не возвращает
 и принимает только один клоужер, который ничего не принимает и ничего не возвращает.
 Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер.
 Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
 */

func weirdFunc(_ closure: () -> Void) -> Void {
    for i in 1...10 {
        print(i)
    }
    closure()
}

weirdFunc {
    print("Kinda mmmmmmmmmmmmmmmmmmmmmmmmmmm")
}

/*
 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
 */

let integers = [4, 5, 12, 77, 34, 25, 19]

let inAscendingOrder = integers.sorted(by: >)
let inDescendingOrder = integers.sorted(by: <)

print(inAscendingOrder)
print(inDescendingOrder)

/*
 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт.
 Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет.
 В самой функции создайте опшинал переменную.
 
 Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер.
 Если клоужер возвращает да, то вы записываете значение массива в переменную.
 
 в конце функции возвращайте переменную.
 */

func findElement(in array: [Int], using closure: (Int, Int?) -> Bool) -> Int? {
    var temp: Int? = nil
    
    for element in array {
        if closure(element, temp) {
            temp = element
        }
    }
    return temp
}

let maxElement = findElement(in: integers) { current, temp in
    temp == nil || current > temp!
}

print(maxElement ?? 0)

/*
 4. Создайте произвольную строку.
 +Преобразуйте ее в массив букв.
 Используя метод массивов sorted
 отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке,
 потом согласные, потом цифры, а потом символы
 */
let randomString = "An operator is a special symbol or phrase that you use to check, change, or combine values. For example, the addition operator (+) adds two numbers, as in let i = 1 + 2, and the logical AND operator (&&) combines two Boolean values, as in if enteredDoorCode && passedRetinaScan."
let char = Array(randomString)
//print(char)

func group(for char: Character) -> Int {
    let vowels = "aeiouyAEIOUY"
    if vowels.contains(char) {
        return 0
    } else if char.isLetter {
        return 1
    } else if char.isNumber {
        return 2
    } else {
        return 3
    }
}

let sortedArray = char.sorted { char1, char2 in
    let g1 = group(for: char1)
    let g2 = group(for: char2)
    
    if g1 == g2 {
        return String(char1).lowercased() < String(char2).lowercased()
    } else {
        return g1 < g2
    }
}

let result = String(sortedArray)
print(result)
