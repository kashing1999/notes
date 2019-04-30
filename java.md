# Java

---

## Objects
- Objects are essentially reusable software components
- Contains methods and attributes

## Methods
- Primitive types are passed by value
- Objects are passed by reference

## toString()
- By default, calls the `object` to string method, which shows the type of object and its memory location
- Can be overrided to display more information
- If an object is referred by only its name such as: `System.out.println(SomeObject)` , it will invoke the `toString()` method


## `this` keyword
- `this` refers to the object itself
    1. `this` can be used to refer current class instance variable.
    2. `this` can be used to invoke current class method (implicitly)
    3. `this()` can be used to invoke current class constructor.
    4. `this` can be passed as an argument in the method call.
    5. `this` can be passed as argument in the constructor call.
    6. `this` can be used to return the current class instance from the method.
---
## Casting
- Say we have an object of type animal, and an object of type dog that inherits from animal:
```java
Dog dog1 = new Dog();
Animal animal1 = d;     // Valid!
dog1.bark();            // Valid!
animal1.bark();         // Not Valid!
```
- dog1 can be assigned to Animal animal1, but animal1 cannot access the attributes from Dog();
- To make Dog() attributes accessible by animal1, we have to type cast it, ie:
```java
Dog dog2 = (Dog) animal1;
```
#### Downcasting
- Casting an object to be a subclass
#### Upcasting
- Casting an object to be a superclass

## instanceof
- Used to check if an object is an instance of a class
```java
if (myObject instanceof Circle) {
    // do something
}
```

## Static Binding
- When type of the object is determined at compiled time(by the compiler), it is known as static binding
- If there is any private, final or static method in a class, there is static binding

## Dynamic Binding
- When type of the object is determined at run-time, it is known as dynamic binding. Example:
```java
class Animal{  
    void eat(){System.out.println("animal is eating...");}  
}  
  
class Dog extends Animal{  
    void eat(){System.out.println("dog is eating...");}  
  
public static void main(String args[]){  
    Animal a=new Dog();  
    a.eat();  
    }  
}  
```
- output: `dog is eating...`
  
---

## Polymorphism
- Polymorphism is the capability of a method to do different things based on the object that it is acting upon
- Polymorphism allows you define one interface and have multiple implementations
- In other words, polymorphism is when you can treat an object as a generic version of something, but when you access it, the code determines which exact type it is and calls the associated code

## Inheritance
- Every class in Java directly or indirectly extends (or “inherits from”) Object
- Java supports only single inheritance, in which each class is derived from exactly one direct superclass
- Generally, the subclass is a more specific version of the superclass 
- Creating an object from a subclass however doesn't create a superclass object, the subclass just has all of the superclass attributes and methods
- Should pass the `is-a` relationship
- For example, a Dog object is a Mammal object
- An object of a subclass can also be treated as an object of the super class

## Composition
- Fufills a has-a relationship
- In a has-a relationship, an object contains references to other objects
- For example, a Kitchen object has a Sink object

## Encapsulation
- Classes encapsulate their instance variables
- This allows them to hide implementation of the object itself

## Overloading
- Overloading allows users to create multiple functions with the same name but different argument lists
1. Overloaded methods MUST change the argument list
2. Overloaded methods CAN change the return type
3. Overloaded methods CAN change the access modifier
4. Overloaded methods CAN declare new or broader checked exceptions
5. A method can be overloaded in the same class or in a subclass

## Overriding
- Overriding allows users to change the functionality of a super class method
  
---

## Arrays
- Arrays can be declared as such
```java
int[] IntArray = new int[3];        // Declaring an array of 3 ints
Animal[] animals = new Animal[10];  // Declaring an array of 10 animal objects
```
- Be careful where you put the [] brackets:
```java
int[] a, b, c; // a, b, and c are all arrays

int a[], b, c; // only a is an array
```

#### Enhanced for loop:
```java
for (int Item:Array) {
    // Do something with each item
}
```
#### Multidimensional arrays:
```java
int a[][] = {{1, 2}, {3, 4, 5}};

int b[][];
b = new int[3][4];

for (int column = 0; column < a[1].length; column++)
    a[1][column] = 0;

```

---

## Static
- Static means there is only one copy of the variable in memory shared by all instances of the class
- The static member can be accessed before the class object is created

### Static Variables
- Variables are independent of object creation
- They can be accessed without creating an object
- Value is consistent between all references to this variable

### Static Methods
- Static methods are class methods rather than object methods
- Can be used without creating an object
- Cannot use non static instance variables or methods
- Cannot be overriden, it only hides the method, hence polymorphism does not occur
- Can be overloaded
- Calling a non-static function inside a static function is not allowed
- Use it:
    1. If you are writing utility classes and they are not supposed to be changed.
    2. If the method is not using any instance variable.
    3. If any operation is not dependent on instance creation.
    4. If there is some code that can easily be shared by all the instance methods, extract that code into a static method.
    5. If you are sure that the definition of the method will never be changed or overridden. As static methods can not be overridden.

### Static Constants
- Static constants are final variables shared by all the instances of the class.

## Final
- The final keyword just means the value can't be changed. Without final, any object can change the value of the variable

---
## Constructors
- Constructors are called when objects are created with the `new` keyword
- By default, an empty constructor is used
- You can overload a constructor to take any arguments, but the empty then constructor needs to be defined
```java
class Program1 {
    Program1(String Args) {
        // A constructor with one argument
    }
    
    public static void main(String[] args) {
        Program1 a = new Program1("Argument");  // Valid!
        Program1 b = new Program();             // Invalid!
    }
}
```
- Constructor of an object can be referenced by itself using `this()`
- Constructor of superclass can be referenced by using `super()`
- Super class constructors must always be called first
- If no super class constructor is invoked explicitly, the compiler puts super() as the first statement in the subclass constructor.
  
---

## Java Access Modifiers
#### Public
- A variable, method or class that is public means that any class can access it
- If you have a file called Program1.java, the only class in that file that can be public is `Program1`
#### Private
- Private variables are only accessible inside the class they were defined
- Inner classes can access its variables too
#### Protected
- Protected variables and methods allow:
    1. the class itself to access them
    2. classes inside of the same package to access them
    3. and subclasses of that class to access them

---

## Abstract Classes
- Abstract classes are not meant to be instantiated
- Can only be extended
```java
abstract public class Animal {
    // Implementation
}
public class MakeAnimal() {
    MakeAnimal() {
        Animal A = new Animal();    // INVALID!
    }
}
```

## Abstract Methods
- An abstract class means the class must be extended
- An abstract method means the method must be overridden
```java
// an abstract method, must be implemented
public abstract void eat();
```
- A class must be abstract to have abstract methods

## Interfaces
- Interfaces are 100% abstract classes
- Interfaces are like contracts
- Interfaces cannot be instantiated
- Interface methods must be declared public when implemented
- Interface methods can be overloaded, but should not be
- Classes can implement multiple interfaces
- Classes from different inheritance trees can implement the same interface
- To implement an interface:
```java
public interface Pet {
    // Abstract methods
    public void play();
}

public class Dog extends Animal implements Pet {
    // You have to implement everything in Pet
    public void play() {
        // implementation goes here
    }
}
```
- Interface variables are public, static and final by default
- If there are two or more same methods in two interfaces and a class implements both interfaces, implementation of the method once is enough
- A class cannot implement two interfaces that have methods with same the name but different return type
- An interface cannot implement another interface, but it can extend it:
``` Java
interface Pet {
    public void play();
}
interface IndoorPet extends Pet {
    public void obey();
}
class Dog extends Animal implements IndoorPet {
    public void play() {
        // implementation
    }
    public void obey() {
        //implementation
    }
}
```
- An interface can extend many other interfaces

---

## Strings
- Strings are basically objects that represent sequence of char values
- An array of characters works the same as Java String
- For example:

``` Java
char[] ch = {'h', 'e', 'l', 'l', 'o'};
String s = new String(ch);
// is same as:
String s = "welcome";
```
### CharSequence Interface
- The `CharSequence` interface is used to represent the sequence of characters
- `String`, `StringBuffer` and `StringBuilder` classes implement it
- It means we can create strings in java by using these three classes
- The Java `String` is immutable which means it cannot be changed
- Whenever we change any string, a new instance is created
- To create mutable strings, you can use `StringBuffer` and `StringBuilder` classes

### String Literal
- Java String literal is created by using double quotes: `String s = "welcome";`
- Each time you create a string literal, the JVM checks the "string constant pool" first
- If the string already exists in the pool, a reference to the pooled instance is returned
- If the string does not exist in the pool, a new string instance is created and placed in the pool
- For example:
``` Java
String s1 = "welcome";
String s2 = "welcome"; // does not create new instance
```

### Java String Compare
- Three main ways:
  1. `equals()` method
  2. `==` operator
  3. `compareTo()` method
#### `equals()` method
- The `String equals() method compares the original content of the string
``` Java
String s1="Sachin";
String s2="Sachin";
String s3=new String("Sachin");
String s4="Saurav";
System.out.println(s1.equals(s2)); // True
System.out.println(s1.equals(s3)); // True
System.out.println(s1.equals(s4)); // False

```
#### `==` operator
- Compares references, not values
#### `compareTo()` function
- The String compareTo() method compares values lexicographically and returns an integer value that describes if first string is less than, equal to or greater than second string
- Similar to `strcmp` in `C`
``` Java
String s1 = "Sachin";
String s2 = "Sachin";
String s3 = "Ratan";
System.out.println(s1.compareTo(s2)); // 0
System.out.println(s1.compareTo(s3)); // 1
System.out.println(s3.compareTo(s1)); // -1
```
## String Concatenation
- Two ways:
  1. Using `+`
  2. Using `concat()` method
``` Java
String s1 = "Sachin";
String s2 = " Tendulkar";
String s3 = s1 + s2;
String s4 = s1.concat(s2);
```

## Substrings
- A part of string is called substring
- Subset of another string
``` Java
String s = "SachinTendulkar";
System.out.println(s.substring(6)); // output is: Tendulkar 
System.out.println(s.substring(0,6)); // output is: Sachin
```

## `valueOf()` method
- The string valueOf() method coverts given type such as int, long, float, double, boolean, char and char array into string
``` Java
int a = 10;
System.out.println(String.valueOf(a)); // 10
```

## String `replace()`
- The string `replace()` method replaces all occurrence of first sequence of character with second sequence of character
``` Java
String s1 = "Java is a programming language";
String replaceString = s1.replace("Java", "Kava");
```

## `StringBuffer` class
- Java `StringBuffer` class is used to create mutable strings
- Thread-safe, meaning multiple threads cannot access it simultaneously
``` Java
StringBuffer sb = new StringBuffer("Hello ");
sb.append("Java"); //now original string is changed
System.out.println(sb); //prints Hello Java

sb = new StringBuffer("Hello ");
sb.insert(1,"Java"); //now original string is changed
System.out.println(sb); //prints HJavaello

sb = new StringBuffer("Hello");
sb.replace(1,3,"Java");
System.out.println(sb); //prints HJavalo
```

## `StringBuilder` class
- Java StringBuilder class is used to create mutable (modifiable) string
- The Java StringBuilder class is same as StringBuffer class except that it is non- synchronized
- It is available since JDK 1.5
- It allows multi-threading, a technique by which a single set of code can be used by several processors at different stages of execution
### Comparison between StringBuffer and StringBuilder
- Each method in StringBuffer is synchronized, it does not allow two threads to simultaneously access the same method
- Each method can be accessed by one thread at a time
- Thus, StringBuilder is faster than the StringBuffer when calling the same methods of each class
- However, StringBuilder is not thread safe

---

## Annotations
### @Override
- Assures that subclass method is overriding parent class method

### @SupressWarnings
- Used to suppress warnings during compilation

### @Deprecated
- Used to warn users that the method is deprecated, and may be removed in future versions

---

## Error
- Something severe has happened
- Program should crash instead of handling the error

## Exceptions
- Unwanted events that interrupts the flow of a program
- Can handle these events and take necessary corrective actions
- Examples:
    1. NullPointerException
    2. ArithmeticException
    3. ArrayIndexOutOfBoundsException
### Checked and Unchecked Exceptions
#### Checked exceptions
- All exceptions other than RuntimeExceptions are known as Checked exceptions, as the compiler checks whether the programmer has handled them or not
- If these exceptions are not handled/declared in the program, you will get compilation error
- Some examples: IOException, ClassNotFoundException etc
#### Unchecked exceptions
- Runtime exceptions are also known as unchecked exceptions
- These exceptions are not checked at compile-time
- Hence, compiler does not check whether it was handled
- Responsibilty of programmer to handle these exceptions
### Try
- Try block contains set of statements wher an exception can occur
- A try block is always followed by a catch block, which handles the exceptions
- Must be followed by a catch or finally or both
### Catch
- A catch block is where the exceptions are handled
- A single try block can have several catch blocks
``` Java
class Example1 {
    public static void main(String args[]) {
        int num1, num2;

        try {
            num1 = 0;
            num2 = 62 / num1;
            System.out.println(num2);
            System.out.println("Hey I'm at the end of try block");
        }
        catch (ArithmeticException e) {
            // arithmetic exception
            System.out.println("You should not divide a number by zero");
        }

        catch (Exception e) {
            // generic exception
            System.out.println("Exception occurred");
        }
        System.out.println("I'm out of try-catch block in Java."); 
    }
}
```
### Finally
- Finally block statements will run regardless whether an exception occured
- A finally block must be associated with a try block
- Finally blocks are optional
- Statements in finally block execute even if the try block contains control transfer statements such a return, break or continue
### Throwing exceptions
- Exceptions can be thrown explicitly with the keyword `throw`
``` Java
public class ThrowExample {
    static int add (int a, int b) {
        if (a == 5) {
            throw new ArithmeticException("Cannot divide by 5");
        }
        return a+b;
    }
    public static void main (String args[]) {
        add(5, 1); // Exception thrown
    }
}
```

---

## File Handling
### File Class
- The `File` class abstracts most of the file handling for the programmer
- The filename is a string
- The `File` class is a wrapper class for the file name and its directory path
- A `File` object encapsulates the properties of a file or a path, but does not contain the methods for reading and writting data from and to a file
- In order to perform I/O, you need to create objects using appropriate Java I/O classes
- The objects contains methods for manipulating data in a file
#### Writting a file
``` Java
import java.io.*;
public class WriteData {
    public static void main(String[] args) throws IOException {
        File file = new File("/Users/ks/TestFile.txt");
        if (file.exists()) {
            System.out.println("File already exists");
            System.exit(0); 
        }
        // Create a file
        PrintWriter output = new PrintWriter(file);
        output.println(90);
        output.print("Eric K Jones "); 
        output.println(85);
        // Close the file
        output.close();
    }
}
```
#### Reading a file
``` Java
import java.util.Scanner;
import java.io.*;
public class ReadData {
    public static void main(String[] args) throws Exception {
        // Create a File instance
        File file = new File ("/Users/ks/TestFile.txt"); // Create a Scanner for the file
        Scanner input = new Scanner(file);
        // Read data from a file
        while (input.hasNext()) {
            String firstName = input.next(); String mi = input.next();
            String lastName = input.next(); int score = input.nextInt(); System.out.println(
            firstName + " " + mi + " " + lastName + " " + score);
        }
    }
}
```
### Creating a file in Java
- We can create files in java using the `createNewFile()` method
- This method creates a file and returns true if the file does not exist, false otherwise
- It throws:
  1. `IOException`: If an input or output error occurs during file creation
  2. `SecurityException`: If a security manager exists and its SecurityManager.checkWrite(java.lang.String) method denies write access to this file
``` Java
import java.io.File;
import java.io.IOException;
public class CreateFileDemo {
    public static void main( String[] args ) {
        try {
            File file = new File("C:\\Users\\TOSHIBA\\eclipse-workspace\\newfile.txt");
            boolean fvar = file.createNewFile(); 
            if (fvar) {
                System.out.println("File has been created successfully"); 
            }
            else {
                System.out.println("File already present at the specified location");
            }
        } 
        catch (IOException e) {
            System.out.println("Exception Occured:");
            e.printStackTrace();
        }
    }
}
```
### `printStackTrace`
- `printStackTrace()` is a method on Exception instances that prints the stack trace of the instance to `System.err`
- It's a very simple, but very useful tool for diagnosing an exceptions
- It tells you what happened and where in the code this happened

### `BufferedInputStream`
- `FileInputStream` reads from the file, while `BufferedInputStream` will read from a buffer of the file
- In practice, this means that every call to FileInputStream.read() will perform a syscall (expensive)
- Whereas most calls to BufferedInputStream.read() will return data from the buffer
- In short, if you are doing "small" reads, putting a BufferedInputStream into your stream stack will improve performance.

### `FileOutputStream`
- We can use `FileOutputStream` to write to a file in java
- We use the `write()` method to write the content to the specified file

### `flush()`
- `flush()` flushes the output stream and forces any buffered output bytes to be written out
- The general contract of flush is that calling it is an indication that, if any bytes previously written have been buffered by the implementation of the output stream, such bytes should immediately be written to their intended destination.

---

## Garbage Collection
### Stack
- Method invocations and local variables live here
- Reference to objects live here

### Heap
- All objects live here, not the reference to the variables
- Instance variables of objects live here too