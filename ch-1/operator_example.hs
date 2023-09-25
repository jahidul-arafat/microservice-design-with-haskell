module OperatorExample where
  -- you can't define multiple 'operators' into a single file
  -- Task01: Define a new operator named '+++'
  -- define the fixity declaration to solve the precedence problem
  infixl 6 +++  -- here addition is left associative and has the same precedence 6 of the normal addition operation
                -- infixl 7 +++
                -- infixl 8+++
  (+++) a b = a+b -- in prefix form -- default binding precedence of our operator '+++' is 9(highest precedencetes)
                  -- precedence of '*' is 7
                  {- Simulation Scenarios
                  1+++2*3
                  1+2*3
                  3*2++1

                  -}

   -- Task02: Define a new operator named '***'
   --infixl 8 ***
   -- a *** b = a * b  -- in infix form
                       -- Default precedence of '*' is 7
                       -- if two operator having same precedence, then left-to-right associativity


  {--
  Problem 01:
  1+++2*3 = (1+++2)*3 =9
  when in normal arithmetic 1+2*3=1+(2*3)=7
  So, our custom operator '+++' has higher precedence than '*' in arithmetic operation.
  How this can be solved? - using Fixinity decalaration
  (a) Define the operator's associativity
  - infixl - for left associativity
  - infixr - for right associativity
  - infix if the operator is not associative

  (b) Define operators binding precendence
    0 - lowest precedence
    9 - highest precedence

  Default, '+' is left associative
  -}