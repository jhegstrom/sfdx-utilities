for org in `sfdx force:org:list --json | jq -r '.result.nonScratchOrgs[] | select(.connectedStatus | contains("Connected"))' | jq -r ".alias"` 

do
	echo running apex tests in org $org



    sfdx force:data:soql:query --json -u $org -q "select Name, Profile.Name from User where IsActive = true order by Profile.Name" | jq -r '.result.records[] |"$org " + (.Name) + " " +(.Profile.Name) ' 
done
