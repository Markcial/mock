test "$TEST It should be able to mock with exit success"
  (mock ls; and ls) $status -eq 0
end

test "$TEST It should be able to mock with fail status"
   (mock ls 1; and ls) $status -eq 1
end

test "$TEST It should be able to mock with function body"
   hello = (mock ls 0 "echo hello"; and ls )
end

test "$TEST It should be able to use argument"
   "hello joe" = (mock ls 0 "echo hello \$args"; and ls joe )
end

test "$TEST It should be able to use some arguments"
   "hello joe" = (mock ls 0 "echo hello \$args[1]"; and ls joe mike )
end

test "$TEST It should be able to use multiple arguments"
   "hello joe and mike" = (mock ls 0 "echo hello \$args[1] and \$args[2]"; and ls joe mike )
end

test "$TEST It should be able to use nested functions"
   "1 2 3 4 5" = (mock ls 0 "echo (seq 5)"; and ls )
end

test "$TEST It should be able to use nested functions with arguments"
   "1 2 3 4 5" = (mock ls 0 "echo (seq \$args)"; and ls 5)
end
