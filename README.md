## Advent of Code 2025

Solutions to the 2025 edition of Advent of Code in Swift. The solutions will avoid code golf tricks, and try to be simple. They may not be the cleanest or the fastest - a correct answer is a correct answer after all - but the idea is to keep them fairly clean, and acceptably fast.

Liberties have been taken. The path to the puzzle input files is hard coded, so change **Utilities.resourceDirectory** before you try and use the code. I also play fast and lose with forced unwrapping of optionals and error handling, as I trust the input. 🙈

### My thoughts
1. **Safecracking**: The first puzzle was fine, but the second was a bit annoying to get all the zero crossings when turning left.
2. **Invalid IDs** :Fairly straightforward. The second being a generalised version of the first.
3. **Batteries**: Similar to 2 in that both puzzles were fairly similar to each other, and the second solution was a more general version of the first.
4. **Paper rolls**: Another easy one. The second puzzle was more or less wrapping the fist solution in a while loop.
5. **Ingredient IDs**: Swift RangeSet made both puzzles straightforward.
6. **Cephalapod maths**: The first puzzle was simple enough, which led to some false confidence after the previous days. I found this to be a parsing nightmare. No doubt others have one lined it!
7. **Tachyon beams**: I found part one straightforward, but struggled to understand the question for part two. Once I got it solving was easy enough.