<img src="https://raw.githubusercontent.com/frodri13/Bank-Tech-Test/main/img/bank.png" align="right"
     alt="Bank logo from https://www.flaticon.com/" width="150" height="160">

# Bank-Tech-Test

This program aims to mimick the functionality of a bank account that allows the user to make deposits, withdrawals and print bank statements.

You can interact with it via IRB within your terminal, please refer to the usage section for more instructions.

## Domain Modelling

<img src="https://raw.githubusercontent.com/frodri13/Bank-Tech-Test/main/img/Account_Class.png" width="250" height="250">

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

![App Usage Gif](https://raw.githubusercontent.com/frodri13/Bank-Tech-Test/main/img/app_usage.gif)

## Running tests

Locate yourself into the directory and run `rspec`.

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

## Attributions

<div>Icons made by <a href="https://smashicons.com/" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
