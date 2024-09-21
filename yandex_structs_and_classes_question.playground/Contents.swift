import Foundation

// MARK: - Initial code
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "John")
let person2 = Person(name: "Jane")

let people: [Person] = [person1, person2]
let copyOfPeople = people

copyOfPeople.last?.name = "Janet"
print(people.last?.name)

// MARK: QUESTION: What would the print say?

// MARK: The right answer
/*
 In this code snippet, the question revolves around Swift's handling of reference types. The key concept here is that classes in Swift are reference types, meaning that when an object of a class is assigned to another variable or passed to a function, the reference to the same object is passed rather than a copy of the object itself.

 Code explanation:

 Class Person is defined, and it has a single property name, which is a String.
 Two instances of Person are created:
 person1 with the name "John".
 person2 with the name "Jane".
 The array people holds two references: one to person1 and one to person2.
 copyOfPeople is set to the same array as people, meaning both arrays hold references to the same objects (person1 and person2).
 The line copyOfPeople.last?.name = "Janet" changes the name of the last object in the copyOfPeople array. Since copyOfPeople and people reference the same objects (because Person is a reference type), this change also affects the last object in people.
 Finally, print(people.last?.name) will output the name of the last person in the people array, which has now been changed to "Janet".

 Conclusion:
 The print statement will output:
 Optional("Janet")

 This is because people and copyOfPeople refer to the same objects, and modifying one of them affects the other.
 */

// MARK: - Follow up modification. Changing Person from class to struct
struct Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "John")
let person2 = Person(name: "Jane")

let people: [Person] = [person1, person2]
let copyOfPeople = people

copyOfPeople.last?.name = "Janet"
print(people.last?.name)

// MARK: QUESTION. What would the print say now?

/*
 Answer:
 The code would not compile. Here's why:

 When you try to execute this line:

 copyOfPeople.last?.name = "Janet"

 It would result in a compile-time error because structs are value types and properties of structs are immutable when accessed through an optional (last?) or a constant array.

 Why does it fail?
 Structs are immutable when accessed via an array:
 The array copyOfPeople is a constant (let), so you can't mutate the elements of the array, even though Person itself has a mutable var name property. This immutability applies because accessing the last? element of the array provides a temporary copy, and Swift won't allow mutation on a temporary copy.

 The error message would likely be something like:
 Cannot assign to property: 'name' is a 'get'-only property

 Fix #1: If you want to make it work and change the name, you need to make copyOfPeople a var array, so that the elements can be mutable:
 var copyOfPeople = people

 The problem lies deeper than just the immutability of the array. Even if we made copyOfPeople mutable by using var, the code still wouldn't compile because structs are value types.

 Here’s the actual issue and why the code fails to compile:

 When you do this:
 copyOfPeople.last?.name = "Janet"

 You are trying to modify a property of a struct that is retrieved from an array using an optional (last?). The issue arises because Swift provides the element retrieved from last? as an immutable copy. You cannot directly modify properties of that copy.

 Why does it fail?
 Even if copyOfPeople was declared as var, accessing last? returns a temporary copy of the struct (due to value semantics). You can’t modify a property on a temporary copy, because that modification won’t affect the array’s contents.

 Swift will raise an error like this:
 Cannot assign to property: 'name' is a 'get' only property

 This happens because last? provides a read-only copy, and Swift doesn't let you mutate such a temporary copy.

 Correct way to fix this:
 To actually modify the last element of the array, you need to work with the index directly, like this:

 var copyOfPeople = people
 if var lastPerson = copyOfPeople.last {
     lastPerson.name = "Janet"
     copyOfPeople[copyOfPeople.count - 1] = lastPerson
 }

 Now, you are:
 Retrieving the last element (var lastPerson = copyOfPeople.last).
 Modifying the name property of that retrieved copy.
 Assigning the modified copy back into the array (copyOfPeople[copyOfPeople.count - 1] = lastPerson).
 With this modification, the code will compile successfully, and you’ll be able to change the name of the last person in the copyOfPeople array without modifying the original people array.
 */

// MARK: - code fixed
/*
 Once we've fixed the code, the print statement's output will remain unaffected because we are modifying copyOfPeople, which is a separate copy of the people array (since structs are value types).

 Explanation:
 people and copyOfPeople are now two separate arrays because Person is a struct (value type). This means that when you assign copyOfPeople = people, a copy of the array is made.
 Modifying copyOfPeople does not affect people because they are independent copies.
 The modification lastPerson.name = "Janet" only affects the last element of the copyOfPeople array, not the original people array.
 Result of print(people.last?.name):
 The original people array remains unchanged, so the print statement will output:

 Optional("Jane")
 This is because the last element of people still has the name "Jane", and the changes made to copyOfPeople don't affect people due to the value semantics of structs.
 */

// MARK: - FOLLOW UP QUESTION. Tell me more about the arrays. when we initially just created the copyOfPeople, where is it stored in memory?

/*
 To dive deeper into how arrays behave in Swift, especially when copying them, let's explore how Swift handles arrays in memory, focusing on copying behavior, value semantics, and optimizations like copy-on-write.

 1. Value Semantics and Copying Behavior
 In Swift, arrays are value types, which means they follow value semantics. When you assign an array to another variable (like assigning people to copyOfPeople), it creates a copy of that array.

 Here’s what happens when you create copyOfPeople:
 let copyOfPeople = people

 Although it seems like you are making a new copy immediately, Swift actually implements a smart optimization called copy-on-write (COW). This means that the actual copying of the array's data doesn't happen immediately. Instead, Swift internally shares the same memory storage for both people and copyOfPeople until either one of them is modified.

 2. Copy-on-Write Optimization (COW)
 Copy-on-write is a performance optimization to avoid unnecessary duplication of data. Here's how it works:

 Initial State: When copyOfPeople is first assigned the value of people, both arrays point to the same memory location where the data (the Person structs) are stored. No actual copying happens at this point.
 Before Mutation: Both people and copyOfPeople share the same underlying storage. If neither is modified, they both continue pointing to the same memory location, saving resources.
 Upon Mutation: When you attempt to modify one of the arrays (like modifying copyOfPeople), Swift will perform a copy of the data at this point. This ensures that the original people array remains unchanged, while copyOfPeople gets its own separate memory with the copied data. This is where Swift ensures the value semantics of arrays while maintaining performance efficiency.

 In our modified code:
 var copyOfPeople = people

 As soon as we attempt to change the last person's name in copyOfPeople, Swift will trigger the copy-on-write mechanism:

 It allocates new memory for copyOfPeople, copies the data from people, and then performs the mutation on this newly copied data.

 3. Memory Allocation and Sharing
 Initially, when people is created, Swift allocates memory to store its elements (Person structs in this case).
 After creating copyOfPeople, both arrays share the same memory due to copy-on-write.
 Once a modification is made (like changing copyOfPeople.last?.name = "Janet"), Swift allocates new memory for copyOfPeople, and the original people remains in its original memory location with its data untouched.

 4. Deep Copy vs. Shallow Copy
 It's important to note that while Swift arrays exhibit value semantics, deep copying is only performed for the array’s elements when necessary (i.e., when the elements themselves are value types like struct). However, if the elements are reference types (like classes), the references themselves are copied, not the objects they point to. In this case, if we were using a class for Person, both arrays would share references to the same objects (and mutating the objects would affect both arrays).

 In this example, because Person is a struct (value type), Swift will make a deep copy of the Person instances when performing the copy-on-write operation.

 5. Memory Layout for Arrays and Structs
  - For arrays of structs:
 Each element of the array is stored inline in contiguous memory blocks.
 When the array is copied, a new block of memory is allocated, and each struct in the original array is deep-copied into the new memory block.

  - For arrays of classes:
 The array stores references (pointers) to the objects, which are allocated on the heap.
 When the array is copied, the references are copied, not the actual objects. Both arrays point to the same objects, which reside on the heap.

 Conclusion:
 When you create copyOfPeople from people, Swift uses copy-on-write to optimize performance, meaning both arrays initially share the same memory. The actual copy only happens when you mutate copyOfPeople, at which point Swift allocates new memory and copies the data into it. The original people array stays in its original memory location untouched. This ensures efficient memory management and enforces the value semantics of arrays in Swift.
 */

// MARK: - FOLLOW UP QUESTION. Now I know that swift stores objects of classes on the heap. but for the array of structs: where are the objects of structs in an array stored?

/*
 In Swift, when you're working with an array of structs, the struct instances are stored inline in the array’s memory buffer. Here's what this means in detail:

 Structs in Arrays and Memory Layout
 Since structs in Swift are value types, they follow value semantics, which means they are copied when assigned or passed around. When an array holds structs, the actual data of the structs is stored directly in the memory buffer allocated for the array. This is different from how arrays of classes work, where the array holds references to objects on the heap.

 Here’s what happens in memory when you have an array of structs:

  - Array Buffer:
 The array is allocated as a contiguous block of memory (a buffer).
 The buffer holds the actual struct data inline (not references), meaning the struct instances are placed directly in this buffer in contiguous memory locations.

  - Memory Location:
 If a struct is small (fits within a few words of memory), Swift tries to keep the struct’s data on the stack (for local variables) or inline within arrays and other collections.
 When you create an array of structs, Swift allocates a single contiguous block of memory large enough to store all the struct elements directly.
 So, the array itself will be stored on the heap if the array is dynamically sized, and the structs' data will be stored inline in this heap memory.

 Stack vs. Heap for Structs in Arrays
  - Stack: If you are creating a local array of a fixed size within a function or a small scope, the array may live on the stack (depending on size and optimizations). The struct instances themselves will still be stored inline in the array's memory buffer.
  - Heap: When arrays are dynamically allocated (or resized), Swift moves the array’s memory buffer to the heap. Structs in arrays are then stored inline in that heap-allocated buffer.

 Example: Array of Structs
 struct Point {
     var x: Int
     var y: Int
 }

 let points: [Point] = [Point(x: 1, y: 2), Point(x: 3, y: 4), Point(x: 5, y: 6)]

 In this case:
 Swift allocates a memory buffer for the array points.
 The memory buffer contains the actual data for each Point struct (the x and y values) inline, meaning the values 1, 2, 3, 4, 5, 6 are stored directly in the array's buffer.

 Why Storing Structs Inline is Efficient
 Because structs are stored inline in the array's memory buffer:
 Accessing structs in an array is very efficient: No additional pointer dereferencing is needed (unlike arrays of class instances, where the array holds references that need to be dereferenced to access the objects).
 Memory locality is improved: Since the struct data is stored contiguously, accessing elements sequentially benefits from better cache locality, leading to more efficient memory access.

 When is the Heap Used for Arrays of Structs?
 Even though structs themselves aren't heap-allocated, the array itself might be allocated on the heap. This happens:
  - When the array is dynamically sized.
  - When arrays are passed between scopes (especially if they escape their original scope).
  - When arrays are created in large sizes, which wouldn't fit on the stack.
  - Once on the heap, the entire array—including the inline data of each struct—resides in one contiguous block of memory on the heap.

 Conclusion:
 In Swift, struct instances in an array are stored inline in the array’s memory buffer, which could be either on the stack (for small arrays) or on the heap (for larger or dynamically resized arrays). The structs themselves are not heap-allocated individually; instead, they are stored directly within the array's buffer, leading to efficient memory access and good performance characteristics.
 */
