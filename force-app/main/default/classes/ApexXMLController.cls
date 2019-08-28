global class ApexXMLController {
    private String xmlFileName;
    
    public ApexXMLController(String fileName) {
        
        this.xmlFileName = fileName;
    }

    public Dom.Document getModifedXML() {
        
        return XMLHelper.modifyXML(this.xmlFileName);
    }





    // /*
    // * Purpose : Apex class to return custom metadata type deployment results
    // *
    // * Developer: SFDC_Dev
    // *
    // */
    // public class CustomMetadataCallback implements Metadata.DeployCallback {
    //     // Method to track deploy results
    //     public void handleResult(Metadata.DeployResult result,
    //                             Metadata.DeployCallbackContext context) {
    //         if (result.status == Metadata.DeployStatus.Succeeded) {
    //             System.debug('success: '+ result);
    //         } else {
    //             System.debug('fail: '+ result);
    //         }
    //     }
    // }

    // public with sharing class UpdateCustomMetadata {



    //     // Method to send deploy call to update custom metadata type values
    //     public static void updateValues(String settingsForUpdate) {

    //         try {
    //             // Instantiate metadata deploycontainer class
    //             Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
    //             Metadata.CustomMetadata customMetadata = new Metadata.CustomMetadata();
    //             customMetadata.fullName = 'SlackNotificationSettings__mdt.SlackNotificationSettings';
    //             customMetadata.label = 'Slack Notification Settings';

    //             Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
    //             customField.field = 'SlackSettings__c';
    //             customField.value = settingsForUpdate;

    //             customMetadata.values.add(customField);
    //             mdContainer.addMetadata(customMetadata);

    //             CustomMetadataCallback callback = new CustomMetadataCallback();
    //             // Send deploy call
    //             Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);

    //         } catch (exception e) {

    //         }
    //     }
    // }




}
