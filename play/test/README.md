## temp
  $( document ).ready(function() {
    console.log("JAGUAR DESIGN STUDIO: Web Application Developer\nFor application details, call the \"apply\" function");

    apply = function() {
      console.log("TO APPLY:\n\nYou will need to complete a brief coding exercise. The exercise will involve using Git and the GitHub service to fetch a repository, complete the exercises, and post your answers.\n\nTo get started, call the \"instructions\" function");
    };

    instructions = function() {
      console.log("INSTRUCTIONS:\n\n1. Create an account on GitHub if you do not already have one: https://github.com/join/\n2. Fork the repository at: https://github.com/jaguardesignstudio/developer-exercise\n3. Clone your fork to your local machine\n4. Read the README and complete the exercises. The README contains details on how to run the test suite to check your answers.\n5. Push your completed exercise code to your repository\n6. In the \"Collaborators\" settings page for your repo on GitHub, grant access to GitHub user \"brendonrapp\"\n\nFor details on submitting your completed exercise, call the \"completion\" function");
    };

    completion = function() {
      console.log("COMPLETION:\n\nOnce you have completed the exercise, send an email to: jobs@jaguardesignstudio.com, with subject line: Web Application Developer\n\nIn the email, include:\n  * A link to your exercise repository on GitHub\n  * your resume/CV\n  * any code samples or links to completed work that you wish to share");
    };
  });

## Web Application Developer Exercise

for Jaguar Design Studio

### Introduction

The following exercises are to be completed by web developer candidates applying for a position at Jaguar Design Studio. You will need to use Git and a Bitbucket account to complete and submit the exercises.

It is expected that some applicants will have no previous experience with Git and/or Bitbucket. Successfully using these tools is part of the exercise.

Follow the instructions that were provided in the job posting for details on how to complete this exercise.

### Exercise: Ruby

Candidates are not necessarily expected to be familiar with the Ruby language, but the following exercises are intended to be simple enough that a qualified programmer should be able to complete them after spending a couple of hours learning basic Ruby syntax, and a little consulting of the Ruby language docs.

To complete this exercise, implement the incomplete methods defined in "exercise.rb", such that they pass the tests defined in "exercise_spec.rb".

In order to run the tests, you will need Minitest installed (if you're running Ruby 1.9 or newer, Minitest is already installed - otherwise, install it from Rubygems by running ```gem install minitest```).

To execute the test suite, run:

    $ ruby exercise_spec.rb

The Exercise class is correctly implemented once the test suite returns:

    4 tests, 8 assertions, 0 failures, 0 errors, 0 skips
