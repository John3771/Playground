//
//  main.swift
//  testing
//
//  Created by Artiom on 08.09.25.
//

import Foundation

//*
// 1. Создать тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y.
// Реализовать функцию, которая красивенько текстом будет показывать положение персонажа в комнате
// */

struct Room {
    let width: Int
    let height: Int
}

struct Coordinates {
    var coordinateX: Int
    var coordinateY: Int
}

struct NPC {
//    var coordinateX: Int
//    var coordinateY: Int
    var userCoordinates: Coordinates
    let room: Room
    

    
    func findPosition(in room: Room) -> String {
        return "Наш челик находится в комнате размером \(room.width) на \(room.height). А сам он стоит в точке \(userCoordinates.coordinateX)x\(userCoordinates.coordinateY)"
    }
    
    enum Direction: String {
        case left = "left", right = "right", up = "up", down = "down"
    }
    
    mutating func move(_ direction: Direction) {
        switch direction {
        case .left:
            if userCoordinates.coordinateX > 0 { userCoordinates.coordinateX -= 1 }
        case .right:
            if userCoordinates.coordinateX < room.width { userCoordinates.coordinateX += 1 }
        case .up:
            if userCoordinates.coordinateY > 0 { userCoordinates.coordinateY -= 1 }
        case .down:
            if userCoordinates.coordinateY < room.height { userCoordinates.coordinateY += 1 }
        }
    }
}

let room = Room(width: 200, height: 200)
var npcPlace = NPC(userCoordinates: Coordinates(coordinateX: 100, coordinateY: 100), room: room)
print(npcPlace.findPosition(in: room))


/*
 2. Персонажу добавить метод идти, который принимает энумчик лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализовать правило что персонаж не должен покинуть пределы комнаты. Подвигать персонажа и покажите это графически
 */

npcPlace.move(.down)
npcPlace.move(.right)
print(npcPlace.findPosition(in: room))

/*
 3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 */

struct Box {
    var boxCoordinates: Coordinates
    var room: Room
    
    enum Direction: String {
        case left = "left", right = "right", up = "up", down = "down"
    }
    
    mutating func move(_ direction: Direction) {
        switch direction {
        case .left:
            if boxCoordinates.coordinateX > 0 { boxCoordinates.coordinateX -= 1 }
        case .right:
            if boxCoordinates.coordinateX < room.width { boxCoordinates.coordinateX += 1 }
        case .up:
            if boxCoordinates.coordinateY > 0 { boxCoordinates.coordinateY -= 1 }
        case .down:
            if boxCoordinates.coordinateY < room.height { boxCoordinates.coordinateY += 1 }
        }
    }

}
//
extension NPC {
    func findPosition(in room: Room, with box: Box) -> String {
        return "Наш челик находится в комнате размером \(room.width) на \(room.height). А сам он стоит в точке \(self.userCoordinates.coordinateX)x\(self.userCoordinates.coordinateY). Коробка расположена рядом с ним по координатам \(box.boxCoordinates.coordinateX) \(box.boxCoordinates.coordinateY)"
    }
}

let box = Box(boxCoordinates: Coordinates(coordinateX: 111, coordinateY: 99), room: room)

print(npcPlace.findPosition(in: room, with: box))

    // допустим чел подходит к ящику... так это мне наверное надо расширить наш блок enum с проверкой по координатам ящика и если они совпадают то двигать ящик в +\- 1 при этом проверяя чтоб за границы комнаты он не вылазил. Соответственно в зависимости от граница либо прибавлять либо выетать значение.


    //MARK: Абсолютно невыполнимо

    /*
     4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигать ящик :)
     5. Добавить точку в комнате, куда надо ящик передвинуть и двигайте :)
     6. Можно добавить массив ящиков и можете сделать консольное приложение
     */

// 1 Куда хочет челик попасть.
// 2 Двигаем ящик куда-то тоже хочет попасть

//if (110 < 200 && 110 > 0) || (210 < 200 && 210 > 0) {
//    print("123321123321")
//}
 
extension NPC {
    mutating func moveUser(to destination: Coordinates, in room: Room, with box: inout Box) -> String {
        if (destination.coordinateX > room.width || destination.coordinateX < 0) || (destination.coordinateY > room.height || destination.coordinateY < 0) {
            return "Нельзя перейти за границы комнаты"
        }
        print("Изначально челик на позиции: \(userCoordinates)")
        
//        let raznica = destination.coordinateX - userCoordinates.coordinateX
        let arrayOfXCoordinates: [Int] = Array (userCoordinates.coordinateX+1...destination.coordinateX)
        let arrayOfYCoordinates: [Int] = Array (userCoordinates.coordinateY...destination.coordinateY)
        while (userCoordinates.coordinateX != destination.coordinateX || userCoordinates.coordinateY != destination.coordinateY) {
            arrayOfXCoordinates.forEach { nextStep in
                if nextStep == box.boxCoordinates.coordinateX {
                    if box.boxCoordinates.coordinateY + 1 > room.height {
                        box.move(.up)
                    } else {
                        box.move(.down)
                        move(.right)
                    }
                } else {
                    move(.right)
                    print(nextStep)
                }
            }
//            arrayOfYCoordinates.forEach { nextStep in
//                if nextStep == box.boxCoordinates.coordinateY {
//                    box.move(.left)
//                } else {
//                    move(.up)
//                }
//            }
        }
        
        return "Ящик находится на \(box.boxCoordinates.coordinateX)x\(box.boxCoordinates.coordinateY). А челик перешел на \(userCoordinates.coordinateX)х\(userCoordinates.coordinateY)"
    }
}
print(repeatElement("------", count: 10))

let ourRoom = Room(width: 200, height: 200)
var ourBox = Box(boxCoordinates: Coordinates(coordinateX: 105, coordinateY: 100), room: ourRoom)
var ourNPC = NPC(userCoordinates: Coordinates(coordinateX: 100, coordinateY: 100), room: ourRoom)

let finalDestination = Coordinates(coordinateX: 110, coordinateY: 100)

print(ourNPC.moveUser(to: finalDestination, in: ourRoom, with: &ourBox))




// 100 100 -> 107 100 ----> 95 100.
// [100, 101, 102, 103 ..., 107] -> BoxX containts 105. 101
// while User.coordinatesX != 107 {
// ----------- if user boxX-1 {
// Box move Y verhx, Vniz.
// 107 !!!
// Y

//200 200. 195x200  200x200
