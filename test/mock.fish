test "$TEST It should be able to mock with exit success"
  (mock ls; and ls) $status -eq 0
end

test "$TEST It should be able to mock with fail status"
   (mock ls 1; and ls) $status -eq 1
end

test "$TEST It should be able to mock with function body"
   hello = (mock ls 0 "echo hello"; and ls )
end
