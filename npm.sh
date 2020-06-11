# Return codes include:
# 0 - version mismatch
# 1 - version match
# 2 - invalid configuration
function unpublished_npm_version() {
    if [ ! -f package.json ]
    then
        return 2
    fi

    pkg_name="$(cat package.json | jq .name -r)"
    pkg_version="$(cat package.json | jq .version -r)"
    published_version="$(npm view $pkg_name@$pkg_version --json | jq .version -r)"
    if [ "$published_version" == "null" ]
    then
        return 0
    else
        return 1
    fi
}