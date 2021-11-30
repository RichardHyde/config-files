function slackme
	set payload "{ \\\"username\\\": \\\"$hostname\\\", \\\"text\\\": \\\"$argv[1]\\\" }"
	set cmd "curl -X POST https://hooks.slack.com/services/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 -d \"$payload\" -H \"Content-Type: application/json\""
	eval $cmd
end
