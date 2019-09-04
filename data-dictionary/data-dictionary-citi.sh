orgalias=olympusuat
echo "Category,Object,Field,Label,Help,Type,Relathioship,Length,Scale,Precision,IsCustom,IsCalculated,IsEncrypted"

#core objects    
for sobject in Account AccountContactRelation Billing_Statement_Image__c CardsToCases__c Case Contact CRS_Account_Notification__c CRS_Adjustment__c CRS_Alert__c CRS_Favorite__c CRS_FDR_Note__c CRS_Interaction__c CRS_Interaction_Case__c CRS_IVR_Directory__c CRS_PartnerCode__c CRS_Promo_Balance__c CRS_Quick_Dial__c CRS_Read_Status__c CRS_Recent_Financial_Accounts__c CRS_Store_Info__c CRS_TransactionsToCases__c CRS_Verbatim__c CRS_Verification__c CRS_Verification_Details__c FinServ__AccountAccountRelation__c FinServ__Alert__c FinServ__BillingStatement__c FinServ__Card__c FinServ__FinancialAccount__c FinServ__FinancialAccountRole__c FinServ__FinancialAccountTransaction__c Knowledge__kav Task User 
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Object,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)  + \",\" + (.encrypted|tostring)   "
done

#utility objects   
for sobject in ACN_Interface_Details__c ACN_Interface_Header__c Authentication_Headers__c CRS_Access_Token__c CRS_AdjustmentFlowMap__c CRS_AgentActivityLog__c CRS_Call_Recording_Settings__c CRS_CTI_Extension__c CRS_CTI_Logout_Code__c CRS_Directory__c CRS_FDR_Note__c CRS_Integration_Headers__c CRS_Interface_Auth_Headers__c CRS_ISOPrefix__c CRS_IVR_Directory__c CRS_IVR_Verification__c CRS_Logoff_Event__c CRS_PartnerCode__c CRS_SPA__c CRS_StaticValues__c CRS_Store_Info__c Identity_Propagation__c Trigger_Executions__c   
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Utility,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)  + \",\" + (.encrypted|tostring)  "
done

#metadata
for sobject in  CRS_Account_Notification_Code_Map__mdt CRS_AdjustmentFlowMapping__mdt CRS_CountryCodeMapping__mdt CRS_SSO_SAML_Mapping__mdt CRS_Transfer_Detail__mdt  
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Metadata,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)  + \",\" + (.encrypted|tostring)   "
done

#settings skip BatchRecordFilter__c LogSeverityLevelValue__c PaginationRecords__c
for sobject in  AgentLogOutCodeListSetting__c  CRS_Call_Recording_Settings__c CRS_Knowledge_Publish__c CRS_MockService__c CRS_SSOProfileSetting__c CRS_System_Settings__c CRS_Trigger_Settings__c CRS_Unique_UUID_Setting__c   PartnerTypeListSetting__c SamplePrefLists__c SSOUserPermissionSet__c Trigger_Executions__c 
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Setting,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)  + \",\" + (.encrypted|tostring)  "
done


#platform events
for sobject in  CRS_AsstChannel_CaseCreate__e CRS_FDR_Event__e Case_Event__e CRS_Customer_search_Data_Collection__e
do
    sfdx force:schema:sobject:describe --json -u $orgalias -s $sobject | jq  -r  ".result.fields[] |  \"Platform Event,\"  +  \"$sobject\" + \",\" + .name + \",\" + .label  + \",\" + .inLineHelpText + \",\" + .type + \",\" + .relationshipName+ \",\" + (.length|tostring) + \",\" + (.scale|tostring) + \",\" + (.precision|tostring)+ \",\" + (.custom|tostring) + \",\" + (.calculated|tostring)   + \",\" + (.encrypted|tostring) "
done