function fish_prompt
        set -l newLine 0
        set -l foo i j k m
        set -l uid (id -u $USER)

        if [ -z "$lastChecked" ]
                set -g lastChecked 0
        end

        if [ (math (date +%s)-$lastChecked) -ge 900 ]
                if [ (curl -s -o /dev/null -w '%{http_code}' -I https://cex.io/api/last_price/BTC/GBP) -eq 200 ]
                        set -g BTCGBPRate (curl -s https://cex.io/api/last_price/BTC/GBP | awk 'BEGIN { FS = "\":\"|\",\"" } { print $2 }')
#                        set -g ETHEURRate (curl -s https://cex.io/api/last_price/ETH/EUR | awk 'BEGIN { FS = "\":\"|\",\"" } { print $2 }')
                end

                set_color -o magenta
                set -l headlines (mrh)
                set -l hl
                for hl in $headlines
                        if [ "$hl" = "$lastHeadline" ]
                                break
                        end
                        echo "$hl" | recode html..utf-8
                end
                set_color normal

                set -g lastChecked (date +%s)
                set -g lastHeadline $headlines[1]
        end

        if [ -n "$BTCGBPRate" ]
                set_color yellow
                echo -n "[BTC:£$BTCGBPRate]"
                set newLine 1
        end

        set_color cyan

#        if [ -d .git ]
#                set -l git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
#                echo -n "[$git_branch"
#
#                set -l git_dirty_count (git status --porcelain | wc -l | sed "s/ //g")
#                if [ $git_dirty_count -gt 0 ]
#                        echo -n ":$git_dirty_count"
#                end
#
#                echo -n "] "
#                set newLine 1
#        end

        set -g __fish_git_prompt_showdirtystate 1
        set -g __fish_git_prompt_showupstream auto
        echo -n (fish_git_prompt)

        for c in (seq (count $foo))
                if [ -n "$$foo[$c]" ]
                        echo -n "$foo[$c]:$$foo[$c] "
                        set newLine 1
                end
        end

        if [ $newLine -eq 1 ]
                echo
        end

        set_color normal
        echo -n (prompt_pwd)

        if [ $uid -eq 0 ]
                echo " ~ "
        else
                echo " > "
        end
end
