
let substitituions: [Character: String] = [
    "A": "4",
    "B": "6",
    "E": "3",
    "I": "1",
    "L": "1",
    "M": "(V)",
    "N": "(\\)",
    "O": "0",
    "S": "5",
    "T": "7",
    "V": "\\/",
    "W": "`//"
]


extension Character {
    // Using String's uppercased method since Character doesn't have it
    func uppercased() -> Character {
        return Character(String(self).uppercased())
    }
}

func substituteCharacter(character: Character) -> String {
    // If the Character is in the substitions dictionary, substitute it, else return the Character itself as a String
    if let substititution = substitituions[character.uppercased()] {
        return substititution
    } else {
        return String(character)
    }
}

func convertTo1337(input: String) -> String {
    return input.characters.map(substituteCharacter).joined()
}

print(convertTo1337(input: "Elitemom"))