function compare_branch() {
    target_branch="$(git rev-parse $target_branch)";
    current_branch="$(git rev-parse HEAD)"
    if [ "$target_branch" == "$current_branch" ]
    then
        return 0
    else
        return 1
    fi
}
