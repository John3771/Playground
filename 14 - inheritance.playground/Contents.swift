
/*
1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"
*/

class Artist {
    let name: String
    let surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func perform() { }
}

class Painter: Artist {
    
    override func perform() {
        print("I really love sniffing paint. Filling so fucking high after... Wait... what we r here about? Oh.. u know me like a \(name)")
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
