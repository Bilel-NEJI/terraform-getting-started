Step 1 --> Step 4:
- in the folder "first-resource"

Step 5:
- we create a folder called "variables"; with which we are a way of setting a value that we can use multiple times in too many different files.
- so instead of going back to change all those files, it's better to do it this way
- so do to so, inside that "variables" folder, we should create a .tf file called "main"
- and there we declare our variables

Step 6:
- how we declare variables

Step 7:
- how to use variables

Step 8:
- how to use Input variables

Step 9:
- how to use Output and Attributes at the same time
- we will continue in the variables/main.tf file

Step 10:
- how to use dynamic blocks
- dynamic blocks are a way you can create reusable portions of code and do so dynamically
- we are going to use the file "main.tf" inside the folder "dynamic"

Step 11:
- how to use tuples and objects

Step 12:
- how to work with dependencies
- for this we need an AMI id before we start because we are going to be spinning up en EC2 isntance
- each AMI will be different per region

Step 13:
- hwo to work with datasources
- datasources are a way terraform can query AWS and return a result
- essentially what datasources do; is you make an API request to get information, so they don't set anything up

Step 14:
- how to work with built-in functions
- there are too many functions that we can check in the offcial documentation

Step 15:
- how to work with terraform versioning
- "=" : exact version equal
- "!=" : version not equal
- ">", ">=", "<", "<=" : version comparison
- "~>" : pessimistic constraint operator

Step 16:
- how to work with modules
- a module is in its simpliest form is a folder that contains other terraform files
- to understand the situation, we should know that if we have a terraform folder that has many files inside of it, and when we type "terraform apply", terraform will set everything in there
- and what modules do, is that they allow us to use create blocks of reusable code
- for this we create a folder called "modules", "main.tf", and "db.tf"

Step 17:
- terraform provider: multi-provider setup
- we are going to work with the folder "providers"
- there are two ways to set up multiple providers
- we need to make terraform providers available, and to do so we have to type "terraform init", and that's how terraform pulls in the plugins
- in this step, we are going to use two providers: "aws" and "vault" which is a solution to manage secrets (passwords, usernames, tokens, etc)
- the 1st way to setup multi-providers is to declare in the .tf file the provider and the resource that we are going to use, see the "main.tf" file
- the 2nd way to setup multi-providers is to declare a second aws provider and "alias" & "provider" words
