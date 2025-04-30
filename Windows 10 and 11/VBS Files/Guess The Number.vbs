Option Explicit

Dim randomNumber, userGuess, attempts, message

' Initialize variables
Randomize
randomNumber = Int((100 * Rnd) + 1)
attempts = 0

Do
    attempts = attempts + 1
    userGuess = InputBox("Guess a number between 1 and 100:", "Guess the Number Game")
    
    ' Check if user pressed Cancel
    If userGuess = "" Then
        MsgBox "Game has been cancelled.", vbInformation, "Cancelled"
        Exit Do
    End If

    ' Validate if the input is a number
    If Not IsNumeric(userGuess) Then
        MsgBox "Please enter a valid number between 1 and 100.", vbExclamation, "Invalid Input"
    Else
        userGuess = CInt(userGuess) ' Convert user input to an integer
        
        ' Check if the guess is within the valid range
        If userGuess < 1 Or userGuess > 100 Then
            MsgBox "Please enter a valid number between 1 and 100.", vbExclamation, "Invalid Input"
        ElseIf userGuess < randomNumber Then
            MsgBox "Too low! Try again.", vbInformation, "Hint"
        ElseIf userGuess > randomNumber Then
            MsgBox "Too high! Try again.", vbInformation, "Hint"
        Else
            message = "Congratulations! You guessed the number " & randomNumber & " in " & attempts & " attempts."
            MsgBox message, vbInformation, "You Win!"
            Exit Do
        End If
    End If
Loop
