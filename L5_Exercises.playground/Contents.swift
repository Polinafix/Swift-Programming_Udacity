//: # Lesson 5 Exercises - Defining and Calling Functions

import UIKit

//Problem 1.

//Earlier we used the method, removeAtIndex() to remove the first letter of a string. This method belongs to the String class. See if you can use this same method to return the last letter of a string.

//:Test out your discovery below by returning the last letter of the String, "bologna".
var word = "bologna"
var lastLetter = word.remove(at: word.index(before: word.endIndex))

//: __Problem 2__
//:
//: Write a function called combineLastCharacters. It should take in an array of strings, collect the last character of each string and combine those characters to make a new string to return. Use the strategy you discovered in Problem 1 along with a for-in loop to write combineLastCharacters. Then try it on the nonsenseArray below.
var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]
//My solution
func combineLastCharacters(_ stringsArray: [String])-> String{
    var newWord = ""
    for var word in stringsArray{
        let lastLetter = word.remove(at: word.index(before: word.endIndex))
        newWord.append(lastLetter)
        
    }
    return newWord
}
combineLastCharacters(nonsenseArray)

//: __Problem 3__
//:
//: Imagine you are writing an app that keeps track of what you spend during the week. Prices of items purchased are entered into a "price" textfield. The "price" field should only allow numbers, no letters.

//: NSCharacterSet.decimalDigitCharacterSet() is used below to define a set that is only digits. Using that set, write a function that takes in a String and returns true if that string is numeric and false if it contains any characters that are not numbers.

//: __3a.__ Write a signature for a function that takes in a String and returns a Bool

//: __3b.__ Write a for-in loop that checks each character of a string to see if it is a member of the "digits" set. Use the .unicodeScalars property to access all the characters in a string. Hint: the method longCharacterIsMember may come in handy.

let digits = CharacterSet.decimalDigits
//My Solution
func checkDigit(_ myString: String) -> Bool{
    for letter in myString.unicodeScalars{
        if !digits.contains(UnicodeScalar(letter.value)!) {
            return false
    }
    return true
}

//: __Problem 4__
//:
//: Write a function that takes in an array of dirtyWord strings, removes all of the four-letter words, and returns a clean array.
let dirtyWordsArray = ["phooey", "darn", "drat", "blurgh", "jupiters", "argh", "fudge"]

//My Solution

func noFour(_ theArray:[String])->[String]{
    var newArray = [String]()
    for word in theArray{
        if word.characters.count != 4{
            newArray.append(word)
        }
    }
    return newArray
}

noFour(dirtyWordsArray)

//: __Problem 5__
//:
//: Write a method, filterByDirector, that belongs to the MovieArchive class.  This method should take in a dictionary of movie titles and a string representing the name of a director and return an array of movies created by that director. You can use the movie dictionary below. To test your method, instantiate an instance of the MovieArchive class and call filterByDirector from that instance.

var movies:Dictionary<String,String> = [ "Boyhood":"Richard Linklater","Inception":"Christopher Nolan", "The Hurt Locker":"Kathryn Bigelow", "Selma":"Ava Du Vernay", "Interstellar":"Christopher Nolan"]

//My Solution

class MovieArchive {
    func filterByDirector(_ directorName: String, _ movie: Dictionary<String, String>) -> [String]{
        var newArray = [String]()
        for (movie,name) in movie{
            if name == directorName{
                newArray.append(movie)
            }
            
        }
        return newArray
    }

}
var myArchive = MovieArchive()
myArchive.filterByDirector("Christopher Nolan", movies)

