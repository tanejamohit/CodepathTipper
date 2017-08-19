# Pre-work - Tipper

**Tipper** is a tip calculator application for iOS.

Submitted by: **Mohit Taneja**

Time spent: **8-12** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [x] Total Amounts to be paid if the amount is split between multiple people

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/a/wOAwf' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** I think iOS development has been made really simple by having a storyboard and making it interact with the code editor in xcode, the way one can easily get references to a view or their actions in a class. Also Swift is much easier than Objective C, which I have used in the past and felt much more detailed.
Outlets are references to objects/views in a storyboard file. Outlets are simply empty references of the object type until the view containing the object they are refering to is loaded. Once that view is loaded then they point to the object which we linked them with within the XCode UI.
Actions on the other hand are event and event handlers. When we link events from a particular UIElement to an IBAction, the storyboard saves a reference to the IBAction function as well as a reference to the object in which that IBAction function is defined. And when the linking element fires the event, the IBAction function is called to handle the event. We can have more than one IBAction linked with an event of an element.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** Closures are like anonymous functions which can be passed around like object references, or if you are more inclined towards C++ you can even call them anonymous function pointers. But with closures one can also capture references to objects which are in the scope of function/class where the closure is defined. A very common example of that would be capturing self, which is a reference to the class instance in which the closure is defined. Now if this closure is referenced by a property of the class. And the reference made by the property of the class as well as the reference made by closure to the class are both strong references, i.e. both of them increase the reference count for each other. We would end up being into a scenario where we have a reference cycle. Where the reference count to the class cannot go to zero until the closure stops refering to it and vice versa, which can result in the memory for the class object and the closure never being deallocated.


## License

    Copyright [2017] [Mohit Taneja]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
