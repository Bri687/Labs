## SF01 - Mac Crash Course
Today we will be taking a look at the Tips app and some of the user guides contianed within. The goal is to help those new to Mac find resources to help them learn. Afterwards you will have time to explore the app independently.

## SF02 - Mac Tips
Today we will review a few key pieces of knowledge of navigating your Mac:
- Menu Bar
- Finder Navigation
- Spotlight Search
- System Settings

## SF03 - Mac Keyboard Shortcuts
Today we will cover some key Mac keyboard shortcuts. First we'll look at the [abbreviated symbols (⌘⇧⌥⌃⌫)](https://support.apple.com/guide/mac-help/what-are-those-symbols-shown-in-menus-cpmh0011/mac), then we'll try out the following Keyboard shortcuts:
- ⌘ + Space: Spotlight
- ⌘Tab: Change Apps
- ⌘`: Change Windows
- ⌃⌘ Space: Emoji Keyboard
- ⌘ C: Copy, ⌘ X: Cut, ⌘ V: Paste
- ⌘ Q: Quit
- ⌘ ,: Application Settings
- ⇧⌘ 3: Screenshot (Whole Screen), ⇧⌘ 4: Screenshot (Selection), ⇧⌘ 5: Screenshot (w/ Options)

## SF04 - Xcode Keyboard Shortcuts
Today we will look at some useful keyboard shortcuts in Xcode.
- ⌘O: Open file
- ⌘B: Build
- ⌘R: Run
- ⌘→: End of Line, ⌘←: Beginning of Line
- ⌘↑: Page Up, ⌘↓: Page Down
- ⌥→: Next word, ⌥←: Previous Word
- ⌘⌥ [ and ⌘⌥ ]: Move line up/down
- ⌘F: Find in File, ⇧⌘F: Find in Project

## SF05 - Review Constants, Variables, Types, and Strings
Today we will review the first few lessons of this unit. This will be a Questions & Comments review: Please direct message today's instructor with one of the following:
- A question you have about one of the topics we covered this week.
- An explanation of a concept from this week that may clarify for others.

## SF06 - CocoaHeads
Today we will review what CocoaHeads is, when they meet, and what happens at CocoaHeads meetings, including your opportunities to present. Attending these meetings is our #1 tip for finding a job quickly after graduation.

## SF07 - Git Review
Today we will review yesterday's lesson one more time by having students work in pairs to come up with an analogy for git. Complete the following sentence: "Git is like a ____ because ____".

## SF08 - git add & git commit
Today we will continue our mini lessons on Git by learning about the git add and commit command. First, we need to review the three parts of Git: Working Directory, Index, and Repository.
Working Directory: The folder on your computer where you are hosting your Git Repository; reflects the current version you are editing.
Index: The list of changes you have made since the last version was committed. You must _stage_ your changes to indicate you want to save them next time you commit. You do this using the `add` command.
Repository: The .git folder which holds information about your repository and all previous data/versions you have committed in the past, including branches.
 Now, let's practice making a change and committing it to save a new version.
1. Navigate to a git repository (the one from yesterday works or you can make a new one) in terminal (reminder to use `cd` and `ls` to navigate).
2. Add a file to this folder (either in finder or using `touch File.txt`). Your _working directory_ now includes changes from your last commit that are not yet stored in the repository.
3. You must now _stage_ your change by _add_ing the change to the _index_. While you can pick and choose which changes to commit, for now let's just do `add .`; this means "stage all changes in the current directory".
4. Finally, we _commit_ those changes to the _repo_ to save this version of your code. Type `git commit -m "your message", with your message being a descriptive comment of what changed in this version of your code. In this case it might be something simple like "Added File.txt to repo."

## SF09 - git log & git status
Today we will continue our mini lessons on Git by learning about git log & git status. Git log and git status help us view information about the current state of our repository.
1. Navigate to a git repository.
2. Open File.txt from yesterday (or make the file if you haven't) and add some text to it. (You can open it quickly from terminal by typing `open File.txt`.)
3. In Terminal type `git status`. You should see information about what changes you have made and whether or not they are staged yet.
4. Type `git add .`, then run `git status` again. You should see that the changes you made are now staged.
5. Type `git commit -m "edited File.txt"`. Then, run `git log`. You should see a history of all the commits you have made so far. Each is tagged with a unique hash code, which will become important later if you want to revert to a previous version.

## SF10 - git checkout
Today we will continue our series of mini-lessons on Git by learning about `git checkout`. So far, you have learned how to create a repository and add commits to save versions of your code as you go. But what if you want to actually access those previous versions? To do this we use `git checkout`. You can remember the purpose of this function if you think of it as temporarily "checking out" a previous version from your "library" of versions.
1. In Terminal, navigate to the git repository you have been practicing in.
2. Use `git log` to view the history of commits. Select a commit you want to go back to and copy its hash identifier. Then close the log.
3. Run `git checkout 28af83402h`, replacing the hash with the one you copied. (Note: You can use just the first few characters of the hash--you don't have to copy the whole thing). This will change your working directory to match the state it was in when you made that commit. In this way it's very similar to loading a save file in a video game--you are warped back to that point in time.
4. To return to the most recent commit, type `git checkout main`. This will return to the most recent commit on the main branch.

## SF11 - GitHub Overview
Today we will learn about GitHub, a service built on top of (but not the same as) git.

## SF12 - GitHub Auth & Tokens
Today we will help you understand and set up your GitHub token to sign into GitHub in Xcode and Terminal. The instructor will show you:
- Where to navigate to to create a login token
- How to configure your token settings
- Where to input that token to sign in on Xcode and Terminal

_REMEMBER TO SAVE YOUR TOKEN_ somewhere secure (like Passwords app or a secure note) so that you don't have to generate a new one next time you sign in

## SF13 - git push
Today we will use the `git push` command. `push` allows you to upload your git repository's most recent commits to the GitHub copy of your repository. Keeping your local (on your computer) git repo and your remote (on GitHub) repo synchronized is important so that you can access code from different computers, recover code if it's lost, and collaborate on shared code for group projects.

## SF14 - git pull
Today we will use the `git pull` command. Like `git push`, `git pull` is used to synchronize your remote and local repositories. Pull is used to get changes made to the remote repository and download them to your local copy.

## SF15 - GitHub Review
Today let's review what GitHub is and how to use `git push` and `git pull`. In addition, we will talk about what happens when your local and remote repos get out of sync and how to fix it using `git pull --rebase` or `git stash`.

## SF16 - git branch
Today we'll learn more about git branching. Branches are an organizational tool. They help you keep code changes separate in case anything breaks, and so that people collaborating on a project aren't all trying to make changes at the same time. Branches are somewhat similar to the difference between remote and local repositories--they are different copies of the same code base, with a shared history of commits from before they branched apart, and different histories afterwards.
- Create a branch using `git branch name-describing-what-youre-working-on-in-this-branch` and then `git checkout (branch name)`. For convenience, you can also combine these steps with `git checkout -b name-of-branch` (with the -b indicating that a new branch should be created).
- To switch back to the main branch, type `git checkout main`.

## SF17 - git merge


## SF18 - git rebase


## SF19 - Review Git


## SF20 - Review Git


## SF21 - GitHub Lab


## SF22 - GitHub Lab


## SF23 - Types


## SF24 - Function Signatures


## SF25 - Structs & Classes


## SF26 - Scope


## SF27 - Collections


## SF28 - Loops


## SF29 - Optionals


## SF30 - Guard


## SF31 - Guard


## SF32 - Guard


## SF33 - Guard


## SF34 - Guard


## SF35 - Guard


## SF36 - Guard


## SF37 - Guard


## SF38 - Guard


## TP01 - Enum


## TP02 - Terminal, Git, GitHub


## TP03 - Segues and Nav Controllers, Tab Bar Controllers, Constraints


## TP04 - ViewController Life Cycle


## TP05 - Workflows, HIG


## TP06 - Protocols


## TP07 - Delegation


## TP08 - App Anatomy, Life Cycle, MVC


## TP09 - Scroll Views


## TP10 - Table Views


## TP11 - Table Views


## TP12 - Table Views


## TP13 - Codable, plists, FileManager


## TP14 - System view controllers (alert, Safari,Mail, etc)


## TP15 - Dates, Date Picker, TableView CellHeight


## TP16 - Swift Fundamentals topics


## TP17 - Swift Fundamentals topics


## TP18 - Swift Fundamentals topics


## TP19 - Protocols


## TP20 - Delegation


## TP21 - App Anatomy, Life Cycle, MVC


## TP22 - Scroll Views


## TP23 - Table Views


## TP24 - Codable


## TP25 - Plists


## TP26 - FileManager


## TP27 - System view controllers (alert,Safari, Mail, etc)


## TP28 - Dates, Date Picker, TableView CellHeight


## ND01 - Swift Fundamentals topics


## ND02 - Swift Fundamentals topics


## ND03 - Swift Fundamentals topics


## ND04 - Tables and Persistence topics


## ND05 - Tables and Persistence topics


## ND06 - Closures, Extensions


## ND07 - Animation


## ND08 - HTTP and URL


## ND09 - Decoding JSON


## ND10 - Concurrency


## ND11 - Closures, Extensions


## ND12 - Animation


## ND13 - HTTP and URL


## ND14 - Decoding JSON


## ND15 - Concurrency


## ND16 - Swift Fundamentals topics


## ND17 - Swift Fundamentals topics


## ND18 - Tables and Persistence topics


## ND19 - Tables and Persistence topics


## ND20 - Advanced Data Collections topics


## ND21 - Advanced Data Collections topics


## ST01 - Swift Fundamentals topics


## ST02 - CoreData Basics


## ST03 - Swift Fundamentals topics


## ST04 - Tables and Persistence topics


## ST05 - Tables and Persistence topics


## ST06 - Advanced Data Collections topics


## ST07 - SwiftUI Basics


## ST08 - @State, @Binding, @StateObject,@Published


## ST09 - Custom Views, ForEach, List


## ST10 - SwiftUI Navigation (NavStack,NavLink, etc)


## ST11 - MVVM


## ST12 - SwiftUI Animations


## ST13 - SwiftUI/UIKit Integration


## ST14 - Advanced Data Collections topics


## ST15 - Advanced Data Collections topics


## ST16 - Basic TDD, Red-Green-Refactor


## ST17 - SOLID


## ST18 - Fakes, Mocks, Stubs


## ST19 - Expectations


## ST20 - CoreData Entities and Models


## FA01 - CoreData Relationships and CRUD


## FA02 - CoreData Binary Data


## FA03 - SwiftData


## FA04 - SwiftUI Basics


## FA05 - @State, @Binding, @StateObject,@Published


## FA06 - Custom Views, ForEach, List


## FA07 - SwiftUI Navigation (NavStack,NavLink, etc)


## FA08 - MVVM


## FA09 - SwiftUI Animations


## FA10 - SwiftUI/UIKit Integration


## FA11 - Basic TDD, Red-Green-Refactor


## FA12 - SOLID


## FA13 - Fakes, Mocks, Stubs


## FA14 - Expectations


## FA15 - CoreData Basics


## FA16 - CoreData Entities and Models


## FA17 - CoreData Relationships and CRUD


## FA18 - CoreData Binary Data


## FA19 - SwiftData


## FA20 - Discuss: In the course of thisprogram, what routines have you developed when coding?


## PC01 - Discussion: What design philosophieshave you embraced when coding? Which do you prefer to avoid?


## PC02 - Text and Image Views, Controls


## PC03 - Colections, Loops


## PC04 - Xcode, Interface Builder Basics


## PC05 - Text and Image Views, Controls


## PC06 - Auto Layout, Stack Views


## PC07 - Optionals, Type Casting, Guard, Enum


## PC08 - Terminal, Git, GitHub


## PC09 - Segues and Nav Controllers, Tab BarControllers, Constraints


## PC10 - View Controller Life Cycle


## PC11 - Workflows, HIG


## PC12 - Protocols


## PC13 - Delegation


## PC14 - App Anatomy, Life Cycle, MVC


## PC15 - Scroll Views


## PC16 - Table Views


## PC17 - Codable, plists, FileManager


## PC18 - System view controllers (alert,Safari, Mail, etc)


## PC19 - Dates, Date Picker, TableView CellHeight


## PC20 - Closures, Extensions


## PC21 - Animation


## PC22 - HTTP and URL


## PC23 - Decoding JSON


## PC24 - Custom Views, ForEach, List


## PC25 - SwiftUI Navigation (NavStack,NavLink, etc)


## PC26 - MVVM


## GC01 - Discussion: As you work with yourgroup, what parts of your app design do you need to align on? Documentation? Architecture? Naming conventions?


## GC02 - Discussion: What routines do you andyour group need to put in place to ensure you succeed? Scrum? Stand ups? Delegation of responsibilities?


## GC03 - Discussion: What is the mosteffective and efficient way to understand someone else's code? How can you work together to make each others' code readable?


## GC04 - SwiftUI Animations


## GC05 - SwiftUI/UIKit Integration


## GC06 - Basic TDD, Red-Green-Refactor


## GC07 - SOLID


## GC08 - Fakes, Mocks, Stubs


## GC09 - Expectations


## GC10 - CoreData Basics


## GC11 - CoreData Entities and Models


## GC12 - CoreData Relationships and CRUD


## GC13 - CoreData Binary Data


## GC14 - SwiftData


## GC15 - 


## GC16 - 


## GC17 - 


## GC18 - 


## GC19 - 


## GC20 - 


## GC21 - 


## GC22 - 


## GC23 - Discuss: In what ways can your skillas a coder be used to benefit others? Broadly or specifically.


## GC24 - Discuss post graduation plans


## GC25 - Discuss job search tips and tricks


## GC26 - Discuss presentation requirements


## GC27 - Discussion: Compare yourself beforethis course and after. How have things changed? Have you achieved the course objective: - [ ] Utilize the tools of the Swift language and Xcode IDE, alongside one’s preferred disciplines and philosophies of coding as an art form, to join a team in the development of a simple, well designed, marketable and full featured app.


