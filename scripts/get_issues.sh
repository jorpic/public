AUTH_TOKEN=
API_URL=https://api.github.com/repos/f-me/carma/issues

function get_page {
  curl \
    "${API_URL}?state=open&per_page=100&page=${1}&access_token=${AUTH_TOKEN}" \
    > issues_page${1}.json
}

get_page 1
get_page 2
get_page 3

jq -s \
  '[.[] | .[] |
    {title
    ,number
    ,createe:.user.login
    ,assignee:.user.login
    ,created_at
    ,state
    ,milestone:.milestone.title
    ,labels:[.labels[] | .name] | tostring
    }
  ]' \
  issues_page*.json > issues.json

jq '.[] | [.[]] | @csv' issues.json > issues.csv
