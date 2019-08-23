global class ApexXMLController {
    private Dom.XmlNode rootElement;
    
    public ApexXMLController(String fileName) {
        
        this.rootElement = XMLHelper.getFileFromStaticResource(fileName);
        
    }

    public void addSomeThingToXML() {

        if (this.rootElement != null) {

            for (Dom.XmlNode node : this.rootElement.getChildElements()) {
                
                System.debug('Size without added = ' + node.getChildElements().size());

                node.addChildElement('newChild', null, null);

                for (Dom.XmlNode childNode : node.getChildElements()) {
                    System.debug(childNode.getName());
                }

                System.debug('Size AFTER added = ' + node.getChildElements().size());
            } 

        }

    }

    public Dom.XmlNode getXMLRootElement() {

        return this.rootElement;
    }


}
