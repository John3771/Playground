
/*
 1. Создать тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y.
 Реализовать функцию, которая красивенько текстом будет показывать положение персонажа в комнате
 */

class Room {
    let width: Int
    let height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}

class NPC {
    var coordinateX: Int
    var coordinateY: Int
    let room: Room
    
    enum Direction: String {
        case left = "left"
        case right = "right"
        case up = "up"
        case down = "down"
    }

    
    init(coordinateX: Int, coordinateY: Int, in room: Room) {
        self.coordinateX = coordinateX
        self.coordinateY = coordinateY
        self.room = room
    }
    
    func findPosition(in room: Room) -> String {
        return "Наш челик находится в комнате размером \(room.width) на \(room.height). А сам он стоит в точке \(coordinateX)x\(coordinateY)"
    }
    
    func move(_ direction: Direction) {
        switch direction {
        case .left:
            if coordinateX > 0 { coordinateX -= 1 }
        case .right:
            if coordinateX < room.width { coordinateX += 1 }
        case .up:
            if coordinateY > 0 { coordinateY -= 1 }
        case .down:
            if coordinateY < room.height { coordinateY += 1 }
        }
    }
}

let room = Room(width: 200, height: 200)
let npcPlace = NPC(coordinateX: 100, coordinateY: 100, in: room)
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

class Box {
    var coordinateX: Int
    var coordinateY: Int
    let room: Room
    
    init(coordinateX: Int, coordinateY: Int, room: Room) {
        self.coordinateX = coordinateX
        self.coordinateY = coordinateY
        self.room = room
    }
}

extension NPC {
    func findPosition(in room: Room, with box: Box) -> String {
        return "Наш челик находится в комнате размером \(room.width) на \(room.height). А сам он стоит в точке \(coordinateX)x\(coordinateY). Коробка расположена рядом с ним по координатам \(box.coordinateX) \(box.coordinateY)"
    }
}

let box = Box(coordinateX: 111, coordinateY: 91, room: room)

print(npcPlace.findPosition(in: room, with: box))

/*
 4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигать ящик
 */

    // допустим чел подходит к ящику... так это мне наверное надо расширить наш блок enum с проверкой по координатам ящика и если они совпадают то двигать ящик в +\- 1 при этом проверяя чтоб за границы комнаты он не вылазил. Соответственно в зависимости от граница либо прибавлять либо выетать значение.


    //MARK: Абсолютно невыполнимо

    /*
     4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигать ящик :)
     5. Добавить точку в комнате, куда надо ящик передвинуть и двигайте :)
     6. Можно добавить массив ящиков и можете сделать консольное приложение

     */
