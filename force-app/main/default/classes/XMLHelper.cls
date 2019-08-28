global class XMLHelper {
    
    public static Dom.Document modifyXML(String fileName) {
        Dom.Document XMLConfig = getFileFromStaticResource(fileName, new Dom.Document());

        addSomeThingToXML(XMLConfig);

        return XMLConfig;
    }
    
    public static Dom.Document getFileFromStaticResource(String fileName, Dom.Document XMLConfig) {

        try {

            StaticResource staticResourceConfig = [SELECT Body FROM StaticResource WHERE Name = :fileName LIMIT 1];
            String xmlStringContent = staticResourceConfig.Body.toString();

            System.debug(xmlStringContent);
            
		    XMLConfig.load(xmlStringContent);

        } catch(Exception e) {
            System.debug('Error XMLHelper.getFileFromStaticResource ' + e.getMessage() + ' Line: ' +e.getLineNumber());
        }

        return XMLConfig;
    }


    public static void addSomeThingToXML(Dom.Document XMLConfig) {

        for (Dom.XmlNode node : XMLConfig.getRootElement().getChildElements()) {

            node.addChildElement('newChild', null, null);
        } 

    }

}
