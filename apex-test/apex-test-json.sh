# Get list of org aliases from sfdx
for org in `sfdx force:org:list --json | jq -r '.result.nonScratchOrgs[] | select(.connectedStatus | contains("Connected"))' | jq -r 'select(.username | contains("citi.com")' | jq -r ".alias"` 

do
	echo running apex tests in org $org
	jsontestoutput=$org-apex-report-`date '+%Y-%m-%d'`.json
	errorreport=$org-apex-test-error-report-`date '+%Y-%m-%d'`.txt

	#run local tests for the org and save results as json
	sfdx force:apex:test:run --resultformat json --targetusername $org --testlevel RunLocalTests  --wait 40 | jq "." > $jsontestoutput

	testresult=`cat $jsontestoutput | jq -r '.result.summary.outcome'`
	echo "$org test result: $testresult" 

	#get list of failing class IDs

	classlist="("

	for class in `cat $jsontestoutput |jq '.result.tests[] |select(.Outcome | contains("Fail"))' |jq -r '.ApexClass.Id'`
	do 
		classlist=$classlist"'"$class"',"
	done

	#If there are class errors for this org (length of classllist string is greater than length of starter "(" 
	if [ ${#classlist} -gt 1 ]
	
	then
	
		#print status and list errors to report file
		echo Apex test for $org status: $testresult with `cat $jsontestoutput | jq -r '.result.summary.failing'` errors >  $errorreport
		echo " " >> $errorreport
		cat $jsontestoutput | jq -r '.result.tests[] | select(.Outcome != "Pass") | .Outcome + " " + .FullName  + " " + .Message + "\n"' >> $errorreport

	
		#fix up the classlist to match SOQL query in clause format
		classlist=${classlist:0:${#classlist}-2}
		classlist=$classlist"')"
		
		#get the developer and class name for failed classes

		
		#print the developer name for the failing classes
		echo " " >> $errorreport
		echo "Apex class causing failures last modified by name, class name, and last modified by date" >> $errorreport

		sfdx force:data:soql:query --json -u $org -q "select Name, LastModifiedDate, IsValid, LastModifiedBy.Name from ApexClass where Id in $classlist order by LastModifiedBy.Name, LastModifiedDate" | jq -r '.result.records[] | (.LastModifiedBy.Name) + " " + (.Name) + " " + (.LastModifiedDate)'   >> $errorreport


	fi


done

