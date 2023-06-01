import Foundation

/*
 You would like to set a password for a bank account. However, there are three restrictions on the format of the password:
 
 - it has to contain only alphanumerical characters (a−z, A−Z, 0−9);
 - there should be an even number of letters;
 - there should be an odd number of digits.
 
 You are given a string S consisting of N characters. String S can be divided into words by splitting it at, and removing, the spaces. The goal is to choose the longest word that is a valid password. You can assume that if there are K spaces in string S then there are exactly K + 1 words.

 For example, given "test 5 a0A pass007 ?xy1", there are five words and three of them are valid passwords: "5", "a0A" and "pass007". Thus the longest password is "pass007" and its length is 7. Note that neither "test" nor "?xy1" is a valid password, because "?" is not an alphanumerical character and "test" contains an even number of digits (zero).

 Write a function:

 class Solution { public int solution(String S); }
 that, given a non-empty string S consisting of N characters, returns the length of the longest word from the string that is a valid password. If there is no such word, your function should return −1.

 For example, given S = "test 5 a0A pass007 ?xy1", your function should return 7, as explained above.

 Assume that:

 N is an integer within the range [1..200];
 string S consists only of printable ASCII characters and spaces.
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
*/

func solution(_ password: inout String) -> Int {
    if password.isEmpty || password.count > 1200 {
        print("Empty or password > 1200 validation error: \(password)")
        return -1
    }
    
    let words = password.replacing(#/\\s+/#, with: " ").split(separator: " ")
    
    var maxLength = -1
    
    words.forEach { word in
        if word.wholeMatch(of: #/^[0-9a-zA-Z]*$/#)?.output != nil {
            print("ASCII validation success: \(word)")
            let lettersQty = word.replacing(#/[a-zA-Z]+/#, with: "").count
            let digitsQty = word.replacing(#/[0-9]+/#, with: "").count

            print("Letters Qty: \(lettersQty)\nDigits Qty: \(digitsQty)")
            
            if (lettersQty % 2 == 1) && (digitsQty % 2 == 0) {
                print("Validation success: \(word)")
                maxLength = max(maxLength, lettersQty + digitsQty)
            }
        }
    }
    
    return maxLength
}

var password = "a0A"

print(solution(&password))
