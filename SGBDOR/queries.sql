-- Suprindo o GPT com nossos scripts de criação (corrigidos após o feedback da entrega passada),
-- pedimos pra que ele gerasse alguns desafios de consultas para que testássemos nossa capacidade de
-- escrever queries complexas.

-- 1. Quais são todos os diagnósticos associados a todos os exames que foram solicitados por um médico específico?
SELECT D.id_diagnostico, D.conteudo, D.tipo, D.data_hora_emissao, D.exame_ref
FROM TB_DIAGNOSTICO D
WHERE D.exame_ref IN (
  SELECT REF(E) FROM TB_EXAME E
  WHERE E.solicitante_ref = (SELECT REF(M) FROM TB_MEDICO M WHERE M.cpf_funcionario = '91919191919')
)

-- 2. Gere um relatório que mostre, para cada agendamento na tabela TB_AGENDAMENTO, 
-- o ID do agendamento, o status dele e o nome do paciente associado a esse agendamento.
-- Teste de DEREF dentro de DEREF
SELECT A.id_agendamento, A.status, DEREF(DEREF(A.pac_conv_ref).paciente_ref).nome AS nome_paciente
FROM TB_AGENDAMENTO A;

-- 3. Gere um relatório que mostre o nome e o CRM de todos os médicos que possuem
-- a especialidade 'Cardiologia' em sua lista de especialidades.
SELECT M.nome, M.crm_medico
FROM TB_MEDICO M
WHERE 'Cardiologia' IN (
  SELECT E.nome FROM TABLE(M.especialidades) E
)

-- 4. Gere um relatório que mostre o nome e o CPF do paciente que possui o 
-- número de telefone '11999999999' em sua lista de telefones.
SELECT P.nome, P.cpf_paciente
FROM TB_PACIENTE P
WHERE '11999999999' IN (
  SELECT * FROM TABLE(P.telefones) T
)

-- 5. Testando a função get_identificador_formatado
SELECT M.get_identificador_formatado() AS crm_medico
FROM TB_MEDICO M
WHERE M.cpf_funcionario = '91919191919';

-- 6. Testando o procedure alterar_data_hora
DECLARE
  v_ag TP_AGENDAMENTO;
BEGIN
  SELECT VALUE(A) INTO v_ag
  FROM TB_AGENDAMENTO A
  WHERE A.id_agendamento = 1
  FOR UPDATE;

  v_ag.alterar_data_hora(TO_TIMESTAMP('2025-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

  UPDATE TB_AGENDAMENTO A
  SET VALUE(A) = v_ag
  WHERE A.id_agendamento = 1;

  COMMIT;
END;

-- 7. Testando a função map_to_date para pegar o novo valor
SELECT A.map_to_date() AS data_hora
FROM TB_AGENDAMENTO A
WHERE A.id_agendamento = 1;

-- 8. Testando a função get_identificador_formatado
SELECT F.get_identificador_formatado() AS cpf_funcionario
FROM TB_FUNCIONARIO F
WHERE F.nome = 'João da Silva';

-- 9. Número de exames realizados por sala, mas dessa vez com INNER JOIN, 
-- pra tentar uma abordagem diferente da questão 1
SELECT S.numero_sala, COUNT(*) AS numero_exames
FROM TB_DESIGNA D
JOIN TB_SALA_EXAME S ON REF(S) = D.sala_ref
JOIN TB_EXAME E ON REF(E) = D.exame_ref
GROUP BY S.numero_sala;
