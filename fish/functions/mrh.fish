function mrh
	curl -s "http://feeds.macrumors.com/MacRumors-All" | grep -o '<title>[^"]*</title>' | sed -E "1d;s/<title>(.*)<\/title>/\1/"
end
