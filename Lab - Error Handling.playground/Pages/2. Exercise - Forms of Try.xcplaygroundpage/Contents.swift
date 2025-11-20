/*:
## Exercise - Forms of Try
 
 The throwing function below produces an error if the user attempts to divide by zero. Call the function using `try` in a `do`/`catch` statement, printing the error to the console. Test using valid and invalid inputs to see the result.
 */
enum MathError: Error {
    case divideByZero
}

func divide(_ numerator: Double, by denominator: Double) throws -> Double {
    guard denominator != 0 else { throw MathError.divideByZero }
    return numerator / denominator
}

do {
    let result = try divide(10, by: 2)
    print("Result (valid): \(result)")
} catch {
    print("Error dividing numbers: \(error)")
}

do {
    let result = try divide(10, by: 0)
    print("Result (invalid): \(result)")
} catch {
    print("Error dividing numbers: \(error)")
}

//:  Now call the function using `try?`. Since errors are not handled when using `try?`, you do not need a `do`/`catch` statement. Test using valid and invalid inputs, printing the result.
let safeResult1 = try? divide(20, by: 4)
print("try? valid result:", safeResult1 as Any)

let safeResult2 = try? divide(20, by: 0)
print("try? invalid result:", safeResult2 as Any)

//:  Finally, call the function using `try!` and test it with an invalid input. What happens if the input is invalid? Write a comment explaining your answer, then set a valid input.
let forcedResult = try! divide(8, by: 2)
print("try! valid result:", forcedResult)

/*:
[Previous](@previous)  |  page 2 of 4  |  [Next: Exercise - Associated Values](@next)
 */
