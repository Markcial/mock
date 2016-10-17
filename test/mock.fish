function setup
  set root (dirname (status -f))
  source $root/functions/mock.fish
end

test "$TESTNAME It should be able to mock with exit success"
  (mock ls; and ls) $status -eq 0
end

test "$TESTNAME It should be able to mock with fail status"
   (mock ls 1; and ls) $status -eq 1
end

test "$TESTNAME It should be able to mock with function body"
   hello = (mock ls 0 "echo hello"; and ls )
end

test "$TESTNAME It should be able to use argument"
   "hello joe" = (mock ls 0 "echo hello \$args"; and ls joe )
end

test "$TESTNAME It should be able to use some arguments"
   "hello joe" = (mock ls 0 "echo hello \$args[1]"; and ls joe mike )
end

test "$TESTNAME It should be able to use multiple arguments"
   "hello joe and mike" = (mock ls 0 "echo hello \$args[1] and \$args[2]"; and ls joe mike )
end

test "$TESTNAME It should be able to use nested functions"
   "1 2 3 4 5" = (mock ls 0 "echo (seq 5)"; and ls )
end

test "$TESTNAME It should be able to use nested functions with arguments"
   "1 2 3 4 5" = (mock ls 0 "echo (seq \$args)"; and ls 5)
end

test "$TESTNAME It should be able to use nested functions with arguments"
   "1 2 3 4 5" = (mock ls 0 "echo (seq \$args)"; and ls 5)
end

test "$TESTNAME It should not mock blacklisted elements 1"
   (mock builtin) = "The function \"builtin\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME It should not mock blacklisted elements 2"
   (mock functions) = "The function \"functions\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME It should not mock blacklisted elements 3"
   (mock eval) = "The function \"eval\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME It should mock -n times"
  "ok" "ok" = (
    mock ls 0 "echo one"
    mock ls 1 "echo two"
    if test (ls) = "one" -a $status -eq 0
      echo ok
    else
      echo ko
    end
    if test (ls) = "two" -a $status -eq 1
      echo ok
    else
      echo ko
    end
  )
end

test "$TESTNAME It sould accept functions with dashes"
  "ok" = (mock ssh-add 0 "echo ok"; and ssh-add)
end
