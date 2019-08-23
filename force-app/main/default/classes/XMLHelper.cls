global class XMLHelper {
    
    
    
    public static Dom.XmlNode getFileFromStaticResource(String fileName) {
        Dom.XmlNode rootElement;

        try {

            StaticResource staticResourceConfig = [SELECT Body FROM StaticResource WHERE Name = :fileName LIMIT 1];
            String xmlStringContent = staticResourceConfig.Body.toString();

            System.debug(staticResourceConfig);
            System.debug(xmlStringContent);

            Dom.Document XMLConfig = new Dom.Document();
		    XMLConfig.load(xmlStringContent);

            rootElement = XMLConfig.getRootElement();


        } catch(Exception e) {
            System.debug('Error XMLHelper.getFileFromStaticResource ' + e.getMessage() + ' Line: ' +e.getLineNumber());
        }

        return rootElement;
    }
}
