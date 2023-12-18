# Elixir-and-Phoenix-cheatsheet-for-exam
This repository consists cheatsheet for elixir and phoenix.Hope we pass our exams

# Introduction

## Basics of Elixir

### Interactive Elixir
Elixir comes with IEx, an interactive shell, which allows us to evaluate Elixir expressions as we go.

To get started, let’s run iex:

  Interactive Elixir ({{ site.elixir.version }}) - press Ctrl+C to exit (type h() ENTER for help) 
      iex>
Note: On Windows PowerShell, you need to type iex.bat.


Phoenix commands

## mix phx.new 

### Examples - mix phx.new takso 

The command above resembles somehow the one that used in the past, i.e. mix new, to create a basic Elixir project. This time, however, it is clear that we are creating something else, that is, the skeleton of an application using the Phoenix framework. As before, the name that we are assigning to our project (and hence to our application) is “takso”. Since a phoenix application relies in various libraries, more than the ones used in a basic Elixir project, the tool mix will ask whether we want to install all the additional dependencies, to which we can safely respond with “y” or simply enter, since “yes” is the default.

When the tool mix completes the scaffolding of the application, it will also print out some hints about what to do next. In our case, we would need start by completing the setup of the database. Note that if you configured your postgresql such that “postgres” has the password specified, you can skip this part. (Well, it also makes sense to read this part to learn a little bit about the configuration of our application, so do not be hasty.)

### Create a database
> mix ecto.create

Using our configuration settings, the first command will create a database for our project. Well, the first time you run mix ecto.create on a new project, you will see more happening: the tool mix will also launch the compilation of the application. Do not be worried if the compilation process takes long, the compilation is incremental, so any change on your code will be very quickly done in the future. Often, I get some errors in this step just because I forget very often to start my database server before. Hence, it is a good idea to check whether your postgresql server is running if the compilation process complains.

## Create a Table for the database
This is the command for creating a table .
> mix phx.gen.html
>> mix phx.gen.html Accounts User users name:string age:integer
>> mix phx.gen.html Accounts Racer racer racer_id:string speed:integer boost:integer risk:float points:integer


