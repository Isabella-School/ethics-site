echo "{"
for state in $(cat ./abbrevs.txt); do 
  json=$(cat $state.json)
  echo "\"$state\":$json,"
done
echo "}"
