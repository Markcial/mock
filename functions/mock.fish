function mock
  set -l _mock $argv[1]
  set -l prefix __"$_mock"
  set -l result_var "$prefix"_result
  set -l body_var "$prefix"_body
  set -g "$result_var" 0
  if test (count $argv) -ge 2
    set "$result_var" $argv[2]
  end
  set -g "$body_var"
  if test (count $argv) -ge 3
    set "$body_var" $argv[3]
  end

  function -V _mock "$_mock"
    set -l name $_mock
    set -l prefix __"$name"
    set -l result_var "$prefix"_result
    set -l body_var "$prefix"_body

    set -l args $argv
    set -l result $$result_var
    set -l body $$body_var
    eval $body
    functions -e $name
    return $result
  end
end
