Homework datawarehouse

Realizzato da Salvatore Barbera (leonidaxx90@hotmail.it)


- Ogni file .ktr presente sotto etl/ popola una dimensione o tabella dei fatti

- Ci sono dimensioni che essendo standard e invariate nel tempo (data)
  vanno generate attraverso l'esecuzione di uno script sql (in alternativa ad una trasformazione). 
  Dal momento che vanno eseguiti solo la prima volta, non è stata creata una trasformazione apposita

- I file presenti in olap/ rappresentano i tre fatti su cui si vogliono fare interrogazioni

- Il progetto è stato realizzato/testato usando postgresql 9.5 e Penthao 6.0.1


- Su alcuni file, ho eliminato l'intestazione manualmente (e non via etl).
  Quindi se in input vengono passati file che non rispettono certi requisiti, la trasformazione potrebbe fallire
