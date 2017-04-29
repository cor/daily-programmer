import UIKit


// Heap's permutation algorithm as a String extension
extension String {
    
    var permutations: [String] {
        get {
            func perm(n: Int, a: inout [Character], result: inout [String]) {
                if n == 1 {result.append(String(a)); return}
                for i in 0..<n-1 {
                    perm(n: n-1, a: &a, result: &result)
                    swap(&a[n-1], &a[(n%2 == 1) ? 0 : i])
                }
                perm(n: n-1, a: &a, result: &result)
            }
            
            var inputCharacters = Array(self.characters)
            var result: [String] = []
            perm(n: inputCharacters.count, a: &inputCharacters, result: &result)
            
            return result
        }

    }
}


func nextLargestInt(input: Int) -> Int {
    
    // 1. Convert Input to a String
    // 2. Use String's permutation extension to get all permutations
    // 3. Remove Duplicates by converting to Set and back to Array
    // 4. Cast all String's to Int's
    // 5. Sort
    let permutations = Array(Set(String(input).permutations))
        .flatMap{Int($0)}
        .sorted()
    
    // Force unwrap because input is always in permutations
    let indexOfInput = permutations.index(of: input)!
    
    // If the input is already the largest possible permutation, return input
    if indexOfInput == permutations.count - 1 {
        return input
    } else {
        return permutations[indexOfInput + 1]
    }
}


let challangeInput = [1234, 1243, 234765, 19000]

print(challangeInput.map(nextLargestInt))
