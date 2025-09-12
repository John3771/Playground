
/*
1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"
*/

class Artist {
    var name: String
    var surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func perform() { }
}

class Painter: Artist {
    var stageName: String
    
    init(name: String, surname: String, stageName: String) {
        self.stageName = stageName
        super.init(name: stageName, surname: name)
    }
    
    override func perform() {
        print("I really love sniffing paint. Filling so fucking high after... Wait... what we r here about? Oh.. u know me like a \(name). Soooo... sup.")
    }
}

class Singer: Artist {
    
    override func perform() {
        print("\(name) \(surname) on the stage! And the \"Gay as fuck\" song for you!")
    }
}

class Dancer: Artist {
    
    override func perform() {
        print("Just wanna dance")
    }
}


let martin = Singer(name: "Martin", surname: "Gayking")
martin.perform()

let obey = Painter(name: "Shon", surname: "Landlord", stageName: "Obey Hook")
obey.perform()

print()

var artists = [martin, obey] //получается этот массив как раз про полиморфизм - у нас константы одного типа Артист но функции выполняют разные действия.

for artist in artists {
    artist.perform()
}

/*
 2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed).
 
 Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки.
 
 + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств.
 
 Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок).
Используем полиморфизм
*/

class Vehicle {
    var distance: Int
    var speed: Int { 0 }
    var capasity: Int { 1 }
    var cost: Int { 0 }
//    var costmultiplyer: Int
//    var cost: Int {
//        costmultiplyer * (distance / capasity)
//        10 * (distance / capasity)
//    }
    
    init(distance: Int) {
        self.distance = distance
    }
    
//    init(speed: Int, capasity: Int, distance: Int) {
//        self.speed = speed
//        self.capasity = capasity
//        self.distance = distance
//    }
    
    func travelInfo(for people: Int) {
//        let trips = (people / capasity - 1) / capasity
        let time = distance / speed
//        let totalCost = cost * trips
        print("For \(time) hours we deliver \(people) people. The cost will be \(cost * people) eurobucks per people.")
    }
    
//    func timeToTravel(distance: Int, speed: Int) -> String {
//        let time = distance / speed
//        return "time to travel - \(time) hours."
//    }
}

class Car: Vehicle {
    override var speed: Int { 60 }
    override var capasity: Int { 4 }
    override var cost: Int { 70 * (distance / capasity) }
}

class Airplane: Vehicle {
    override var speed: Int { 600 }
    override var capasity: Int { 100 }
    override var cost: Int { 40 * (distance / capasity) }
}

class Helicopter: Vehicle {
    override var speed: Int { 160 }
    override var capasity: Int { 4 }
    override var cost: Int { 120 * (distance / capasity) }
}

class Ship: Vehicle {
    override var speed: Int { 40 }
    override var capasity: Int { 800 }
    override var cost: Int { 20 * (distance / capasity) }
}

let car = Car(distance: 800)
car.travelInfo(for: 4)

let air = Airplane(distance: 2400)
air.travelInfo(for: 50)

/*
 3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
 - Создайте по пару объектов каждого класса.
 - Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
 - Сколько четвероногих?
 - Сколько здесь животных?
 - Сколько живых существ?
 */


