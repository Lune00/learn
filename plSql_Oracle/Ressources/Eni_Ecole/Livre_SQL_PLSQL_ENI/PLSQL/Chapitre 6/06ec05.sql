
set serveroutput on;
create or replace procedure appliqueXSL(
  repertoire    varchar2, fichierXml      varchar2,
  fichierXsl    varchar2, fichierResultat varchar2,
  fichierErreur varchar2) is
  -- les variables
  p           xmlParser.Parser;	-- l'analyseur
  documentXML xmlDom.DOMDocument;  -- document
  noeud       xmlDom.DOMNode;
  ---- les éléments pour la feuille de style
  moteur       xslProcessor.Processor;
  feuilleStyle xslProcessor.Stylesheet;
  documentXSL  xmlDom.DOMDocument;
  elementXsl   xmlDom.DOMElement;
  espaceNom    varchar2(50);
  -- les éléments pour produire le résultat
  documentF    xmlDom.DOMDocumentFragment;
  elementF     xmlDom.DomNode;
    
begin
  -- création d'un nouveau parser
  p:=xmlParser.newParser;

  -- fixer quelques caractéristiques de fonctionnement
  xmlParser.setValidationMode(p,FALSE);     -- pas de validation du document
  xmlParser.setErrorLog(p,repertoire||'\'||fichierErreur);  -- fichier des erreurs
  xmlParser.setPreserveWhiteSpace(p, TRUE); -- conserver les espaces
  xmlParser.setBaseDir(p, repertoire);      -- repertoire de travail

  -- analyser le document XML
  xmlParser.parse(p,repertoire || '\' || fichierXml);

  -- obtenir le document
  documentXml:=xmlParser.getDocument(p);

  -- analyser le document XML
  xmlParser.parse(p,repertoire||'\'||fichierXsl);

  -- obtenir le document
  documentXsl:=xmlParser.getDocument(p);

  -- obtenir les noeuds de la feuille de style
  elementXsl:= xmlDom.getDocumentElement(documentXsl);
  -- obtenir l'espace de nom
  espaceNom:=xmlDom.getNamespace(elementXsl);

  -- fabriquer la feuille de style
  feuilleStyle:=xslProcessor.newStylesheet(documentXsl,repertoire||'\'||fichierXsl);
  -- appliquer la feuille de style
  moteur :=xslProcessor.newProcessor;
  xslProcessor.showWarnings(moteur, true);
  xslProcessor.setErrorLog(moteur,repertoire||'\'||fichierErreur);

  -- production du document final
  documentF:=xslProcessor.processXSL(moteur, feuilleStyle, documentXML);
  elementF:=xmlDom.makeNode(documentF);
  xmlDom.writeTofile(elementF,repertoire||'\'||fichierResultat);
end;
/
show errors
