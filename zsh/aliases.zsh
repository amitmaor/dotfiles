alias reload!='. ~/.zshrc'
alias zshrc='e ~/.zshrc'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias deploy-prerelease='git tag -f deploy-prerelease && git push origin deploy-prerelease'
alias deploy-patch='git tag -f deploy-patch && git push origin deploy-patch'
alias deploy-minor='git tag -f deploy-minor && git push origin deploy-minor'
alias dpr='deploy-prerelease'

alias publish-minor-gql='git tag -f publish-minor && git push origin publish-minor'
alias delete_tag="git push --delete origin $1"

function gl_pretty() {
 git log --pretty="format:%h - %s [%an]" HEAD...$1
}

function devkube-android {
    DKIP=${1}
    if [ -z "${2}" ]; then
        AVD="Pixel_XL_API_27" # AVD="Pixel_3_XL_API_29"
    else
        AVD=${2}
    fi
    echo "127.0.0.1 localhost" > ~/.uat_tmp
    echo "::1 ip6-localhost" >> ~/.uat_tmp
    echo "23.50.51.48 creditkarmacdn-a.akamaihd.net" >> ~/.uat_tmp
    emulator -avd ${AVD} -writable-system -no-snapshot &
    echo "${COLOR_GREEN}${AVD} is being configured, please wait.${COLOR_CLEAR}"
    while [ "`adb shell getprop sys.boot_completed | tr -d '\r' `" != "1" ] ; do sleep 1; done
    adb root
    adb remount
    adb -e push ~/.uat_tmp /system/etc/hosts
    adb reboot
    while [ "`adb shell getprop sys.boot_completed | tr -d '\r' `" != "1" ] ; do sleep 1; done
    echo "${COLOR_GREEN}${AVD} has been configured.${COLOR_CLEAR}"
}