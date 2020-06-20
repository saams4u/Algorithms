class Program {
    class LinkedList {
        var value: Int?
        var next: LinkedList?

        init(value: Int) {
            self.value = value
            next = nil
        }
    }

    // O(n) time | O(1) space
    func removeKthNodeFromEnd(head: LinkedList, k: Int) {
        var counter = 1

        var firstPointer: LinkedList? = head
        var secondPointer: LinkedList? = head

        while counter <= k {
            secondPointer = secondPointer?.next
            counter += 1
        }

        if secondPointer == nil {
            head.value = head.next?.value
            head.next = head.next?.next

            return
        }

        while secondPointer?.next != nil {
            firstPointer = firstPointer?.next
            secondPointer = secondPointer?.next
        }

        firstPointer?.next = firstPointer?.next?.next
    }
}
