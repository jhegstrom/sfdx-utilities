orgalias=phxprod
echo "Category,Object,Field,Label,Help,Type,Relathioship,Length,Scale,Precision,IsCustom,IsCalculated"
for sobject in `cat ~/objects-list`
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Object,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)   "
done