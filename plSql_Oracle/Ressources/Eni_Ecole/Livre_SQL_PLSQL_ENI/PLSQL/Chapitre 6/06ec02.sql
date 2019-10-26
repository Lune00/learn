rem Cette proc�dure permet d'afficher les diff�rents �l�ments du document XML
create or replace procedure afficherElements(doc xmlDom.DOMDocument) is
  lesNoeuds xmlDom.DOMNodeList;
  longueur number;
  noeud    xmlDom.DOMNode;
begin
  -- obtenir tous les �l�ments du document
  lesNoeuds:=xmlDom.getElementsByTagName(doc,'*');
  longueur:=xmlDom.getLength(lesNoeuds);

  -- parcourir tous les �l�ments � l'aide d'une boucle
  for i in 0 ..longueur-1 loop
    noeud:=xmlDom.item(lesNoeuds, i);
    dbms_output.put(xmlDom.getNodeName(noeud)||' ');
  end loop;
  -- passer � la ligne suivante
  dbms_output.put_line(' ');
end;
/
show errors;


create or replace procedure afficherAttributs(doc xmlDom.DOMDocument) is
  lesNoeuds    xmlDom.DOMNodeList;
  lg1          number;
  lg2          number;
  noeud        xmlDom.DOMNode;
  element      xmlDom.DOMElement;
  lesAttributs xmlDom.DOMNamedNodeMap;
  nomAttr      varchar2(100);
  valeurAttr   varchar2(100);
begin
  -- obtenir tous les �l�ments
  lesNoeuds:=xmlDom.getElementsByTagName(doc,'*');
  lg1:=xmlDom.getLength(lesNoeuds);

  -- parcourir tous les �l�ments
  for i in 0..lg1-1 loop
    noeud:=xmldom.item(lesNoeuds, i);
    element:=xmldom.makeElement(noeud);
    -- nom de la balise
    dbms_output.put_line(xmldom.getTagName(element)||':');
    
    -- obtenir tous les attributs de cet �l�ment
    lesAttributs:=xmldom.getAttributes(noeud);

    if (xmldom.isNull(lesAttributs)= FALSE) then
      lg2:=xmldom.getLength(lesAttributs);

      -- parcourir tous les attributs
      for j in 0..lg2-1 loop
        noeud:=xmldom.item(lesAttributs,j);
        nomAttr    := xmldom.getNodeName(noeud);
        valeurAttr := xmldom.getNodeValue(noeud);
        dbms_output.put(' '||nomAttr||'='||valeurAttr);
      end loop;
      dbms_output.put_line(' ');
    end if;
  end loop;
end;
/
show errors;




create or replace procedure lirexml(repertoire     in varchar2,
                          fichier        in varchar2, 
                          fichier_erreur in varchar2) is
  p xmlparser.parser;
  doc xmldom.DOMDocument;
begin
  -- nouveau parser
  p:=xmlparser.NewParser;

  -- fixer queleques caract�ristiques du parser
  xmlParser.SetValidationMode(p,FALSE);
  xmlParser.SetErrorLog(p, repertoire||'\'||fichier_erreur);
  xmlParser.setBaseDir(p, repertoire);

  --analyser le fichier XML
  xmlParser.Parse(p,repertoire||'\'||fichier);

  -- obtenir le document
  doc:=xmlParser.GetDocument(p);
  
  -- afficher les diff�rents �l�ments
  dbms_output.put_line('Les �l�ments du documents sont :');
  afficherElements(doc);

  -- afficher les attributs de chaque �l�ment
  dbms_output.put_line('Les attributs des �l�ments sont:');
  afficherAttributs(doc);

  -- lib�rer le document
  xmlDom.freeDocument(doc);
  -- lib�rer le parser
  xmlParser.freeParser(p);
end;
/
show errors;
