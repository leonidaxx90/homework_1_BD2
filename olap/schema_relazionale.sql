-- Table: ava.anno_accademico

-- DROP TABLE ava.anno_accademico;

CREATE TABLE ava.anno_accademico
(
  k_anno_accademico serial NOT NULL,
  nome_anno_x text,
  nome_anno_prec text,
  nome_anno_completo text,
  CONSTRAINT anno_accademico_pkey PRIMARY KEY (k_anno_accademico)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.anno_accademico
  OWNER TO postgres;





-- Table: ava.corso

-- DROP TABLE ava.corso;

CREATE TABLE ava.corso
(
  k_corso serial NOT NULL,
  nome_corso text,
  ssd text,
  codice_corso text,
  numero_crediti_corso integer,
  CONSTRAINT corso_pkey PRIMARY KEY (k_corso)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.corso
  OWNER TO postgres;





-- Table: ava.corso_di_studi

-- DROP TABLE ava.corso_di_studi;

CREATE TABLE ava.corso_di_studi
(
  k_corso_di_studi serial NOT NULL,
  tipo_cds text,
  codice_ateneo text,
  nome_dipartimento text,
  ha_numero_programmato boolean,
  durata_legale integer,
  numero_programmato integer,
  codice_dipartimento text,
  nome_cds text,
  codice_corso_di_studi text,
  data_inizio_validita integer,
  CONSTRAINT corso_di_studi_pkey PRIMARY KEY (k_corso_di_studi)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.corso_di_studi
  OWNER TO postgres;





-- Table: ava.data

-- DROP TABLE ava.data;

CREATE TABLE ava.data
(
  k_data serial NOT NULL,
  giorno integer,
  mese integer,
  anno integer,
  CONSTRAINT data_pkey PRIMARY KEY (k_data)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.data
  OWNER TO postgres;





-- Table: ava.esami

-- DROP TABLE ava.esami;

CREATE TABLE ava.esami
(
  k_corso_di_studi integer NOT NULL,
  k_studente integer NOT NULL,
  k_anno_accademico integer NOT NULL,
  k_corso integer NOT NULL,
  k_data integer NOT NULL,
  voto integer,
  cfu_acquisiti integer,
  CONSTRAINT esami_pkey PRIMARY KEY (k_corso_di_studi, k_studente, k_anno_accademico, k_corso, k_data),
  CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico)
      REFERENCES ava.anno_accademico (k_anno_accademico) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT esami_k_corso_fkey FOREIGN KEY (k_corso)
      REFERENCES ava.corso (k_corso) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT esami_k_data_fkey FOREIGN KEY (k_data)
      REFERENCES ava.data (k_data) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT esami_k_studente_fkey FOREIGN KEY (k_studente)
      REFERENCES ava.studente (k_studente) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.esami
  OWNER TO postgres;





-- Table: ava.ingressi

-- DROP TABLE ava.ingressi;

CREATE TABLE ava.ingressi
(
  k_studente integer NOT NULL,
  k_corso_di_studi integer NOT NULL,
  k_anno_accademico integer NOT NULL,
  k_tipo_immatricolazione integer NOT NULL,
  k_data integer NOT NULL DEFAULT ((0 - 0) - 0),
  punteggio_test integer,
  immatricolato boolean,
  k_data_nascita integer NOT NULL,
  CONSTRAINT ingressi_pkey PRIMARY KEY (k_studente, k_corso_di_studi, k_anno_accademico, k_tipo_immatricolazione, k_data, k_data_nascita),
  CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico)
      REFERENCES ava.anno_accademico (k_anno_accademico) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ingressi_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi)
      REFERENCES ava.corso_di_studi (k_corso_di_studi) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ingressi_k_data_fkey FOREIGN KEY (k_data)
      REFERENCES ava.data (k_data) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente)
      REFERENCES ava.studente (k_studente) MATCH SIMPLE
      ON UPDATE SET NULL ON DELETE SET NULL,
  CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione)
      REFERENCES ava.tipo_immatricolazione (k_tipo_immatricolazione) MATCH SIMPLE
      ON UPDATE SET NULL ON DELETE SET NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.ingressi
  OWNER TO postgres;





-- Table: ava.lauree

-- DROP TABLE ava.lauree;

CREATE TABLE ava.lauree
(
  k_data integer NOT NULL,
  k_anno_accademico integer NOT NULL,
  k_studente integer NOT NULL,
  k_corso_di_studi integer NOT NULL,
  voto text,
  CONSTRAINT lauree_pkey PRIMARY KEY (k_data, k_anno_accademico, k_studente, k_corso_di_studi),
  CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico)
      REFERENCES ava.anno_accademico (k_anno_accademico) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT lauree_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi)
      REFERENCES ava.corso_di_studi (k_corso_di_studi) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT lauree_k_data_fkey FOREIGN KEY (k_data)
      REFERENCES ava.data (k_data) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT lauree_k_studente_fkey FOREIGN KEY (k_studente)
      REFERENCES ava.studente (k_studente) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.lauree
  OWNER TO postgres;





-- Table: ava.studente

-- DROP TABLE ava.studente;

CREATE TABLE ava.studente
(
  k_studente serial NOT NULL,
  data_nascita date,
  voto_maturita text,
  cf text,
  coorte text,
  sesso text,
  cittadinanza text,
  stato_residenza text,
  comune_residenza text,
  titolo_diploma text,
  nazione_diploma text,
  regione_residenza text,
  provincia_residenza text,
  anno_diploma text,
  tipo_scuola_superiore text,
  istituto_scuola_superiore text,
  CONSTRAINT studente_pkey PRIMARY KEY (k_studente)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.studente
  OWNER TO postgres;


-- Table: ava.tipo_immatricolazione

-- DROP TABLE ava.tipo_immatricolazione;

CREATE TABLE ava.tipo_immatricolazione
(
  k_tipo_immatricolazione serial NOT NULL,
  tipo_immatricolazione text,
  cod_tipo_immatricolazione text,
  CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (k_tipo_immatricolazione)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ava.tipo_immatricolazione
  OWNER TO postgres;
