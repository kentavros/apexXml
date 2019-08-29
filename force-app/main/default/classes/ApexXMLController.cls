global class ApexXMLController {
    private String xmlFileName;
    
    public ApexXMLController(String fileName) {
        
        this.xmlFileName = fileName;
    }

    public Dom.Document getModifedXML() {
        
        return XMLHelper.modifyXML(this.xmlFileName);
    }




}
