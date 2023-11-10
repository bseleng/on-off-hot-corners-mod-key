#!/bin/sh

echo What do you want to do?

select operation in "ENABLE hot corners mod key" "DISABLE hot corners mod key" Quit;
    do
        case "$operation" in
                "DISABLE hot corners mod key")
                    isDisable=true
                    break
                ;;
                "ENABLE hot corners mod key")
                    isDisable=false
                    break
                ;;
                Quit)
                    echo "Script will now end."
                    exit 0
                    break
                ;;
    esac
    done

if $isDisable
    then
        echo Mod key for hot corners is disabled
        defaults write com.apple.dock wvous-tl-modifier -int 0
        defaults write com.apple.dock wvous-tr-modifier -int 0
        defaults write com.apple.dock wvous-bl-modifier -int 0
        defaults write com.apple.dock wvous-br-modifier -int 0
        killall Dock
        exit 0

else
    select modKey in "Shift Key" "Control Key" "Option Key" "Command Key" Quit;
        do
        case "$modKey" in
                "Shift Key")
                    modKeyCode=131072
                    break
                ;;
                "Control Key")
                    modKeyCode=262144
                    break
                ;;
                "Option Key")
                    modKeyCode=524288
                    break
                ;;
                "Command Key")
                    modKeyCode=1048576
                    break
                ;;          
                Quit)
                    echo "Script will now end."
                    exit 0
                    break
                ;;
        esac
        done

        echo --- $modKey --- is set as mod key for hot corners
        
        defaults write com.apple.dock wvous-tl-modifier -int $modKeyCode
        defaults write com.apple.dock wvous-tr-modifier -int $modKeyCode
        defaults write com.apple.dock wvous-bl-modifier -int $modKeyCode
        defaults write com.apple.dock wvous-br-modifier -int $modKeyCode
fi

killall Dock
echo "Script will now end."
exit 0