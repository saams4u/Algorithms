class Program {
    class AncestralTree {
        var name = String()
        var ancestor: AncestralTree?

        init(name: String) {
            self.name = name
            ancestor = nil
        }
    }

    // O(d) time | O(1) space
    func getYoungestCommonAncestor(_ topAncestor: AncestralTree?, _ descendantOne: inout AncestralTree?, _ descendantTwo: inout AncestralTree?) -> AncestralTree {
        var firstDescendant = descendantOne
        var secondDescendant = descendantTwo

        let depthOne = getDescendantDepth(&descendantOne, topAncestor)
        let depthTwo = getDescendantDepth(&descendantTwo, topAncestor)

        if depthOne > depthTwo {
            var difference = depthOne - depthTwo
            return backtrackAncestralTree(&firstDescendant, &secondDescendant, &difference)
        } else {
            var difference = depthTwo - depthOne
            return backtrackAncestralTree(&secondDescendant, &firstDescendant, &difference)
        }
    } 

    func getDescendantDepth(_ descendant: inout AncestralTree?, topAncestor: AncestralTree?) -> Int {
        var depth = 0

        while descendant !== topAncestor {
            depth += 1
            descendant = descendant?.ancestor
        }

        return depth
    }

    func backtrackAncestralTree(_ lowerDescendant: inout AncestralTree?, _ higherDescendant: inout AncestralTree?, _ difference: inout Int) -> AncestralTree {
        while difference > 0 {
            difference -= 1
            lowerDescendant = lowerDescendant?.ancestor
        }

        while lowerDescendant !== higherDescendant {
            lowerDescendant = lowerDescendant?.ancestor
            higherDescendant = higherDescendant?.ancestor
        }

        return lowerDescendant
    }
}