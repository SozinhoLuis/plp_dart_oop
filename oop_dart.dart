import 'dart:convert';
import 'dart:io';

// Step 1: Define classes that demonstrate inheritance
class Animal {
  void eat() {
    print('Animal is eating');
  }
}

class Dog extends Animal {
  void bark() {
    print('Woof!');
  }
}

// Step 2: Implement an interface
class CanFly {
  void fly() {
    print('Flying');
  }
}

class Bird implements CanFly {
  @override
  void fly() {
    print('Bird is flying');
  }
}

// Step 3: Override a method
class Cat extends Animal {
  @override
  void eat() {
    print('Cat is eating');
  }
}

// Step 4: Initialize an instance of a class with data from a file
class Person {
  String name;

  Person(this.name);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name']);
  }
}

Future<Person> loadPersonFromFile(String filePath) async {
  File file = File(filePath);
  String contents = await file.readAsString();
  Map<String, dynamic> data = jsonDecode(contents);
  return Person.fromJson(data);
}

// Step 5: Demonstrate the use of a loop
void printNumbers() {
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}

void main() async {
  // Step 1: Inheritance
  var dog = Dog();
  dog.eat(); // Output: Animal is eating
  dog.bark(); // Output: Woof!

  // Step 2: Interface implementation
  var bird = Bird();
  bird.fly(); // Output: Bird is flying

  // Step 3: Method overriding
  var cat = Cat();
  cat.eat(); // Output: Cat is eating

  // Step 4: Initialize an instance of a class with data from a file
  var person = await loadPersonFromFile('person.json');
  print('Loaded person: ${person.name}');

  // Step 5: Use of a loop
  printNumbers();
}
