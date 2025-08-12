CREATE OR REPLACE TYPE TP_TELEFONES AS VARRAY(5) OF VARCHAR2(15);

CREATE OR REPLACE TYPE TP_ESPECIALIDADE AS OBJECT (
	nome VARCHAR2(100)
);
CREATE OR REPLACE TYPE TP_LISTA_ESPECIALIDADES AS TABLE OF TP_ESPECIALIDADE;

CREATE OR REPLACE TYPE TP_ENDERECO AS OBJECT (
	cep			    VARCHAR2(8),
	complemento	VARCHAR2(200),
	numero		  VARCHAR2(10)
);

CREATE OR REPLACE TYPE TP_FUNCIONARIO AS OBJECT (
	cpf_funcionario	CHAR(11),
	nome			      VARCHAR2(100),
	data_nascimento	DATE,
	sexo			      VARCHAR2(6),
	turno			      VARCHAR(6),
	email			      VARCHAR2(100),
	endereco		    TP_ENDERECO,
	telefones		    TP_TELEFONES,
  MEMBER FUNCTION get_identificador_formatado RETURN VARCHAR2
) NOT INSTANTIABLE NOT FINAL;

CREATE OR REPLACE TYPE TP_ATENDENTE UNDER TP_FUNCIONARIO (
) FINAL;

CREATE TABLE TB_ATENDENTE OF TP_ATENDENTE (
  CONSTRAINT tb_atendente_pk PRIMARY KEY (cpf_funcionario),
  CONSTRAINT tb_atendente_email_uk UNIQUE (email)
);

CREATE OR REPLACE TYPE TP_ENFERMEIRO UNDER TP_FUNCIONARIO (
	registro_coren	VARCHAR2(20),
  especialidades	TP_LISTA_ESPECIALIDADES
);

CREATE TABLE TB_ENFERMEIRO OF TP_ENFERMEIRO NESTED TABLE especialidades STORE AS TB_ESPECIALIDADES (
  CONSTRAINT tb_enfermeiro_pk PRIMARY KEY (cpf_funcionario),
  CONSTRAINT tb_enfermeiro_coren_uk UNIQUE (registro_coren)
);

CREATE OR REPLACE TYPE TP_MEDICO UNDER TP_FUNCIONARIO (
	crm_medico 	    VARCHAR(20),
	especialidades	TP_LISTA_ESPECIALIDADES
  FINAL MEMBER FUNCTION get_crm_formatado RETURN VARCHAR2
);

CREATE TABLE TB_MEDICO OF TP_MEDICO NESTED TABLE especialidades STORE AS TB_ESPECIALIDADES (
  CONSTRAINT tb_medico_pk PRIMARY KEY (cpf_funcionario)
  CONSTRAINT tb_medico_crm_uk UNIQUE (crm_medico)
);

CREATE OR REPLACE TYPE TP_PACIENTE AS OBJECT (
	cpf_paciente	  CHAR(11),
	nome			      VARCHAR2(100),
	email			      VARCHAR2(100),
	data_nascimento	DATE,
  sexo			      VARCHAR(1),
	endereco		    TP_ENDERECO,
	telefones		    TP_TELEFONES,

  CONSTRUCTOR FUNCTION TP_PACIENTE(p_cpf_paciente CHAR, p_nome VARCHAR2, p_email VARCHAR2, p_data_nascimento DATE, p_sexo VARCHAR2, p_endereco TP_ENDERECO, p_telefones TP_TELEFONES) RETURN SELF AS RESULT
);

CREATE TABLE TB_PACIENTE OF TP_PACIENTE (
  CONSTRAINT tb_paciente_pk PRIMARY KEY (cpf_paciente),
	CONSTRAINT tb_paciente_sexo_ck CHECK (sexo IN ('Homem', 'Mulher')),
  CONSTRAINT tb_paciente_email_uk UNIQUE (email)
);

CREATE OR REPLACE TYPE TP_CONVENIO AS OBJECT (
	id_convenio	  INT,
	nome			    VARCHAR2(100),
	operadora		  VARCHAR2(100),
	status		    VARCHAR2(7),
	email			    VARCHAR2(100),
	registro_ans	VARCHAR2(20),
	cnpj			    VARCHAR2(14),
	endereco		  TP_ENDERECO,
	telefones		  TP_TELEFONES
);

CREATE TABLE TB_CONVENIO OF TP_CONVENIO (
  CONSTRAINT tb_convenio_pk PRIMARY KEY (id_convenio),
  CONSTRAINT tb_convenio_status_ck CHECK (status IN ('Ativo', 'Inativo')),
  CONSTRAINT tb_convenio_email_uk UNIQUE (email),
  CONSTRAINT tb_convenio_cnpj_uk UNIQUE (cnpj)
);

CREATE OR REPLACE TYPE TP_PACIENTE_CONVENIO AS OBJECT (
	paciente_ref		    REF TP_PACIENTE,
	convenio_ref		    REF TP_CONVENIO,
	data_hora_ingresso	TIMESTAMP
);

CREATE TABLE TB_PACIENTE_CONVENIO OF TP_PACIENTE_CONVENIO (
  CONSTRAINT tb_paciente_convenio_pk PRIMARY KEY (cpf_paciente, id_convenio),
  SCOPE FOR (paciente_ref) IS TB_PACIENTE WITH ROWID,
  SCOPE FOR (convenio_ref) IS TB_CONVENIO WITH ROWID
);

CREATE OR REPLACE TYPE TP_AGENDAMENTO AS OBJECT (
  id_agendamento     INT,
  status             VARCHAR2(20),
  data_hora          TIMESTAMP,
  tipo               VARCHAR2(30),
  pac_conv_ref	     REF TP_PACIENTE_CONVENIO
  MEMBER PROCEDURE alterar_data_hora(p_nova_data_hora TIMESTAMP),
  MAP MEMBER FUNCTION map_to_date RETURN DATE
);

CREATE TABLE TB_AGENDAMENTO OF TP_AGENDAMENTO (
  CONSTRAINT tb_agendamento_pk PRIMARY KEY (id_agendamento),
  CONSTRAINT tb_agendamento_status_ck CHECK (status IN ('Pendente', 'Confirmado', 'Cancelado')),
  SCOPE FOR (pac_conv_ref) IS TB_PACIENTE_CONVENIO
);

CREATE OR REPLACE TYPE TP_SALA_EXAME AS OBJECT (
	numero_sala	VARCHAR(3),
	tipo			  VARCHAR(50),
	status	  	VARCHAR(200),
	MEMBER FUNCTION alterar_status(p_novo_status VARCHAR2)
);

CREATE TABLE TB_SALA_EXAME OF TP_SALA_EXAME (
  CONSTRAINT tb_sala_exame_pk PRIMARY KEY (numero_sala),
  CONSTRAINT tb_sala_exame_status_ck CHECK (status IN ('Disponível', 'Indisponível', 'Em Manutenção'))
);

CREATE OR REPLACE TYPE TP_EXAME AS OBJECT (
	id_exame				        INT,
	tipo					          VARCHAR(20),
	solicitante_ref			    REF TP_MEDICO,
	resultado_conteudo		  VARCHAR(200),
	resultado_data_emissao	TIMESTAMP
);

CREATE TABLE TB_EXAME OF TP_EXAME (
  CONSTRAINT tb_exame_pk PRIMARY KEY (id_exame),
  SCOPE FOR (solicitante_ref) IS TB_MEDICO
);

CREATE OR REPLACE TYPE TP_DIAGNOSTICO AS OBJECT (
	id_diagnostico		INT,
	conteudo			    VARCHAR(1000),
	tipo				      VARCHAR(100),
	data_hora_emissao	TIMESTAMP,
	exame_ref			    REF TP_EXAME
);

CREATE TABLE TB_DIAGNOSTICO OF TP_DIAGNOSTICO (
  CONSTRAINT tb_diagnostico_pk PRIMARY KEY (id_diagnostico),
  SCOPE FOR (exame_ref) IS TB_EXAME
);

CREATE OR REPLACE TYPE TP_RESULTADO AS OBJECT (
	id_exame				    INT,
	conteudo					  VARCHAR(1000),
	data_hora_emissao	  TIMESTAMP
);

CREATE TABLE TB_RESULTADO OF TP_RESULTADO (
  CONSTRAINT tb_resultado_pk PRIMARY KEY (id_exame),
  SCOPE FOR (exame_ref) IS TB_EXAME
);

CREATE OR REPLACE TYPE TP_AUXILIA AS OBJECT (
	auxiliador_ref		    REF TP_FUNCIONARIO,
	auxiliado_ref		      REF TP_FUNCIONARIO
);

CREATE TABLE TB_AUXILIA OF TP_AUXILIA (
  CONSTRAINT tb_auxilia_pk PRIMARY KEY (auxiliador_ref, auxiliado_ref),
  SCOPE FOR (auxiliador_ref, auxiliado_ref) IS TB_FUNCIONARIO
);

CREATE OR REPLACE TYPE TP_REALIZA AS OBJECT (
	id_exame				      INT,
	enfermeiro_ref		    REF TP_ENFERMEIRO,
	paciente_ref		      REF TP_PACIENTE,
	convenio_ref		      REF TP_CONVENIO,
	data_hora_inicio			TIMESTAMP,
	data_hora_fim					TIMESTAMP
);

CREATE TABLE TB_REALIZA OF TP_REALIZA (
  CONSTRAINT tb_realiza_pk PRIMARY KEY (id_exame),
  SCOPE FOR (enfermeiro_ref, paciente_ref, convenio_ref) IS TB_ENFERMEIRO, TB_PACIENTE, TB_CONVENIO
);

CREATE OR REPLACE TYPE TP_DESIGNA AS OBJECT (
	exame_ref				      REF TP_EXAME,
	atendente_ref		      REF TP_ATENDENTE,
	sala_ref			        REF TP_SALA_EXAME
);

CREATE TABLE TB_DESIGNA OF TP_DESIGNA (
  CONSTRAINT tb_designa_pk PRIMARY KEY (exame_ref),
  SCOPE FOR (atendente_ref, sala_ref, exame_ref) IS TB_ATENDENTE, TB_SALA_EXAME, TB_EXAME
);

CREATE OR REPLACE TYPE TP_ANALISE AS OBJECT (
	medico_ref		      		REF TP_MEDICO,
	id_exame				        INT,
	id_diagnostico		      INT,
	conteudo					      VARCHAR(1000)
);

CREATE TABLE TB_ANALISE OF TP_ANALISE (
  CONSTRAINT tb_analise_pk PRIMARY KEY (medico_ref, id_exame),
  SCOPE FOR (medico_ref, id_diagnostico) IS TB_MEDICO, TB_DIAGNOSTICO
);

CREATE OR REPLACE TYPE BODY TP_AGENDAMENTO AS
  MAP MEMBER FUNCTION map_to_date RETURN DATE IS
    BEGIN
      RETURN data_hora;
    END map_to_date;

  MEMBER PROCEDURE alterar_data_hora(p_nova_data_hora TIMESTAMP) IS
    BEGIN
      data_hora := p_nova_data_hora;
    END alterar_data_hora;
END;

CREATE OR REPLACE TYPE BODY TP_FUNCIONARIO AS
  MEMBER FUNCTION get_identificador_formatado RETURN VARCHAR2 IS
    BEGIN
      RETURN cpf_funcionario;
    END get_identificador_formatado;
END;

CREATE OR REPLACE TYPE BODY TP_MEDICO AS
  OVERRIDING MEMBER FUNCTION get_identificador_formatado RETURN VARCHAR2 IS
    BEGIN
      RETURN crm_medico;
    END get_identificador_formatado;
END;

ALTER TYPE TP_AGENDAMENTO ADD MAP MEMBER FUNCTION map_to_date RETURN DATE;
