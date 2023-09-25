module Hello where
  -- create heskell variables
  salutation = "Salute"
  -- person = "Jahidul Arafat"
  --person = "test person" -- this will trigger error, as heshkell variables are immutable

  -- create some regular function
  -- tradeoff between "more principled way of writing functions" vs "redability and maintainability of code"
  -- 1. Create a makeGreeting function with named parameters "salutation" and "person"
  makeGreeting salutation person =
    salutation <> " " <> person <> "!!!!!"

  -- 1a. Apply n-reduction to make it pointfree
  --makeGreeting' salutation = (<>) (salutation <> "!! ") -- makeGreeting' "test" "ss"
  -- pointfree variant
  firstPart = (<> " ")
  makeGreeting' = (<>) . firstPart

  -- non-pointfree partial variant
  makeGreeting'' = (<>).(\salutation -> salutation <> "")
  makeGreeting''' salutation = (<>) (salutation <> " ")
  makeGreeting'''' salutation = ((salutation <> " ") <>)

  -- 2. Create a partially applied function
  greetPerson = makeGreeting "Hello" -- simulation: greetPerson "Arafat"
  enthusiasticGreeting salutation name= makeGreeting (salutation <> "!") name

  -- 3(a). Turn regular function into an infix function
  greetArafat = (`makeGreeting` "Arafat") -- greetArafat "hello"

  -- 3(b). Create a flip function
  greetAlice = (flip makeGreeting) "Alice" -- greetAlice "hello"

  -- 3(c) Imagine a function that combines three strings
  sayThree a b c = a <> " " <> b " " <> c -- not working


  -- create several lambdas
  makeThruple a b c = (a,b,c)
  lambdaThruple a b = \c->(a,b,c)
  lambdaThruple' = \a -> \b -> \c ->(a,b,c)

  -- composition of functions
  addOne num = num+1 -- f(x) = x+1
  timesTwo num = num*2 -- f(x) = 2x
  timesThree num = num*3 -- f(x) =3x
  squared num = num*num -- f(x) =x^2
  minusFive num = num-5 -- f(x) = x-5

  findResult num = minusFive (squared (timesThree (addOne num)))
  times2Plus1= timesTwo . addOne -- . is a composition operator

  -- create function 'add'
  fn_add n1 n2 = n1+n2

  -- create a custom operator named "+++"
  (+++) n1 n1 = n1+n2

  -- default
  main = print $ makeGreeting
