# Random Password Generator
## Tools
Python 3.10.2, Jupyter Notebook

### A simple python project to generate 'n' length random password using Random and String modules.
* Take the input for the length of the password
* Create lists of Digits, lowercase and uppercase characters
* Now combine all the lists using '+' 
* random.choice() is used to select at least one character from the lists of digits, lowercase and uppercase
* Then we combine the above and store in a temporary variable
* Based on the length of the password, we combine the values from the temporary variable and the combined list
* Then we shuffle the list and join using ' '.join() and print the password
>[View Code]()
