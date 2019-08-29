# Update XML Body in StaticResource

We have XML file in StaticResource with name - configForTest

```xml
  <?xml version="1.0" encoding="utf-8" ?>
  <config>
    <testRootNode>
      <testChildNode>Bla Bla</testChildNode>
    </testRootNode>
  </config>
```

We need to modify this XML file. We created simple code for it, let's go:

```java
  String fileName = 'configForTest';

  ApexXMLController s = new ApexXMLController(fileName);
  Dom.Document xml = s.getModifedXML();


  StaticResource xmlFile = [
    SELECT Id, Body, Name, BodyLength, ContentType, CacheControl
    FROM StaticResource 
    WHERE Name = :fileName LIMIT 1
  ];
  String newXmlString = xml.toXmlString();
  String result = EncodingUtil.Base64Encode( Blob.valueOf(newXmlString));

  xmlFile.Body = Blob.valueOf(newXmlString);

```

After We modified XML file. We need to use the [Apex-Mdapi Service](https://github.com/financialforcedev/apex-mdapi) library for Update StaticResource by Web Services:

```java

  try {

    MetadataService.MetadataPort service = MetadataServiceExamples.MetadataServiceExamplesException.createService();
    MetadataService.StaticResource staticResource = new MetadataService.StaticResource();
    staticResource.fullName = xmlFile.Name;
    staticResource.contentType = xmlFile.ContentType;
    staticResource.cacheControl = xmlFile.CacheControl;
    staticResource.content = EncodingUtil.base64Encode(xmlFile.Body);
    List<MetadataService.SaveResult> results = service.updateMetadata(new MetadataService.Metadata[] { staticResource });

    MetadataServiceExamples.MetadataServiceExamplesException.handleSaveResults(results[0]);
      
  } catch(Exception e) {
    System.debug('Handel Error ' + e.getMessage());
  }
```

Result - We can see the new child node called "newChild":

```xml
  <?xml version="1.0" encoding="utf-8" ?>
  <config>
    <testRootNode>
      <testChildNode>Bla Bla</testChildNode>
      <newChild/>
    </testRootNode>
  </config>
```

# Create, Update and Delete files in StaticResource

We can also create, update and delete files in StaticResource.


1. Create StaticResource:

Example:

```java
  MetadataService.MetadataPort service = MetadataServiceExamples.MetadataServiceExamplesException.createService();
  MetadataService.StaticResource staticResource = new MetadataService.StaticResource();
  staticResource.fullName = 'test1';
  staticResource.contentType = 'text';
  staticResource.cacheControl = 'public';
  staticResource.content = EncodingUtil.base64Encode(Blob.valueOf('Static stuff'));
  List<MetadataService.SaveResult> results = service.createMetadata(new MetadataService.Metadata[] { staticResource });
  MetadataServiceExamples.MetadataServiceExamplesException.handleSaveResults(results[0]);
```

2. Update StaticResource:

Example:

```java
  try {
    MetadataService.MetadataPort service = MetadataServiceExamples.MetadataServiceExamplesException.createService();
    MetadataService.StaticResource staticResource = new MetadataService.StaticResource();
    staticResource.fullName = 'test1';
    staticResource.contentType = 'text';
    staticResource.cacheControl = 'public';
    staticResource.content = EncodingUtil.base64Encode(Blob.valueOf('new string'));
    List<MetadataService.SaveResult> results = service.updateMetadata(new MetadataService.Metadata[] { staticResource });

    MetadataServiceExamples.MetadataServiceExamplesException.handleSaveResults(results[0]);

  } catch(Exception e) {
    System.debug('Handle Error ' + e.getMessage());
  }
```

3. Delete StaticResource:

Example:

```java
  MetadataService.MetadataPort service = MetadataServiceExamples.MetadataServiceExamplesException.createService();
  MetadataService.DeleteResult[] results = service.deleteMetadata('StaticResource', new String[]{'test1'});
  MetadataServiceExamples.MetadataServiceExamplesException.handleDeleteResults(results[0]);
```

