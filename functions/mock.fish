set -g _mocks

function mock -a _mock -a result -a code -d "Mock library for fish shell testing"
  set -l blacklisted "builtin" "functions" "eval" "command"
  set -l prefix __"$_mock"

  # add result variable
  set -l result_var "$prefix"_result
  if test -z "$result"
    set result 0
  end
  if not set -q "$result_var"
    set -g $result_var $result
  else
    set $result_var $$result_var $result
  end

  # add exec body variable
  set -l body_var "$prefix"_body
  if test -z "$code"
    set code " "
  end
  if not set -q "$body_var"
    set -g $body_var $code
  else
    set $body_var $$body_var $code
  end

  if contains $_mock $blacklisted
    echo The function '"'$_mock'"' is reserved and therefore cannot be mocked.
    return 1
  else if not contains $_mock $_mocks
    function -V _mock $_mock
      set -l name $_mock
      set -l prefix __"$name"
      set -l result_var "$prefix"_result
      set -l body_var "$prefix"_body
      set -l args $argv
      set -l results (printf "%s\n" $$result_var)
      set -l bodies (printf "%s\n" $$body_var)

      set -l result $results[1]
      set -l body $bodies[1]

      set -e results[1]
      set -e bodies[1]
      set $result_var $results
      set $body_var $bodies

      eval $body
      # check if the mock is contained in the _mocks var
      set -l pos (contains --index -- $_mock $_mocks)
      set -e _mocks[$pos]
      if not contains -- $_mock $_mocks
        functions -e $_mock
      end

      return $result
    end
  end
  set _mocks $_mocks $_mock
end
