class BankAccount {
  String accountOwner;
  double totalBalance;

  BankAccount(this.accountOwner, {this.totalBalance = 0});

  @override
  String toString() => 'Balance: $totalBalance';

  String get balance {
    return toString();
  }

  void withdraw(double amount) {
    if(totalBalance < amount) {
      throw Exception("Insufficient balance for withdrawal!");
    }
    totalBalance -= amount;
  }

  void credit(double amount) {
    totalBalance += amount;
  }

}



class Bank {
  String name;
  Map<int, String> accountId = {};

  Bank({required this.name});

  BankAccount createAccount(int id, String accountOwner) {
    BankAccount newAcc = BankAccount(accountOwner);

    for(var entries in accountId.entries) {
      if(entries.key == id) throw Exception("Account with ID $id already exists!");
    }
    accountId[id] = accountOwner;
    return newAcc;
  }

  // BankAccount createAccount(int id, String accountOwner) {
  //   for(var entries in accountId.entries) {
  //     if(entries.value == id) {
        
  //     }
  //   }
  // }

}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
