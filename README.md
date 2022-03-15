# BF_AurosysIF
A batch file to fix routing issues on a Server.

# Description
This is a file I created for work. I know what you are thinking too! No, I am not stealing secrets from my job or compromising security. Rather this file is a work in progress. The issue I had was that whenever I do a Server restart on this VM (Virtual Machine) Server, the IF (Interface) for one of the adapters will either disconnect, change number, or do both. This means the routing has to be set up all over again. What a pain, right? One of my colleagues wrote a simple batch file that fixed the routing, but each time we restarted we needed to edit the file and rerun it manually. This is my solution to automate that process.

# Here's the Lowdown
When the batch file runs, it prints the entire routing table into text file. It will then parse that file for the line the problem interface is on. It then creates a new text file containing only that line. This line is small enough to parse easily so I parsed it into a variable. Next I parsed just the interface number and removed the spaces. I then build the batch file line by line using appending where needed. Lastly, I run the batch file that redoes the routing.  

# USE
If you would like to use the file to solve one of your own problems, note that it probably only needs to be about a 5th of the size. There are a lot of comments. It will actually run and build the hypothetical batch file that is needed to fix the routing, but that file is commented out and will not run because there are no valid IP addresses in it. You will need to add your own, and remove the comment. As for the files it creates, it is designed to use the two text files and batch file overwriting when necessary. I did not include my routing files for security reasons. You do not need to create the files it will create them after the first run. 

Ex: After running the .bat file. 
Directory 
  AurosysIF.bat
  route.txt
  route1.txt
  IFchange.bat
