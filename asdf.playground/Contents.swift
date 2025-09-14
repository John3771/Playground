func test(character: Character) -> String? {
        
    guard let scalar = character.lowercased().unicodeScalars.first?.value, scalar >= 97, scalar <= 104 else { return "huy tebe" }
    
    return String(scalar - 96)
}

test(character: "u")

