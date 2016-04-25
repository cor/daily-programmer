//
// 263-easy
//
// https://www.reddit.com/r/dailyprogrammer/comments/4fc896/20160418_challenge_263_easy_calculating_shannon/
//

import Foundation

func shanonEntropy(sequence: String) -> Double {
    
    let uniqueChars = Set<Character>(sequence.characters)
    let n = Double(sequence.characters.count)
    
    return -1 * uniqueChars.map {
        (character) -> Double in
            let occurranceCount = Double(sequence.componentsSeparatedByString(String(character)).count - 1)
            return (occurranceCount / n) * log2(occurranceCount / n)
        }.reduce(0, combine: +)
}

shanonEntropy("122333444455555666666777777788888888")
shanonEntropy("563881467447538846567288767728553786")
shanonEntropy("https://www.reddit.com/r/dailyprogrammer")
shanonEntropy("int main(int argc, char *argv[])")