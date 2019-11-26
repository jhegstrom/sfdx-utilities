for org in `sfdx force:org:list --json | jq -r '.result.nonScratchOrgs[] | select(.connectedStatus | contains("Connected")) '| jq -r ".alias"`
do
    # echo Listing users and profiles in org $org    
    sfdx force:data:soql:query --json -u $org -q "select Name, Profile.Name from User where IsActive = true order by Profile.Name" | jq --arg orgname $org -r '.result.records[] | $orgname + ", " + (.Profile.Name) + ", " + (.Name) '
done
