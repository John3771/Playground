import Foundation
/*
 1. Реализовать протоколы Jumpers, Swimmers, Runners. Каждый протокол должен иметь пару свойств, например, скорость или максимальная высота прыжка и пару методов, например прыгать или плыть,  нырять и тд.
 */

protocol Jumpers {
    var maxJumpHeight: Double { get }
    func jump(toHeight height: Double) -> String
}

protocol Swimmers {
    var maxSpeed: Double { get }
    func dive(for durationMinutes: TimeInterval) -> String
}

protocol Runners {
    var maxDistance: Int { get }
    func accelerate(for minutes: TimeInterval) -> String
}

//MARK: Extensions
// ГПТ говорит лучше дефолтные штуки реализовать.
extension Jumpers {
    func jump(toHeight height: Double) -> String {
        let success = height <= maxJumpHeight
        return success
        ? "Jumped to \(height)m (max \(maxJumpHeight)m)"
        : "Failed to jump to \(height)m (max \(maxJumpHeight)m"
    }
}

extension Swimmers {
    func dive(for durationMinutes: TimeInterval) -> String {
        return "Dived for \(durationMinutes) with maximum speed \(maxSpeed)m/s."
    }
}

extension Runners {
    func accelerate(for minutes: TimeInterval) -> String {
        return "Accelerated for \(minutes) minutes, and I can run up to \(maxDistance)m"
    }
}

/*
 2. Используйте классы из задания про наслоедование, там где у вас люди и животные. Например у обезьяны и у особых людей реализуйте протокол Jumpers, тоже самое с другими протоколами. Пусть каждый протокол будет реализован как некоторыми классами животных, так и некоторыми классами людей.
 */

class Animal {
    let legs: Int
    let isAnimal = true
    
    init(legs: Int) { self.legs = legs }
}

class Mammal: Animal { let isWarmBlooded = true }

class Reptile: Animal { let isColdBlooded = true }

    //MARK: основные классы

class Human: Mammal, Jumpers, Runners, Swimmers {
    let maxDistance: Int = 42000
    let maxJumpHeight: Double = 1.6
    let maxSpeed: Double = 5.5
    
    func brainDamage() {
        print("tiktok maxing for 16 hours straight.")
    }
    
    func jump(toHeight height: Double) -> String {
        return height <= maxJumpHeight
        ? "Human jumped to \(height)m"
        : "Human couldn't jump that hight"
    }
    
    func dive(for durationMinutes: TimeInterval) -> String {
        "Im fucking humans champion and can swim under water really long time. Think I'm kidding? Look at this - my record is \(durationMinutes)"
    }
}

class Monkey: Mammal, Jumpers {
    var maxJumpHeight: Double = 3.0
    
    func monkeyBuisness() {
        print("I'm monkey. And what? At least i dont give a shit bout ur kind of problems whatever it is.")
    }
    
    func jump(toHeight height: Double) -> String {
        "TF dude! Look at this! I can jump over \(height) meters"
    }
}

class Crocodile: Reptile, Swimmers {
    var maxSpeed: Double = 20
    
    func bagDealer() {
        print("Living life to become a whore’s handbag")
    }
    
    func dive(for durationMinutes: TimeInterval) -> String {
        "Really love spend my time under water in this swarm. I can dive for \(durationMinutes / 60) minutes. And btw i can sweem as fast as \(maxSpeed)km/h. Fucking turbo crocodile."
    }
}

class Dog: Mammal, Runners, Jumpers {
    var maxJumpHeight: Double = 2.0
    var maxDistance: Int = 20000
    
    func bark() {
        print("Bark! Bark!... fucking trashbag. What r u looking 4!? Give some food!!!!")
    }
}

class Giraffe: Mammal, Runners {
    var maxDistance: Int = 5000
    
    func girafeLife() {
        print("just wanna some leafs")
    }
}

/*
 3. Положите всех в одни массив.
 Тех кто прыгает заставьте прыгать и рассказывать про свои свойства.
 Причем у некоторых объектов пусть будут одни необязательные свойства или методы, а у других другие.
 Тот кто бегает пусть бегает, а тот кто плавает, пусть плавает. Тот кто ничего не делает должен быть выведен на экран как лодырь :)
*/

let dude1 = Human(legs: 2)
let dude2 = Human(legs: 2)

let monkey1 = Monkey(legs: 4)
let monkey2 = Monkey(legs: 4)

let croco1 = Crocodile(legs: 4)
let croco2 = Crocodile(legs: 4)

let dog1 = Dog(legs: 4)
let dog2 = Dog(legs: 4)

let giraffe1 = Giraffe(legs: 4)
let giraffe2 = Giraffe(legs: 4)

let creatures = [dude1, dude2, monkey1, monkey2, croco1, croco2, dog1, dog2, giraffe1, giraffe2]

for creature in creatures {
    var lazyAsshole = true
    
    if let jumper = creature as? Jumpers {
        print("\(type(of: jumper)) jumped: \(jumper.jump(toHeight: 1))")
        lazyAsshole = false
    }
    
    if let runner = creature as? Runners {
        print("\(type(of: runner)) ran: \(runner.accelerate(for: 175))")
        lazyAsshole = false
    }
    
    if let swimmers = creature as? Swimmers {
        print("\(type(of: swimmers)) swam: \(swimmers.dive(for: 900))")
        lazyAsshole = false
    }
    
    if lazyAsshole {
        print("\(type(of: creature)) - Gleb")
    }
}

/*
5. Сделайте так чтобы один какой-то класс мог и бегать и прыгать и плавать и посмотрите как он себя поведет в цикле.
*/
print()
for creature in creatures {
    var didSomething = false
    
    if let all = creature as? (Jumpers & Runners & Swimmers) {
        print("\(type(of: creature)): has every skill")
        print("Jump: \(all.jump(toHeight: 20)). - max jump height is \(all.maxJumpHeight)")
        print("Run \(all.accelerate(for: 600)). - max distance in this way is \(all.maxDistance)")
        print("Swim with maximum speed\(all.maxSpeed) and dive after for \(all.dive(for: 1299)) minutes.")
    }
}






print()


















class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// the type of "library" is inferred to be [MediaItem]

var moviesCount = 0
var songsCount = 0

for item in library {
    if item is Movie {
        moviesCount += 1
    } else if item is Song {
        songsCount +=  1
    }
}

print()
print("Library content - \(moviesCount) movies and \(songsCount) songs in our library.")

print()
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(-10.0)
things.append(42)
things.append(420)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append(Song(name: "Thriller", artist: "Michel Jackson"))
things.append({ (name: String) -> String in "Hello, \(name)" })

print()
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as integer")
    case 0 as Double:
        print("zero as double")
    case let someInt as Int:
        print("integer value as \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a possible value of Double is \(someDouble)")
    case is Double:
        print("some other double that i dont want to print")
    case let negativeDouble as Double where negativeDouble < 0:
        print("The negative double of \(negativeDouble)")
    case let someString as String:
        print("a string value of \(someString)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x)\(y)")
    case let movie as Movie:
        print("The movie called \(movie.name), dir is \(movie.director)")
    case let song as Song:
        print("trash song called \(song.name) by \(song.artist)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michell"))
    default:
        print("something else")
    }
}

let optionalNumber: Int? = 3
things.append(optionalNumber)        // Warning
things.append(optionalNumber as Any) // No warning
