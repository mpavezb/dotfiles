#include <iostream>
#include <string>

class Person {
public:
  explicit Person(const std::string &name) : name_{name} {}
  virtual ~Person() {}

  void greet() { std::cout << "I am " << name_ << std::endl; }

private:
  std::string name_;
};
