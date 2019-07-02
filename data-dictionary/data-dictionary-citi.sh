orgalias=olympusuat
echo "Category,Object,Field,Label,Help,Type,Relathioship,Length,Scale,Precision,IsCustom,IsCalculated"

for sobject in Account AccountContactRelation CardsToCases__c Case Contact CRS_Alert__c CRS_Directory__c CRS_Favorite__c CRS_Interaction__c CRS_Interaction_Case__c CRS_PartnerCode__c CRS_Promo_Balance__c CRS_Quick_Dial__c CRS_Recent_Financial_Accounts__c CRS_Store_Info__c CRS_TransactionsToCases__c CRS_Verification_Details__c FinServ__Alert__c FinServ__BillingStatement__c Finserv__Card__c FinServ__FinancialAccount__c FinServ__FinancialAccountRole__c FinServ__FinancialAccountTransaction__c Knowledge__kav User
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Object,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)   "
done

for sobject in ACN_Interface_Header__c CRS_Access_Token__c CRS_CTI_Extension__c CRS_CTI_Logout_Code__c CRS_FDR_Note__c CRS_Integration_Headers__c CRS_Interface_Auth_Headers__c CRS_SPA__c CRS_StaticValues__c 
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Utility,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)   "
done

for sobject in CRS_CountryCodeMapping__mdt CRS_SSO_SAML_Mapping__mdt

do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Metadata,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)   "
done

for sobject in CRS_Call_Recording_Settings__c CRS_SSOProfileSetting__c CRS_System_Settings__c CRS_Trigger_Settings__c SSOUserPermissionSet__c Trigger_Executions__c
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Setting,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)   "
done