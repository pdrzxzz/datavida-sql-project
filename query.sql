-- SQL
-- 1 ALTER TABLE
ALTER TABLE designa
RENAME COLUMN id_exame to exame_id;

ALTER TABLE designa
RENAME COLUMN exame_id to id_exame;

-- 2 CREATE INDEX
CREATE INDEX idx_exame
ON exame(tipo);

-- 3 INSERT INTO
INSERT INTO paciente VALUES ('94594594594', 'Bob John', 'bob@example.com', DATE '1982-02-11', 'Homem');

-- 4 UPDATE
UPDATE paciente
SET nome = 'Bobby Johnny'
WHERE cpf_paciente = '94594594594';

-- 5 DELETE
DELETE FROM paciente WHERE cpf_paciente = '94594594594';

-- 6 SELECT-FROM-WHERE
SELECT * FROM sala_exame
WHERE tipo = 'Cardiologia';

-- 7 BETWEEN
SELECT * FROM paciente
WHERE data_nascimento BETWEEN DATE '1985-01-01' AND DATE '1989-12-31';

-- 8 IN
SELECT * FROM funcionario
WHERE turno IN ('Manhã', 'Tarde')
ORDER BY turno;

-- 9 LIKE
SELECT * FROM paciente
WHERE nome LIKE 'L%';

-- 10 IS NULL ou IS NOT NULL
SELECT * FROM paciente
WHERE email IS NOT NULL;

-- 11 INNER JOIN
SELECT * from medico
JOIN funcionario ON medico.cpf_medico = funcionario.cpf_funcionario
WHERE turno = 'Noite';

-- 12 MAX
SELECT MAX(data_hora_emissao) FROM diagnostico;

-- 13 MIN (DATA DE NASCIMENTO DO PACIENTE MAIS VELHO)
SELECT MIN(data_nascimento) FROM paciente;

-- 14 AVG (MÉDIA DAS IDADES DOS FUNCIONÁRIOS)
SELECT FLOOR(AVG(FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12))) AS idade FROM funcionario;

-- 15 COUNT
SELECT COUNT(*) FROM realiza;

-- 16 LEFT ou RIGHT ou FULL OUTER JOIN (TODOS OS FUNCIONÁRIOS QUE TRABALHAM E [SE PRESENTE], SEUS CRM)
SELECT * from medico
FULL JOIN funcionario ON medico.cpf_medico = funcionario.cpf_funcionario;

-- 17 SUBCONSULTA COM OPERADOR RELACIONAL (NOME E DATA DE NASCIMENTO DO FUNCIONÁRIO MAIS JOVEM)
SELECT nome, data_nascimento FROM funcionario
WHERE data_nascimento = (SELECT MAX(data_nascimento) FROM funcionario);

-- 18 SUBCONSULTA COM IN (TODOS FUNCIONÁRIOS QUE TRABALHAM NO MESMO TURNO DE UMA MULHER)
SELECT nome, turno
FROM funcionario
WHERE turno IN (
  SELECT turno
  FROM funcionario
  WHERE sexo = 'Mulher'
);

-- 19 SUBCONSULTA COM ANY (PACIENTES MAIS VELHOS QUE ALGUM FUNCIONÁRIO)
SELECT nome, data_nascimento FROM paciente
WHERE data_nascimento < ANY (
    SELECT data_nascimento
    FROM funcionario
);

-- 20 SUBCONSULTA COM ALL (PACIENTES QUE SÃO MAIS JOVENS QUE TODOS OS FUNCIONÁRIOS)
SELECT nome, data_nascimento
FROM paciente
WHERE data_nascimento > ALL (
  SELECT data_nascimento
  FROM funcionario
);

-- 21 ORDER BY
SELECT * FROM AGENDAMENTO ORDER BY DATA_HORA;

-- 22 GROUP BY (NÚMERO DE AGENDAMENTOS PARA CADA TIPO DE AGENDAMENTO)
SELECT
   TIPO,
   COUNT(*) AS TOTAL_AGENDAMENTOS
FROM AGENDAMENTO GROUP BY TIPO;

-- 23 HAVING
SELECT
   TIPO,
   COUNT(*) AS TOTAL_AGENDAMENTOS
FROM
   AGENDAMENTO
GROUP BY
   TIPO
HAVING
   COUNT(*) > 1;

-- 24 UNION ou INTERSECT ou MINUS
SELECT nome FROM paciente
UNION
SELECT nome FROM funcionario;

-- 25 CREATE VIEW (CRIA UMA VISÃO QUE MOSTRA DETALHES DOS AGENDAMENTOS DOS PACIENTES)
CREATE OR REPLACE VIEW vw_agendamentos_detalhados AS
SELECT
    a.id_agendamento,
    a.data_hora,
    a.tipo AS tipo_agendamento,
    a.status,
    p.nome AS nome_paciente,
    p.email AS email_paciente,
    c.nome AS nome_convenio,
    c.operadora
FROM agendamento a
JOIN paciente p ON a.cpf_paciente = p.cpf_paciente
JOIN convenio c ON a.id_convenio = c.id_convenio;

--(USO DA VIEW)
SELECT * FROM vw_agendamentos_detalhados WHERE status = 'Confirmado';

-- PL
-- 1 USO DE RECORD
DECLARE
   v_funcionario funcionario%ROWTYPE;
   v_cpf_funcionario CHAR(11) := '91919191919';


BEGIN
   SELECT
       *
   INTO
       v_funcionario
   FROM
       funcionario
   WHERE
       cpf_funcionario = v_cpf_funcionario;


   DBMS_OUTPUT.PUT_LINE('Nome: ' || v_funcionario.Nome);
   DBMS_OUTPUT.PUT_LINE('Email: ' || v_funcionario.Email);
   DBMS_OUTPUT.PUT_LINE('Sexo: ' || v_funcionario.Sexo);
END;

-- 2 USO DE ESTRUTURA DE DADOS DO TIPO TABLE (RETORNA NOME DOS PACIENTES ASSOCIADOS AO CONVENIO 1)
DECLARE
  -- Definindo tipo baseado na estrutura da tabela paciente
  TYPE tp_paciente IS TABLE OF paciente%ROWTYPE INDEX BY PLS_INTEGER;
  pacientes tp_paciente;


  i PLS_INTEGER := 0;
BEGIN
  -- Carregando todos os pacientes do convênio 1
  SELECT p.*
  BULK COLLECT INTO pacientes
  FROM paciente p
  JOIN paciente_convenio pc ON p.cpf_paciente = pc.cpf_paciente
  WHERE pc.id_convenio = 1;


  -- Iterando e mostrando nomes
  FOR i IN pacientes.FIRST .. pacientes.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Paciente: ' || pacientes(i).nome);
  END LOOP;
END;

-- 3 BLOCO ANÔNIMO (PROCURA POR FUNCIONÁRIOS BASEADO NA VARIÁVEL DECLARADA E ARMAZENA INFORMAÇÕES EM OUTRA VARIÁVEIS PARA DEPOIS PRINTAR)
DECLARE
   v_cpf_funcionario CHAR(11) := '91919191919';
   v_nome_funcionario VARCHAR(100);
   v_email_funcionario VARCHAR(100);


BEGIN
   SELECT
       nome,
       email
   INTO
       v_nome_funcionario,
       v_email_funcionario
   FROM
       funcionario
   WHERE
       cpf_funcionario = v_cpf_funcionario;


   DBMS_OUTPUT.PUT_LINE('CPF: ' || v_cpf_funcionario);
   DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome_funcionario);
   DBMS_OUTPUT.PUT_LINE('Email: ' || v_email_funcionario);
END;

-- 4 CREATE PROCEDURE
CREATE OR REPLACE PROCEDURE atualizar_email_paciente (
   p_cpf_paciente IN paciente.cpf_paciente%TYPE,
   p_novo_email   IN paciente.email%TYPE
)
IS
BEGIN
   UPDATE paciente
   SET
       email = p_novo_email
   WHERE
       cpf_paciente = p_cpf_paciente;


   IF SQL%ROWCOUNT = 0 THEN
       RAISE_APPLICATION_ERROR(-20001, 'Paciente com CPF ' || p_cpf_paciente || ' não encontrado.');
   ELSE
       COMMIT;
   END IF;
END;
-- 5 CREATE FUNCTION
CREATE OR REPLACE FUNCTION calcular_idade_paciente (
   p_data_nascimento IN paciente.data_nascimento%TYPE
)
RETURN NUMBER
IS
   v_idade NUMBER;
BEGIN
   v_idade := TRUNC(MONTHS_BETWEEN(SYSDATE, p_data_nascimento) / 12);


   RETURN v_idade;
END;

-- 6 %TYPE
DECLARE
    v_date paciente.data_nascimento%TYPE; --força a variável a ser do mesmo tipo de dado da coluna


BEGIN
  SELECT data_nascimento INTO v_date
  FROM paciente
  WHERE cpf_paciente = '12121212121';
END;

-- 7 %ROWTYPE
DECLARE
  v_funcionario funcionario%ROWTYPE;  -- variável que pode armazenar uma linha inteira da tabela funcionario (sem precisar declarar cada coluna individualmente com %TYPE).
BEGIN
  SELECT *
  INTO v_funcionario
  FROM funcionario
  WHERE cpf_funcionario = '32323232323';


  -- posso acessar campos da variável
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_funcionario.nome);
  DBMS_OUTPUT.PUT_LINE('Email: ' || v_funcionario.email);
END;

-- 8 IF ELSIF
DECLARE
   v_cnpj_convenio VARCHAR(14) := '12345678000199';
   v_status_convenio convenio.status%TYPE;
   v_nome_convenio convenio.nome%TYPE;


BEGIN
   SELECT
       status,
       nome
   INTO
       v_status_convenio,
       v_nome_convenio
   FROM
       convenio
   WHERE
       CNPJ = v_cnpj_convenio;


   DBMS_OUTPUT.PUT_LINE('Convênio: ' || v_nome_convenio || ' (ID: ' || v_cnpj_convenio || ')');


   IF v_status_convenio = 'Ativo' THEN
       DBMS_OUTPUT.PUT_LINE('ATIVO');
   ELSIF v_status_convenio = 'Inativo' THEN
       DBMS_OUTPUT.PUT_LINE('INATIVO');
   ELSE
       DBMS_OUTPUT.PUT_LINE(v_status_convenio || '. Status desconhecido ou inválido.');
   END IF;
END;

-- 9 CASE WHEN
SELECT
   cpf_paciente,
   nome,
   data_nascimento,
   calcular_idade_paciente(data_nascimento) AS idade_anos,
   CASE
       WHEN calcular_idade_paciente(data_nascimento) < 18 THEN 'Menor de Idade'
       WHEN calcular_idade_paciente(data_nascimento) BETWEEN 18 AND 60 THEN 'Adulto'
       WHEN calcular_idade_paciente(data_nascimento) > 60 THEN 'Idoso'
       ELSE 'Idade Não Determinada'
   END AS categoria_idade
FROM
   paciente
ORDER BY
   idade_anos DESC;

-- 10 LOOP EXIT WHEN (ITERA SOBRE TODOS OS PACIENTES IMPRIMINDO SEUS NOMES E CPFs UTILIZANDO CURSOR, LOOP EXIT WHEN E %TYPE)
DECLARE
  CURSOR cur_pacientes IS SELECT cpf_paciente, nome FROM paciente;
  v_cpf paciente.cpf_paciente%TYPE;
  v_nome paciente.nome%TYPE;
BEGIN
  OPEN cur_pacientes;
  LOOP
    FETCH cur_pacientes INTO v_cpf, v_nome;
    EXIT WHEN cur_pacientes%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Paciente: ' || v_nome || ', CPF: ' || v_cpf);
  END LOOP;
  CLOSE cur_pacientes;
END;
/

-- 11 WHILE LOOP (ITERA SOBRE TODOS OS PACIENTES IMPRIMINDO SEUS NOMES E CPFs UTILIZANDO CURSOR, WHILE LOOP E %ROWTYPE)
DECLARE
  CURSOR cur_pacientes IS SELECT * FROM paciente;
  v_paciente paciente%ROWTYPE;
BEGIN
  OPEN cur_pacientes;


  FETCH cur_pacientes INTO v_paciente;
  WHILE cur_pacientes%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_paciente.nome || ', CPF: ' || v_paciente.cpf_paciente);


    FETCH cur_pacientes INTO v_paciente;
  END LOOP;


  CLOSE cur_pacientes;
END;
/

-- 12 FOR IN LOOP (ITERA SOBRE TODOS OS PACIENTES IMPRIMINDO SEUS NOMES E CPFs UTILIZANDO FOR LOOP E %ROWTYPE)
DECLARE
  v_paciente paciente%ROWTYPE;
BEGIN
  FOR paciente_rec IN (SELECT * FROM paciente) LOOP
    v_paciente := paciente_rec;
    DBMS_OUTPUT.PUT_LINE('Paciente: ' || v_paciente.nome || ', CPF: ' || v_paciente.cpf_paciente);
  END LOOP;
END;
/

-- 13 SELECT ... INTO
DECLARE
    v_date paciente.data_nascimento%TYPE;
BEGIN
  SELECT data_nascimento INTO v_date
  FROM paciente
  WHERE cpf_paciente = '12121212121';
END;

-- 14 CURSOR (OPEN, FETCH e CLOSE) (ITERA SOBRE TODOS OS PACIENTES IMPRIMINDO SEUS NOMES E CPFs UTILIZANDO CURSOR, WHILE LOOP E %ROWTYPE)
DECLARE
  CURSOR cur_pacientes IS SELECT * FROM paciente;
  v_paciente paciente%ROWTYPE;
BEGIN
  OPEN cur_pacientes;


  FETCH cur_pacientes INTO v_paciente;
  WHILE cur_pacientes%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_paciente.nome || ', CPF: ' || v_paciente.cpf_paciente);


    FETCH cur_pacientes INTO v_paciente;
  END LOOP;


  CLOSE cur_pacientes;
END;
/

-- 15 EXCEPTION WHEN (PROCURA POR UM CPF NÃO EXISTENTE E RETORNA UMA MENSAGEM DE ERRO ESPECÍFICA)
DECLARE
   v_cpf_funcionario CHAR(11) := '91919191910';
   v_nome_funcionario VARCHAR(100);
   v_email_funcionario VARCHAR(100);


BEGIN
   SELECT
       nome,
       email
   INTO
       v_nome_funcionario,
       v_email_funcionario
   FROM
       funcionario
   WHERE
       cpf_funcionario = v_cpf_funcionario;


   DBMS_OUTPUT.PUT_LINE('CPF: ' || v_cpf_funcionario);
   DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome_funcionario);
   DBMS_OUTPUT.PUT_LINE('Email: ' || v_email_funcionario);


EXCEPTION
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Funcionário com CPF ' || v_cpf_funcionario || ' não encontrado.');
   WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Ocorreu um erro inesperado: ' || SQLERRM);
END;

-- 16 USO DE PARÂMETROS (IN, OUT ou IN OUT)
CREATE OR REPLACE PROCEDURE prc_cancelar_agendamento (
    -- Parâmetro de ENTRADA: o ID do agendamento que queremos cancelar.
    p_id_agendamento IN agendamento.id_agendamento%TYPE
) IS
BEGIN
    -- Usa o ID recebido para encontrar o agendamento correto e mudar o status.
    UPDATE agendamento
    SET status = 'Cancelado'
    WHERE id_agendamento = p_id_agendamento;


    -- Confirma a mudança no banco de dados.
    COMMIT;
END;
/

-- 17 CREATE OR REPLACE PACKAGE
CREATE OR REPLACE PACKAGE pkg_gerencia_clinica AS


    -- DECLARA UM PROCEDIMENTO PARA ATUALIZAR O TURNO DE UM FUNCIONÁRIO.
    PROCEDURE prc_atualizar_turno_func (
        p_cpf_func   IN funcionario.cpf_funcionario%TYPE,
        p_novo_turno IN funcionario.turno%TYPE
    );


    -- DECLARA UM PROCEDIMENTO PARA CANCELAR UM AGENDAMENTO.
    PROCEDURE prc_cancelar_agendamento (
        p_id_agendamento IN agendamento.id_agendamento%TYPE
    );


END pkg_gerencia_clinica;
/

-- 18 CREATE OR REPLACE PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY pkg_gerencia_clinica AS


    -- IMPLEMENTAÇÃO DO PROCEDIMENTO PARA ATUALIZAR O TURNO.
    PROCEDURE prc_atualizar_turno_func (
        p_cpf_func   IN funcionario.cpf_funcionario%TYPE,
        p_novo_turno IN funcionario.turno%TYPE
    ) IS
    BEGIN
        UPDATE funcionario
        SET turno = p_novo_turno
        WHERE cpf_funcionario = p_cpf_func;
    END prc_atualizar_turno_func;


    -- IMPLEMENTAÇÃO DO PROCEDIMENTO PARA CANCELAR UM AGENDAMENTO.
    PROCEDURE prc_cancelar_agendamento (
        p_id_agendamento IN agendamento.id_agendamento%TYPE
    ) IS
    BEGIN
        UPDATE agendamento
        SET status = 'Cancelado'
        WHERE id_agendamento = p_id_agendamento;
    END prc_cancelar_agendamento;


END pkg_gerencia_clinica;
/

--19 CREATE OR REPLACE TRIGGER (COMANDO)(IMPEDE QUE UM FUNCIONÁRIO SEJA DELETADO)
CREATE OR REPLACE TRIGGER trg_impede_delete_funcionario
BEFORE DELETE ON funcionario
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'A exclusão de registros da tabela de funcionários é proibida.');
END;

--20 CREATE OR REPLACE TRIGGER(LINHA)(GARANTE QUE O E-MAIL DE UM FUNCIONÁRIO SEJA SEMPRE EM MINÚSCULAS)
CREATE OR REPLACE TRIGGER trg_padroniza_email_funcionario
BEFORE INSERT OR UPDATE ON funcionario
FOR EACH ROW
BEGIN
    :NEW.email := LOWER(:NEW.email);
END;
