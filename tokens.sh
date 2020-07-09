echo "* Retrieving IBM tokens..."
API_RESPONSE=$(curl -sfX POST -u “bx:bx” --header “Content-Type: application/x-www-form-urlencoded” \
--header “Accept: application/json” --data-urlencode “grant_type=urn:ibm:params:oauth:grant-type:apikey” \
--data-urlencode “apikey=” “https://iam.cloud.ibm.com/identity/token”)

API_RESPONSE=$(curl -k -X POST   --header "Content-Type: application/x-www-form-urlencoded"   --header "Accept: application/json"   --data-urlencode "grant_type=urn:ibm:params:oauth:grant-type:apikey"   --data-urlencode "apikey=1_5sF9fm3Wlf7kqsR8fLKcj9cmNcihOF1oF8Z16wpVLl"   "https://iam.cloud.ibm.com/identity/token")

echo $API_RESPONSE
IBM_TOKEN=$(echo "$API_RESPONSE" | jq -r '.access_token')
IBM_REFRESH=$(echo "$API_RESPONSE" | jq -r '.refresh_token')
# Apply Schematics workspace
echo "* Applying workspace..."
ACTIVITY_ID=$(curl -sfX PUT https://us-east.schematics.cloud.ibm.com/v1/workspaces/test2496PrivSouth-f08f62ba-6328-4d/apply \
-H "Authorization: Bearer $IBM_TOKEN" -H "refresh_token: $IBM_REFRESH" | jq -r '.activityid')
