function dec
	set v 1
	if [ (count $argv) -gt 1 ]
		set v $argv[2]
	end

	set cmd "set $argv[1] (math \"\$$argv[1]-$v\")"
	eval $cmd
end

