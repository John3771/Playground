/* 1. Создать пять строковых констант
 
+ Одни константы это только цифры, другие содержат еще и буквы
+ Найти сумму всех этих констант приведя их к Int используйте оператор ??

 Когда посчитаете сумму, то представьте свое выражение в виде строки

 Например: 5 + nil + 2 + 3 + nil = 10
 
но в первом случае используйте интерполяцию строк,
а во втором конкатенацию
*/

let string1: String? = "123"
let string2: String? = "a2"
let string3: String? = "95"
let string4: String? = "c7"
let string5: String? = "m9"

//let int1 = Int(string1 ?? "") ?? 0
//let int2 = Int(string2 ?? "") ?? 0
//let int3 = Int(string3 ?? "") ?? 0
//let int4 = Int(string4 ?? "") ?? 0
//let int5 = Int(string5 ?? "") ?? 0

let int1 = Int(string1 ?? "") ?? 0
let int2 = Int(string2 ?? "") ?? 0
let int3 = Int(string3 ?? "") ?? 0
let int4 = Int(string4 ?? "") ?? 0
let int5 = Int(string5 ?? "") ?? 0

let sum = int1 + int2 + int3 + int4 + int5
print(sum)

let resultConcat = String(int1) + " + " + String(int2) + " + " + String(int3) + " + " + String(int4) + " + " + String(int5) + " = " + String(sum)

print("сумма всех преобразованных чисел - \(int1 + int2 + int3 + int4 + int5)")
print(resultConcat)

/* 2. Создать строку английский алфавит, все буквы малые от a до z
задать константу - один из символов этого алфавита
Используя цикл for, определить под каким индексов в строке находится этот символ
*/

let alphabet = "abcdefghigklmnopqrstuvwxyz"

let randomCharacterFromAlphabet: Character = "b"

//for char in alphabet {
//    if randomCharacterFromAlphabet == alphabet {
//        print(alphabet[char])
//    }
//}

//for (index, char) in alphabet.enumerated() {
//    if char == randomCharacterFromAlphabet {
//        print("Символ \(char) находится под индексом \(index)")
//    }
//}

var index = 0

for char in alphabet {
    if char == randomCharacterFromAlphabet {
        print("Выбранная юуква - '\(char)' расположена по индексу \(index)")
    }
    index += 1
}
