# 37signals intern programmer exercise

Hey there! 👋

Your goal for this exercise is to add support for importing contacts from a vCard file to a basic [Rails 7](https://github.com/rails/rails) application.

We've created a template application with a single model called `Contact`. The already app allows you to individually add a contact using the **New Contact** form, and we think a nice addition would be to import contacts from a file in [vCard format](https://datatracker.ietf.org/doc/html/rfc6350).

We've included a stubbed-out controller to handle this (see `Contact::ImportsController`). The rest is up to you! Your challenge is to write the code to parse a vCard file (which may include multiple contacts) and insert them into the database. You should assume that contacts are unique by email address and avoid importing the same contact twice.

There are Ruby gems out in the wild that will do the heavy lifting of vCard parsing for you. The application is configured to use [Tailwind CSS](https://tailwindcss.com/) which you can use to style your pages.

We think it should take a couple of hours to complete, depending on your Rails experience. If you have time, try and add a few tests.

Good luck!

## Getting started

1. [Install Ruby 3.2.0](https://www.ruby-lang.org/en/documentation/installation/).

2. Clone this repo and get it up and running on your machine. Start by running `./bin/setup`.

3. Peek at the root of the app `/` in your browser. You should see the Contact index page with two buttons – one to add a contact, one to import contacts. Try adding a contact manually to see it in action. Clicking on **Import Contacts** will result in a blank page. This is where you'll need to introduce your form to load the vCard file.
  
  <img width="877" alt="App screenshot" src="https://user-images.githubusercontent.com/5447/222133131-5c1a2cc8-cba4-4506-a333-bd3878e6e37c.png">

4. We recommend using a third-party gem to manage parsing vCards.

5. Submit your solution by opening a pull request in this repo. Feel free to elaborate on any aspect of your solution and the choices you made in the pull request description, or in pull request comments, referencing some of your code. If we interview you, we’ll walk through your code and discuss it together.


## Requirements:

* Wire up vCard imports so that new contacts are created from an uploaded `.vcf` file.
* Support vCard files with one contact or many contacts.
* Don’t worry about supporting fields other than name and email address. Other fields in the vCard can be ignored.
* Assume that contacts must be unique by email address and handle duplicates accordingly.
* Provide feedback about the import result, whether it succeeds or fails, using [a flash message](https://guides.rubyonrails.org/action_controller_overview.html#the-flash).
