DROP TABLE designa CASCADE CONSTRAINTS;
DROP TABLE realiza CASCADE CONSTRAINTS;
DROP TABLE auxilia CASCADE CONSTRAINTS;
DROP TABLE analise CASCADE CONSTRAINTS;
DROP TABLE agendamento CASCADE CONSTRAINTS;
DROP TABLE sala_exame CASCADE CONSTRAINTS;
DROP TABLE diagnostico CASCADE CONSTRAINTS;
DROP TABLE resultado CASCADE CONSTRAINTS;
DROP TABLE exame CASCADE CONSTRAINTS;
DROP TABLE especialidade_medico CASCADE CONSTRAINTS;
DROP TABLE medico CASCADE CONSTRAINTS;
DROP TABLE especialidade_enfermeiro CASCADE CONSTRAINTS;
DROP TABLE enfermeiro CASCADE CONSTRAINTS;
DROP TABLE atendente CASCADE CONSTRAINTS;
DROP TABLE telefone_funcionario CASCADE CONSTRAINTS;
DROP TABLE endereco_funcionario CASCADE CONSTRAINTS;
DROP TABLE funcionario CASCADE CONSTRAINTS;
DROP TABLE paciente_convenio CASCADE CONSTRAINTS;
DROP TABLE telefone_convenio CASCADE CONSTRAINTS;
DROP TABLE endereco_convenio CASCADE CONSTRAINTS;
DROP TABLE convenio CASCADE CONSTRAINTS;
DROP TABLE telefone_paciente CASCADE CONSTRAINTS;
DROP TABLE endereco_paciente CASCADE CONSTRAINTS;
DROP TABLE paciente CASCADE CONSTRAINTS;

DROP SEQUENCE id_convenio_seq;
DROP SEQUENCE id_exame_seq;
DROP SEQUENCE id_diagnostico_seq;
DROP SEQUENCE id_agendamento_seq;

CREATE SEQUENCE id_convenio_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE id_exame_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE id_diagnostico_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE id_agendamento_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE paciente(
  cpf_paciente CHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  data_nascimento DATE NOT NULL,
  sexo VARCHAR(6) NOT NULL,
  CONSTRAINT cpf_paciente_pk PRIMARY KEY (cpf_paciente),
	 CONSTRAINT paciente_sexo_ck CHECK (sexo IN ('Homem', 'Mulher')),
  CONSTRAINT email_paciente_uk UNIQUE (email)
);

CREATE TABLE endereco_paciente(
	 cpf_paciente CHAR(11) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  complemento VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  CONSTRAINT cpf_endereco_paciente_pk PRIMARY KEY (cpf_paciente),
  CONSTRAINT cpf_endereco_paciente_fk FOREIGN KEY (cpf_paciente) REFERENCES paciente (cpf_paciente)
);

CREATE TABLE telefone_paciente (
 cpf_paciente CHAR(11) NOT NULL,
  telefone CHAR(11) NOT NULL,
  CONSTRAINT telefone_paciente_pk PRIMARY KEY (cpf_paciente, telefone),
	 CONSTRAINT cpf_telefone_paciente_fk FOREIGN KEY (cpf_paciente) REFERENCES paciente (cpf_paciente)
);

CREATE TABLE convenio (
  id_convenio INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  operadora VARCHAR(100) NOT NULL,
  status VARCHAR(7) NOT NULL,
  email VARCHAR(100) NOT NULL,
  registro_ans VARCHAR(20) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  CONSTRAINT id_convenio_pk PRIMARY KEY (id_convenio),
  CONSTRAINT convenio_status_ck CHECK (status IN ('Ativo', 'Inativo'))
);

CREATE OR REPLACE TRIGGER trg_convenio_id
BEFORE INSERT ON convenio
FOR EACH ROW
BEGIN
  SELECT id_convenio_seq.NEXTVAL
  INTO :NEW.id_convenio
  FROM dual;
END;
/



CREATE TABLE endereco_convenio (
	 id_convenio INT NOT NULL,
  cep VARCHAR(8) NOT NULL,
  complemento VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  CONSTRAINT id_endereco_convenio_pk PRIMARY KEY (id_convenio),
  CONSTRAINT id_endereco_convenio_fk FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio) ON DELETE CASCADE
);

CREATE TABLE telefone_convenio (
  id_convenio INT NOT NULL,
  telefone CHAR(11) NOT NULL,
	 CONSTRAINT telefone_convenio_pk PRIMARY KEY (id_convenio, telefone),
  CONSTRAINT id_telefone_convenio_fk FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio) ON DELETE CASCADE
);

CREATE TABLE paciente_convenio(
  cpf_paciente CHAR(11) NOT NULL,
  id_convenio INT NOT NULL,
  data_hora_ingresso TIMESTAMP NOT NULL,
  CONSTRAINT paciente_convenio_pk PRIMARY KEY (cpf_paciente, id_convenio),
  CONSTRAINT cpf_paciente_fk FOREIGN KEY (cpf_paciente) REFERENCES paciente (cpf_paciente) ON DELETE CASCADE,
  CONSTRAINT id_convenio_fk FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio) ON DELETE CASCADE
);

CREATE TABLE funcionario (
  cpf_funcionario CHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE NOT NULL,
  sexo VARCHAR(6) NOT NULL,
  turno VARCHAR(6) NOT NULL,
  email VARCHAR(100) NOT NULL,
  CONSTRAINT cpf_funcionario_pk PRIMARY KEY (cpf_funcionario),
  CONSTRAINT turno_funcionario_ck CHECK (turno IN ('Manhã', 'Tarde', 'Noite')),
  CONSTRAINT sexo_funcionario_ck CHECK (sexo IN ('Homem', 'Mulher')),
  CONSTRAINT email_funcionario_uk UNIQUE (email)
);

CREATE TABLE endereco_funcionario (
  cpf_funcionario CHAR(11),
  cep VARCHAR(8) NOT NULL,
  complemento VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  CONSTRAINT endereco_funcionario_pk PRIMARY KEY (cpf_funcionario),
  CONSTRAINT endereco_funcionario_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE
);

CREATE TABLE telefone_funcionario (
  cpf_funcionario CHAR(11) NOT NULL,
  telefone CHAR(11) NOT NULL,
  CONSTRAINT telefone_funcionario_pk PRIMARY KEY (cpf_funcionario, telefone),
  CONSTRAINT cpf_funcionario_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE
);

CREATE TABLE atendente (
	cpf_atendente CHAR(11) NOT NULL,
	CONSTRAINT cpf_atendente_pk PRIMARY KEY (cpf_atendente),
 CONSTRAINT atendente_funcionario_fk FOREIGN KEY (cpf_atendente) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE
);

CREATE TABLE enfermeiro (
 cpf_enfermeiro CHAR(11) NOT NULL,
	registro_coren VARCHAR(20) NOT NULL,
	CONSTRAINT enfermeiro_pk PRIMARY KEY (cpf_enfermeiro),
	CONSTRAINT enfermeiro_funcionario_fk FOREIGN KEY (cpf_enfermeiro) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE,
	CONSTRAINT registro_coren_uk UNIQUE (registro_coren)
);

CREATE TABLE especialidade_enfermeiro (
	cpf_enfermeiro CHAR(11) NOT NULL,
	especialidade VARCHAR(20) NOT NULL,
	CONSTRAINT especialidade_enfermeiro_pk PRIMARY KEY (cpf_enfermeiro, especialidade),
	CONSTRAINT cpf_enfermeiro_fk FOREIGN KEY (cpf_enfermeiro) REFERENCES enfermeiro(cpf_enfermeiro) ON DELETE CASCADE
);

CREATE TABLE medico (
  cpf_medico CHAR(11) NOT NULL,
  crm VARCHAR(20) NOT NULL,
  CONSTRAINT cpf_medico_pk PRIMARY KEY (cpf_medico),
  CONSTRAINT cpf_medico_fk FOREIGN KEY (cpf_medico) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE,
  CONSTRAINT crm_uk UNIQUE (crm)
);  

CREATE TABLE especialidade_medico (
  cpf_medico CHAR(11) NOT NULL,
  especialidade VARCHAR(20) NOT NULL,
	 CONSTRAINT especialidade_medico_pk PRIMARY KEY (cpf_medico, especialidade),
  CONSTRAINT especialidade_medico_fk FOREIGN KEY (cpf_medico) REFERENCES medico (cpf_medico)  ON DELETE CASCADE
);

CREATE TABLE exame (
  id_exame INT NOT NULL,
  cpf_medico CHAR(11) NOT NULL,
  tipo VARCHAR(100) NOT NULL,
  CONSTRAINT id_exame_pk PRIMARY KEY (id_exame),
  CONSTRAINT exame_medico_fk FOREIGN KEY (cpf_medico) REFERENCES medico (cpf_medico)
);

CREATE OR REPLACE TRIGGER trg_exame_id
BEFORE INSERT ON exame
FOR EACH ROW
BEGIN
  SELECT id_exame_seq.NEXTVAL
  INTO :NEW.id_exame
  FROM dual;
END;
/


CREATE TABLE resultado(
  id_exame INT NOT NULL,
  conteudo VARCHAR(1000) NOT NULL,
  data_hora_emissao TIMESTAMP NOT NULL,
  CONSTRAINT resultado_pk PRIMARY KEY (id_exame),
  CONSTRAINT resultado_fk FOREIGN KEY (id_exame) REFERENCES exame (id_exame) ON DELETE CASCADE
);

CREATE TABLE diagnostico(
  id_diagnostico INT NOT NULL,
  conteudo VARCHAR(1000) NOT NULL,
  tipo VARCHAR(100) NOT NULL,
  data_hora_emissao TIMESTAMP NOT NULL,
  cpf_paciente CHAR(11) NOT NULL,
	 id_convenio INT NOT NULL,
  CONSTRAINT id_diagnostico_pk PRIMARY KEY (id_diagnostico),
  CONSTRAINT diagnostico_paciente_convenio_fk FOREIGN KEY (cpf_paciente, id_convenio) REFERENCES paciente_convenio (cpf_paciente, id_convenio)
);

CREATE OR REPLACE TRIGGER trg_diagnostico_id
BEFORE INSERT ON diagnostico
FOR EACH ROW
BEGIN
  SELECT id_diagnostico_seq.NEXTVAL
  INTO :NEW.id_diagnostico
  FROM dual;
END;
/

CREATE TABLE sala_exame (
  numero_sala VARCHAR(3) NOT NULL, 
  tipo VARCHAR(50) NOT NULL,
  status VARCHAR(200) NOT NULL,
  CONSTRAINT numero_sala_pk PRIMARY KEY (numero_sala),
  CONSTRAINT sala_exame_ck CHECK (status IN ('Disponível', 'Indisponível', 'Em Manutenção'))
);

CREATE TABLE agendamento (
  id_agendamento INT NOT NULL,
  status VARCHAR(20) NOT NULL,
  tipo VARCHAR(100) NOT NULL,
  data_hora TIMESTAMP NOT NULL,
  cpf_paciente CHAR(11) NOT NULL,
  id_convenio INT NOT NULL,
  CONSTRAINT id_agendamento_pk PRIMARY KEY (id_agendamento),
  CONSTRAINT agendamento_paciente_convenio_fk FOREIGN KEY (cpf_paciente, id_convenio) REFERENCES paciente_convenio (cpf_paciente, id_convenio),
  CONSTRAINT agendamento_status_ck CHECK (status IN ('Pendente', 'Confirmado', 'Cancelado'))
);

CREATE OR REPLACE TRIGGER trg_agendamento_id
BEFORE INSERT ON agendamento
FOR EACH ROW
BEGIN
  SELECT id_agendamento_seq.NEXTVAL
  INTO :NEW.id_agendamento
  FROM dual;
END;
/


CREATE TABLE analise(
  cpf_medico CHAR(11) NOT NULL,
  id_exame INT NOT NULL,
  id_diagnostico INT NOT NULL,
  conteudo VARCHAR(1000) NOT NULL,
  CONSTRAINT analise_pk PRIMARY KEY (cpf_medico, id_exame),
  CONSTRAINT analise_medico_fk FOREIGN KEY (cpf_medico) REFERENCES medico (cpf_medico),
  CONSTRAINT analise_diagnostico_fk FOREIGN KEY (id_diagnostico) REFERENCES diagnostico (id_diagnostico)
);

CREATE TABLE auxilia(
  auxiliador CHAR(11) NOT NULL,
  auxiliado CHAR(11) NOT NULL,
  CONSTRAINT auxilia_pk PRIMARY KEY (auxiliador, auxiliado),
  CONSTRAINT auxiliador_fk FOREIGN KEY (auxiliador) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE,
  CONSTRAINT auxiliado_fk FOREIGN KEY (auxiliado) REFERENCES funcionario (cpf_funcionario) ON DELETE CASCADE
);

CREATE TABLE realiza(
  id_exame INT NOT NULL,
  cpf_enfermeiro CHAR(11) NOT NULL,
  cpf_paciente CHAR(11) NOT NULL,
  id_convenio INT NOT NULL,
  data_hora_inicio TIMESTAMP NOT NULL,
  data_hora_fim TIMESTAMP NOT NULL,
  CONSTRAINT realiza_pk PRIMARY KEY (id_exame),
  CONSTRAINT realiza_exame_fk FOREIGN KEY (id_exame) REFERENCES exame (id_exame) ON DELETE CASCADE,
  CONSTRAINT realiza_enfermeiro_fk FOREIGN KEY (cpf_enfermeiro) REFERENCES enfermeiro (cpf_enfermeiro),
  CONSTRAINT realiza_paciente_convenio_fk FOREIGN KEY (cpf_paciente, id_convenio) REFERENCES paciente_convenio (cpf_paciente, id_convenio)
);

CREATE TABLE designa(
  id_exame INT NOT NULL,
  cpf_atendente CHAR(11) NOT NULL,
  numero_sala VARCHAR(3) NOT NULL,
  CONSTRAINT designa_pk PRIMARY KEY (id_exame),
  CONSTRAINT id_exame_fk FOREIGN KEY (id_exame) REFERENCES exame (id_exame),
  CONSTRAINT atendente_fk FOREIGN KEY (cpf_atendente) REFERENCES atendente (cpf_atendente),
  CONSTRAINT numero_sala_fk FOREIGN KEY (numero_sala) REFERENCES sala_exame (numero_sala)
);



