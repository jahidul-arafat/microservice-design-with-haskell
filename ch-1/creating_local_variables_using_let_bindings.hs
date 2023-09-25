module Locals where
  makeGreeting sal person =
    sal <> " " <> person

  calling_main = print $ makeGreeting "Hello" "World"

  -- TODO 1: update the makeGreeting method to create an intermediate value using let binding
  -- Syntax: let vars in expr
  makeGreeting' sal person =
    let msgWithTrailingSpace = sal <> "!!! "
    in msgWithTrailingSpace <> person

  -- TODO 2: extend the makeGreeting function with only one attribute 'person'
  extendedGreeting person =
    let hello = makeGreeting' "Hello" person
        goodDay = makeGreeting' "Have a nice day" person
        goodBye = makeGreeting' "See you later" person
    in hello <> "\n" <> goodDay <> "\n" <> goodBye

  -- TODO 3: Revise the makeGreeting function with Let binding a temporary function
  extendedGreeting' person =
    let joinWithNewLines a b = a <> "\n" <> b
        hello = makeGreeting' "Hello" person
        goodBye = makeGreeting' "See you later" person
    in joinWithNewLines hello goodBye

  -- TODO 4: Recursive let binding, order doesn't matter; Here we have 4x let bindings where each can refer to one another
  extendedGreeting'' person =
    let joinWithNewLines a b = a <> "\n" <> b
        hello = makeGreeting' "Hello" person
        goodBye = makeGreeting' "See you later" person
        joined = joinWithNewLines hello goodBye
    in joined

  -- TODO 5: Nested let binding
  extendedGreeting''' person =
    let joinWithNewLines a b = a <> "\n" <> b
        helloAndGoodbye hello goodbye =
          let hello' = makeGreeting' hello person
              goodbye' = makeGreeting' goodbye person
          in joinWithNewLines hello' goodbye'
    in helloAndGoodbye "Hello" "Goodbye"

  -- TODO 6: where binding
  -- keyword: 'where'; should come at the end of the function
  -- anything in where is available in let but not vice versa (conversely)
  whereExtendedGreeting name place =
    let
      sal = "Hello " <> name
      meetingInfo = location "Tuesday"
    in sal <> " " <> meetingInfo
    where
        location day = "we met at " <> place <> " on a " <> day

  -- TODO 7: Revise the Greeting only with "where" binding; no let binding
  extendedGreeting'''' person =
    helloAndGoodbye "hello" "Goodbye"
    where
      joinWithNewlines a b = a <> "\n" <> b
      helloAndGoodbye hello goodbye =
        joinWithNewlines hello' goodbye'
        where
          hello' = makeGreeting' hello person
          goodbye' = makeGreeting' goodbye person
