---
id: 70C266A7-B935-4696-8BCD-E7C3569595CF
name: #1 - Mad Lib Generator
type: project
assignDay: SF07
dueDay: SF08
location: 
---

# #1 - Mad Lib Generator Project Requirements - Due Aug 22, 2025

For this project, you will create a Swift Playground that generates a randomized Mad Lib. If you're unfamililar, a quick Google search will show you what they are and examples of similar apps. Follow the steps below to complete your project.

## Instructions

1. Create a new Playground titled MadLibGenerator.
2. Create a function called generateMadLib() that returns a String. We will add its parameters in a moment.
3. Find, write, or generate a one paragraph story for which you will have your users fill in blanks. In your function, return this paragraph as a String.
4. Use String Interpolation to fill the blanks in your paragraph with parameters from your function signature, where users can input their own words. For example, you might delete an existing noun and have a parameter called noun of type String to replace it. If you have more than one noun/adjective/etc, you can add a number to the end (noun1, noun2, etc).
5. Test your function. By calling generateMadLib(noun:,adjective:) (or whatever parameters you wound up with), you should get back your paragraph with the chosen words substituted.
6. We should make sure the user has entered valid strings so their mad lib turns out properly. Using an if-else statement, make sure that all input parameters are not empty strings, and if they are, return a String that says "Invalid Input".
7. For the final step, it might be more interesting if the user gets back a random story each time. At the top of your function, add a constant called randomStorySelection of type Int, and assign it a random number from 1 to 3 by setting it to Int.random(in: 1...3).
8. Add a switch statement that switches on randomStorySelection to choose which story to return, then add two new stories in addition to your first. Without more advanced techniques or splitting into multiple functions, these two additional stories will need to have the same number and types of blanks to fill in.
9. Test your Mad Lib generator by having a partner call your function in your playground and see the result.

## Black Diamond

It might be even more fun if the order of the different words is randomized as well, so that, for instance, the nouns a user provided may appear in any order in the story. Find a way to randomize this order.

## Rubric

- Student has just one function that takes several parts of speech as input and generates three or more randomized Mad Lib stories as output.
- Passing invalid input (i.e. empty strings) returns an error string.