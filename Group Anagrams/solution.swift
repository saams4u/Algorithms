class Program {
    // O(w * n *log(n)) time | O(wn) space - where w is the number of words and 
    // n is the length of the longest word
    func groupAnagrams(_ words: [String]) -> [[String]] {
        var anagrams = [String: [String]]()

        for word in words {
            let sortedWord = String(word.sorted())
            if var arr = anagrams[sortedWord] {
                arr.append(word)
                anagrams[sortedWord] = arr
                continue
            }
            anagrams[sortedWord] = [word]
        }

        var result = [[String]]()
        for group in anagrams {
            result.append(group.value)
        }
        return result
    }
}
