<img src="https://raw.githubusercontent.com/frodri13/Bank-Tech-Test/main/img/bank.png" align="right"
     alt="Bank logo from https://www.flaticon.com/" width="150" height="160">

# Bank-Tech-Test

This program aims to mimick the functionality of a bank account that allows the user to make deposits, withdrawals and print bank statements.

You can interact with it via IRB within your terminal, please refer to the usage section for more instructions.

## Classes

You will find three classes in this project:

1. Transaction = Takes to arguments in its creation, a boolean for weather it is a deposit or not, and the ammount.
2. Account = It keeps track of the balance based on the transactions inputed, and also creates statements with the `print_statement` method.
3. Statement = It prints out all of the transactions recorded in the account.

## Getting Started

1. Download the project and clone it into your computer.

```
git clone https://github.com/frodri13/Bank-Tech-Test.git
```

2. Open IRB in your terminal:

```
irb
```

3. Follow the instructions on the Usage section down below.

## Usage

![App Usage Gif](https://github.com/frodri13/Bank-Tech-Test/blob/main/img/Usage.gif?raw=true)

## Running tests

Locate yourself into the directory and run `rspec`.

Please note that there are two methods to insert transactions:

1. add_to_balance(transaction) => takes an object as an argument, used for testing with instance doubles of transactions.
2. transaction(deposit, ammount) => takes in two arguments. This method will create an object of the transaction class.

## Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Additional Features

I also took the liberty of adding the following features to cover some expected edge cases:

1. The current date will be added if no date is provided.
2. Both the `deposit` and `withdraw` methods can take in dates such as "13-01-2012" or "13/01/2012
3. It will raise an error if the date is inserted in another format such as "01-13-2012"
4. It can take ammounts with decimals that will be printed out with two decimal places

## Attributions

<div>Icons made by <a href="https://smashicons.com/" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
