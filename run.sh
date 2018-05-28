bash -lc 'mkdir ./compiled' 2>/dev/null
bash -lc 'mkdir ./store' 2>/dev/null

exec_bench() {
  if [ `uname -s` = Linux ]; then
		exec 3>&1 4>&2
  	TT=$( { /usr/bin/time -f '%e sec.' $1 1>&3; } 2>&1 )
  	printf "\033[1m"
   	printf "$TT"
  	printf "\033[0m"
  	echo "";
  	echo "---";
  else
		exec 3>&1 4>&2
  	TT=$( { /usr/bin/time $1 1>&3; } 2>&1 )
  	printf "\033[1m"
   	printf "$TT"
  	printf "\033[0m"
  	echo "";
  	echo "---";
  fi
}

# exec_bench './source/perl.pl'
# exec_bench './source/perl2.pl'
# exec_bench './source/php.php'
# exec_bench './source/php2.php'
# exec_bench './source/node.js'
# exec_bench './source/node2.js'
exec_bench './source/node3.js'
# exec_bench './source/ruby.rb'
# exec_bench './source/ruby2.rb'
# exec_bench './source/python.py'
# exec_bench './source/python2.py'
# exec_bench './source/kotlin.kts'
# exec_bench './source/elixir.ex'

# swiftc -O ./source/swift.swift -o ./compiled/swift
# exec_bench './compiled/swift'
# swiftc -O ./source/swift2.swift -o ./compiled/swift2
# exec_bench './compiled/swift2'
swiftc -O ./source/swift3.swift -o ./compiled/swift3
# swiftc ./source/swift3.swift -o ./compiled/swift3
exec_bench './compiled/swift3'

# go build -o ./compiled/go ./source/go.go
# exec_bench './compiled/go'

gcc -O2 -o ./compiled/c.exe ./source/c.c
exec_bench "./compiled/c.exe"
