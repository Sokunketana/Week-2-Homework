enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  Address(this._street, this._city, this._zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  Employee.mobileDev (this._name, this._baseSalary, this._address, this._yearsOfExperience) : _skills = [Skill.FLUTTER, Skill.DART];

  double calculateSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (Skill skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else if (skill == Skill.OTHER) {
        salary += 1000;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
  }


}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.OTHER], Address("123", "PP", "456"), 12);
  emp1.printDetails();

  var emp2 = Employee.mobileDev('Ronan', 45000, Address("456", "KP", "123"), 67);
  emp2.printDetails();
}