class Person:
    "Person class has a name and says hello."

    def __init__(self, name):
        self.name_ = name

    def greet(self):
        "Say Hello"
        print("Hello, I am " + self.name_)

    def get_name(self):
        "getter"
        return self.name_
