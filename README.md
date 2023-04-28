# TODO Terminal App

This is a terminal app that allows you to create a todo list. You can add, delete, and mark tasks as complete. You can also view all tasks, view completed tasks, and view incomplete tasks.

The application was built using Ruby programming language to serve as practice and familiarization with the language. The application exhibits the use of arrays, hashes, classes, modules, and third-party gems.

I tried my best to implement the clean code architecture of object-oriented programming and tried to maximize the use of the single responsibility principle.

**_P.S. I just started learning Ruby this week. I'm open to any suggestions and feedback with regards on the best practices that I could learn when coding with Ruby._**

## Installation

-   Make sure to install Ruby on your machine. You can follow the instructions **_[here](https://www.ruby-lang.org/en/documentation/installation/)_**.

-   Clone the repository

    ```bash
        git clone https://github.com/dwrdvncntcvs/todo-term-ruby.git
    ```

-   Install the dependencies

    ```bash
        # Command to install the dependencies
        rake install
    ```

    P.S. I'm not sure about this but every time I run install the application without running this command that I created I don't get any intellisense for my VS Code.

    ```bash
        # See the RakeFile to see the actual command that was executed
        # after running this rake command
        rake bundle_gems
    ```

-   Run the application using the command below

    ```bash
        # Command to run the app
        rake start
    ```

    or you can create a bash script to run the application.

    ```bash
        # todo.sh
        #!/bin/bash
        rake start

        # Execute the bash script
        ./todo.sh
    ```

**_Thank you for checking out my application. I hope you like it. 😊_**
