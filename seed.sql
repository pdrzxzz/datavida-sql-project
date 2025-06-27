-- PACIENTES
INSERT INTO paciente VALUES ('11111111111', 'Ana Souza', 'ana@example.com', DATE '1990-05-10', 'Mulher');
INSERT INTO paciente VALUES ('22222222222', 'Carlos Silva', 'carlos@example.com', DATE '1985-08-20', 'Homem');
INSERT INTO paciente VALUES ('33333333333', 'João Pedro', 'joao@example.com', DATE '1992-03-12', 'Homem');
INSERT INTO paciente VALUES ('44444444444', 'Larissa Alves', 'larissa@example.com', DATE '2000-09-01', 'Mulher');
INSERT INTO paciente VALUES ('55555555555', 'Mariana Lima', 'mariana@example.com', DATE '1988-12-05', 'Mulher');
INSERT INTO paciente VALUES ('66666666666', 'Roberto Castro', 'roberto@example.com', DATE '1977-07-17', 'Homem');
INSERT INTO paciente VALUES ('77777777777', 'Fernanda Souza', 'fernanda@example.com', DATE '1995-02-28', 'Mulher');
INSERT INTO paciente VALUES ('88888888888', 'André Gomes', 'andre@example.com', DATE '1983-11-11', 'Homem');
INSERT INTO paciente VALUES ('99999999999', 'Cláudia Santos', 'claudia@example.com', DATE '1990-10-30', 'Mulher');
INSERT INTO paciente VALUES ('10101010101', 'Paulo Almeida', 'paulo@example.com', DATE '1985-06-21', 'Homem');
INSERT INTO paciente VALUES ('12121212121', 'Julia Fernandes', 'julia@example.com', DATE '1993-09-09', 'Mulher');
INSERT INTO paciente VALUES ('13131313131', 'Carlos Eduardo', 'carlosedu@example.com', DATE '1980-01-15', 'Homem');
INSERT INTO paciente VALUES ('14141414141', 'Beatriz Melo', 'beatriz@example.com', DATE '1998-03-03', 'Mulher');
INSERT INTO paciente VALUES ('15151515151', 'Ricardo Lopes', 'ricardo@example.com', DATE '1975-04-27', 'Homem');
INSERT INTO paciente VALUES ('16161616161', 'Ana Clara', 'anaclara@example.com', DATE '1999-12-12', 'Mulher');
INSERT INTO paciente VALUES ('17171717171', 'Vitor Hugo', 'vitor@example.com', DATE '1987-08-08', 'Homem');
INSERT INTO paciente VALUES ('18181818181', 'Isabela Ribeiro', 'isabela@example.com', DATE '1991-05-05', 'Mulher');
INSERT INTO paciente VALUES ('19191919191', 'Thiago Martins', 'thiago@example.com', DATE '1984-03-25', 'Homem');
INSERT INTO paciente VALUES ('20202020202', 'Marina Dias', 'marina@example.com', DATE '1996-07-14', 'Mulher');
INSERT INTO paciente VALUES ('21212121212', 'Felipe Nunes', 'felipe@example.com', DATE '1989-09-19', 'Homem');


-- ENDEREÇOS e TELEFONES DOS PACIENTES
INSERT INTO endereco_paciente VALUES ('11111111111', '12345678', 'Apto 101', '100');
INSERT INTO endereco_paciente VALUES ('22222222222', '87654321', 'Casa', '50');
INSERT INTO endereco_paciente VALUES ('33333333333', '55555555', 'Fundos', '25');
INSERT INTO endereco_paciente VALUES ('44444444444', '99999999', 'Ap 3', '15');
INSERT INTO endereco_paciente VALUES ('55555555555', '11112222', 'Casa', '101');
INSERT INTO endereco_paciente VALUES ('66666666666', '22223333', 'Ap 102', '102');
INSERT INTO endereco_paciente VALUES ('77777777777', '33334444', 'Fundos', '103');
INSERT INTO endereco_paciente VALUES ('88888888888', '44445555', 'Bloco C', '104');
INSERT INTO endereco_paciente VALUES ('99999999999', '55556666', 'Sala 1', '105');
INSERT INTO endereco_paciente VALUES ('10101010101', '66667777', 'Casa', '106');
INSERT INTO endereco_paciente VALUES ('12121212121', '77778888', 'Ap 201', '107');
INSERT INTO endereco_paciente VALUES ('13131313131', '88889999', 'Fundos', '108');
INSERT INTO endereco_paciente VALUES ('14141414141', '99990000', 'Bloco D', '109');
INSERT INTO endereco_paciente VALUES ('15151515151', '10101010', 'Ap 301', '110');
INSERT INTO endereco_paciente VALUES ('16161616161', '11112121', 'Casa', '111');
INSERT INTO endereco_paciente VALUES ('17171717171', '12121212', 'Sala 2', '112');
INSERT INTO endereco_paciente VALUES ('18181818181', '13131313', 'Fundos', '113');
INSERT INTO endereco_paciente VALUES ('19191919191', '14141414', 'Ap 401', '114');
INSERT INTO endereco_paciente VALUES ('20202020202', '15151515', 'Bloco E', '115');
INSERT INTO endereco_paciente VALUES ('21212121212', '16161616', 'Casa', '116');

INSERT INTO telefone_paciente VALUES ('11111111111', '11999999999');
INSERT INTO telefone_paciente VALUES ('22222222222', '11888888888');
INSERT INTO telefone_paciente VALUES ('33333333333', '11777777777');
INSERT INTO telefone_paciente VALUES ('44444444444', '11666666666');
INSERT INTO telefone_paciente VALUES ('55555555555', '11988887777');
INSERT INTO telefone_paciente VALUES ('66666666666', '11877776666');
INSERT INTO telefone_paciente VALUES ('77777777777', '11766665555');
INSERT INTO telefone_paciente VALUES ('88888888888', '11655554444');
INSERT INTO telefone_paciente VALUES ('99999999999', '11544443333');
INSERT INTO telefone_paciente VALUES ('10101010101', '11433332222');
INSERT INTO telefone_paciente VALUES ('12121212121', '11322221111');
INSERT INTO telefone_paciente VALUES ('13131313131', '11211110000');
INSERT INTO telefone_paciente VALUES ('14141414141', '11100009999');
INSERT INTO telefone_paciente VALUES ('15151515151', '11099998888');
INSERT INTO telefone_paciente VALUES ('16161616161', '11988887766');
INSERT INTO telefone_paciente VALUES ('17171717171', '11877776655');
INSERT INTO telefone_paciente VALUES ('18181818181', '11766665544');
INSERT INTO telefone_paciente VALUES ('19191919191', '11655554433');
INSERT INTO telefone_paciente VALUES ('20202020202', '11544443322');
INSERT INTO telefone_paciente VALUES ('21212121212', '11433332211');

-- CONVÊNIOS
INSERT INTO convenio (nome, operadora, status, email, registro_ans, cnpj) 
VALUES ('Saúde Total', 'Unimed', 'Ativo', 'contato@saudetotal.com', 'ANS123456', '12345678000199');
INSERT INTO convenio (nome, operadora, status, email, registro_ans, cnpj) 
VALUES ('Vida Plena', 'Amil', 'Ativo', 'contato@vidaplena.com', 'ANS654321', '98765432000188');
INSERT INTO convenio (nome, operadora, status, email, registro_ans, cnpj) 
VALUES ('Bem Viver', 'Bradesco Saúde', 'Ativo', 'contato@bemviver.com', 'ANS000111', '11122233000177');
INSERT INTO convenio (nome, operadora, status, email, registro_ans, cnpj) 
VALUES ('Saúde Bem', 'Unimed', 'Ativo', 'contato@saudebem.com', 'ANS789012', '32165498000155');
INSERT INTO convenio (nome, operadora, status, email, registro_ans, cnpj) 
VALUES ('Mais Vida', 'Bradesco', 'Ativo', 'contato@maisvida.com', 'ANS210987', '65498732000144');
INSERT INTO convenio (nome, operadora, status, email, registro_ans, cnpj) 
VALUES ('Clínica Vida', 'Amil', 'Ativo', 'contato@clinicavida.com', 'ANS345678', '98732165000133');

-- ENDEREÇOS e TELEFONES DOS CONVÊNIOS
INSERT INTO endereco_convenio VALUES (1, '11223344', 'Torre A', '10');
INSERT INTO endereco_convenio VALUES (2, '44332211', 'Bloco B', '20');
INSERT INTO endereco_convenio VALUES (3, '77776666', 'Conj. C', '30');
INSERT INTO endereco_convenio VALUES (4, '22221111', 'Bloco F', '40');
INSERT INTO endereco_convenio VALUES (5, '33332222', 'Torre B', '50');
INSERT INTO endereco_convenio VALUES (6, '44443333', 'Conj. D', '60');

INSERT INTO telefone_convenio VALUES (1, '1133333333');
INSERT INTO telefone_convenio VALUES (2, '1144444444');
INSERT INTO telefone_convenio VALUES (3, '1155555555');
INSERT INTO telefone_convenio VALUES (4, '1166666666');
INSERT INTO telefone_convenio VALUES (5, '1177777777');
INSERT INTO telefone_convenio VALUES (6, '1188888888');


-- PACIENTE_CONVENIO
INSERT INTO paciente_convenio VALUES ('11111111111', 1, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('22222222222', 2, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('33333333333', 1, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('44444444444', 3, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('55555555555', 4, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('66666666666', 5, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('77777777777', 6, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('88888888888', 1, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('99999999999', 2, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('10101010101', 3, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('12121212121', 4, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('13131313131', 5, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('14141414141', 6, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('15151515151', 1, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('16161616161', 2, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('17171717171', 3, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('18181818181', 4, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('19191919191', 5, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('20202020202', 6, SYSTIMESTAMP);
INSERT INTO paciente_convenio VALUES ('21212121212', 1, SYSTIMESTAMP);


-- FUNCIONÁRIOS (CPFs corrigidos para não conflitar com pacientes)
INSERT INTO funcionario VALUES ('91919191919', 'Lucas Rocha', DATE '1995-11-12', 'Homem', 'Noite', 'lucas@clinic.com');
INSERT INTO funcionario VALUES ('92929292929', 'Carla Dias', DATE '1990-04-08', 'Mulher', 'Manhã', 'carla@clinic.com');
INSERT INTO funcionario VALUES ('93939393939', 'Pedro Santos', DATE '1983-01-22', 'Homem', 'Tarde', 'pedro@clinic.com');
INSERT INTO funcionario VALUES ('94949494949', 'Juliana Paz', DATE '1996-06-15', 'Mulher', 'Noite', 'juliana@clinic.com');
INSERT INTO funcionario VALUES ('31313131313', 'Renata Alves', DATE '1992-04-10', 'Mulher', 'Manhã', 'renata@clinic.com');
INSERT INTO funcionario VALUES ('32323232323', 'Gustavo Oliveira', DATE '1987-12-22', 'Homem', 'Tarde', 'gustavo@clinic.com');
INSERT INTO funcionario VALUES ('95959595959', 'Caroline Dias', DATE '1994-07-17', 'Mulher', 'Noite', 'caroline@clinic.com');
INSERT INTO funcionario VALUES ('34343434343', 'Felipe Moreira', DATE '1985-09-30', 'Homem', 'Manhã', 'felipe@clinic.com');
INSERT INTO funcionario VALUES ('35353535353', 'Amanda Costa', DATE '1990-03-11', 'Mulher', 'Tarde', 'amanda@clinic.com');
INSERT INTO funcionario VALUES ('36363636363', 'Rodrigo Souza', DATE '1983-08-21', 'Homem', 'Noite', 'rodrigo@clinic.com');
INSERT INTO funcionario VALUES ('37373737373', 'Larissa Pinto', DATE '1997-05-25', 'Mulher', 'Manhã', 'larissa@clinic.com');
INSERT INTO funcionario VALUES ('38383838383', 'Eduardo Lima', DATE '1981-11-02', 'Homem', 'Tarde', 'eduardo@clinic.com');

-- ENDEREÇOS e TELEFONES DOS FUNCIONÁRIOS (atualizados com novos CPFs)
INSERT INTO endereco_funcionario VALUES ('91919191919', '77777777', 'Apto 5', '78');
INSERT INTO endereco_funcionario VALUES ('92929292929', '22222222', 'Bloco 4', '22');
INSERT INTO endereco_funcionario VALUES ('93939393939', '33333333', 'Sala 7', '300');
INSERT INTO endereco_funcionario VALUES ('94949494949', '44444444', 'Cobertura', '400');
INSERT INTO endereco_funcionario VALUES ('31313131313', '12121212', 'Ap 12', '120');
INSERT INTO endereco_funcionario VALUES ('32323232323', '13131313', 'Casa', '121');
INSERT INTO endereco_funcionario VALUES ('95959595959', '14141414', 'Sala 10', '122');
INSERT INTO endereco_funcionario VALUES ('34343434343', '15151515', 'Bloco F', '123');
INSERT INTO endereco_funcionario VALUES ('35353535353', '16161616', 'Ap 21', '124');
INSERT INTO endereco_funcionario VALUES ('36363636363', '17171717', 'Cobertura', '125');
INSERT INTO endereco_funcionario VALUES ('37373737373', '18181818', 'Sala 15', '126');
INSERT INTO endereco_funcionario VALUES ('38383838383', '19191919', 'Casa', '127');

INSERT INTO telefone_funcionario VALUES ('91919191919', '1155555555');
INSERT INTO telefone_funcionario VALUES ('92929292929', '1166666666');
INSERT INTO telefone_funcionario VALUES ('93939393939', '1177777777');
INSERT INTO telefone_funcionario VALUES ('94949494949', '1188888888');
INSERT INTO telefone_funcionario VALUES ('31313131313', '11999998888');
INSERT INTO telefone_funcionario VALUES ('32323232323', '11888887777');
INSERT INTO telefone_funcionario VALUES ('95959595959', '11777776666');
INSERT INTO telefone_funcionario VALUES ('34343434343', '11666665555');
INSERT INTO telefone_funcionario VALUES ('35353535353', '11555554444');
INSERT INTO telefone_funcionario VALUES ('36363636363', '11444443333');
INSERT INTO telefone_funcionario VALUES ('37373737373', '11333332222');
INSERT INTO telefone_funcionario VALUES ('38383838383', '11222221111');

-- ATENDENTES, ENFERMEIROS, MÉDICOS (com novos CPFs)
INSERT INTO atendente VALUES ('31313131313');
INSERT INTO atendente VALUES ('32323232323');

INSERT INTO enfermeiro VALUES ('95959595959', 'COREN33333');  -- Caroline Dias
INSERT INTO enfermeiro VALUES ('34343434343', 'COREN44444');  -- Felipe Moreira

INSERT INTO medico VALUES ('91919191919', 'CRM123456');  -- Lucas Rocha
INSERT INTO medico VALUES ('92929292929', 'CRM654321');  -- Carla Dias (corrigido caractere)
INSERT INTO medico VALUES ('35353535353', 'CRM777777');  -- Amanda Costa
INSERT INTO medico VALUES ('36363636363', 'CRM888888');  -- Rodrigo Souza
INSERT INTO medico VALUES ('37373737373', 'CRM999999');  -- Larissa Pinto
INSERT INTO medico VALUES ('93939393939', 'CRM101010');  -- Pedro Santos

-- ESPECIALIDADES
INSERT INTO especialidade_enfermeiro VALUES ('95959595959', 'Enfermagem Geral');
INSERT INTO especialidade_enfermeiro VALUES ('34343434343', 'Urgência');

INSERT INTO especialidade_medico VALUES ('91919191919', 'Cardiologia');
INSERT INTO especialidade_medico VALUES ('92929292929', 'Neurologia');
INSERT INTO especialidade_medico VALUES ('35353535353', 'Ortopedia');
INSERT INTO especialidade_medico VALUES ('36363636363', 'Pediatria');
INSERT INTO especialidade_medico VALUES ('37373737373', 'Dermatologia');
INSERT INTO especialidade_medico VALUES ('93939393939', 'Endocrinologia');

-- SALAS DE EXAME
INSERT INTO sala_exame VALUES ('101', 'Cardiologia', 'Disponível');
INSERT INTO sala_exame VALUES ('102', 'Neurologia', 'Disponível');
INSERT INTO sala_exame VALUES ('103', 'Ortopedia', 'Em Manutenção');
INSERT INTO sala_exame VALUES ('104', 'Ortopedia', 'Disponível');
INSERT INTO sala_exame VALUES ('105', 'Pediatria', 'Disponível');
INSERT INTO sala_exame VALUES ('106', 'Dermatologia', 'Disponível');
INSERT INTO sala_exame VALUES ('107', 'Endocrinologia', 'Disponível');
INSERT INTO sala_exame VALUES ('108', 'Cardiologia', 'Em Manutenção');
INSERT INTO sala_exame VALUES ('109', 'Neurologia', 'Disponível');

-- EXAMES
INSERT INTO exame (cpf_medico, tipo) VALUES ('91919191919', 'Eletrocardiograma');
INSERT INTO exame (cpf_medico, tipo) VALUES ('92929292929', 'EEG');
INSERT INTO exame (cpf_medico, tipo) VALUES ('35353535353', 'Raio-X');
INSERT INTO exame (cpf_medico, tipo) VALUES ('36363636363', 'Exame de Sangue');
INSERT INTO exame (cpf_medico, tipo) VALUES ('37373737373', 'Biópsia');
INSERT INTO exame (cpf_medico, tipo) VALUES ('93939393939', 'Teste Hormonal');

-- RESULTADOS
INSERT INTO resultado VALUES (1, 'Resultados normais.', SYSTIMESTAMP);
INSERT INTO resultado VALUES (2, 'Alterações detectadas.', SYSTIMESTAMP);
INSERT INTO resultado VALUES (3, 'Fratura identificada.', SYSTIMESTAMP);
INSERT INTO resultado VALUES (4, 'Fratura detectada.', SYSTIMESTAMP);
INSERT INTO resultado VALUES (5, 'Exames dentro do padrão.', SYSTIMESTAMP);
INSERT INTO resultado VALUES (6, 'Alterações cutâneas identificadas.', SYSTIMESTAMP);

-- DIAGNÓSTICOS (corrigidos referências)
INSERT INTO diagnostico (conteudo, tipo, data_hora_emissao, cpf_paciente, id_convenio) 
VALUES ('Paciente saudável.', 'Clínico Geral', SYSTIMESTAMP, '11111111111', 1);
INSERT INTO diagnostico (conteudo, tipo, data_hora_emissao, cpf_paciente, id_convenio) 
VALUES ('Paciente com dor de cabeça.', 'Neurologia', SYSTIMESTAMP, '22222222222', 2);
INSERT INTO diagnostico (conteudo, tipo, data_hora_emissao, cpf_paciente, id_convenio) 
VALUES ('Fratura no braço direito.', 'Ortopédico', SYSTIMESTAMP, '55555555555', 4);
INSERT INTO diagnostico (conteudo, tipo, data_hora_emissao, cpf_paciente, id_convenio) 
VALUES ('Exames de sangue normais.', 'Laboratorial', SYSTIMESTAMP, '66666666666', 5);
INSERT INTO diagnostico (conteudo, tipo, data_hora_emissao, cpf_paciente, id_convenio) 
VALUES ('Lesão de pele leve.', 'Dermatológico', SYSTIMESTAMP, '77777777777', 6);
INSERT INTO diagnostico (conteudo, tipo, data_hora_emissao, cpf_paciente, id_convenio) 
VALUES ('Desequilíbrio hormonal.', 'Endocrinológico', SYSTIMESTAMP, '88888888888', 1);

-- ANÁLISES (corrigidas com CPFs válidos)
INSERT INTO analise VALUES ('91919191919', 1, 1, 'Tudo ok.');
INSERT INTO analise VALUES ('92929292929', 2, 2, 'Requer atenção.');
INSERT INTO analise VALUES ('93939393939', 3, 3, 'Fratura confirmada.');
INSERT INTO analise VALUES ('35353535353', 4, 4, 'Fratura confirmada.');
INSERT INTO analise VALUES ('36363636363', 5, 5, 'Exames normais.');
INSERT INTO analise VALUES ('37373737373', 6, 6, 'Lesão superficial.');

-- AGENDAMENTOS (corrigidos)
INSERT INTO agendamento (status, tipo, data_hora, cpf_paciente, id_convenio) 
VALUES ('Confirmado', 'Consulta', SYSTIMESTAMP + INTERVAL '1' DAY, '11111111111', 1);
INSERT INTO agendamento (status, tipo, data_hora, cpf_paciente, id_convenio) 
VALUES ('Pendente', 'Exame', SYSTIMESTAMP + INTERVAL '2' DAY, '22222222222', 2);
INSERT INTO agendamento (status, tipo, data_hora, cpf_paciente, id_convenio) 
VALUES ('Confirmado', 'Raio-X', SYSTIMESTAMP + INTERVAL '1' DAY, '55555555555', 4);
INSERT INTO agendamento (status, tipo, data_hora, cpf_paciente, id_convenio) 
VALUES ('Pendente', 'Exame de Sangue', SYSTIMESTAMP + INTERVAL '2' DAY, '66666666666', 5);
INSERT INTO agendamento (status, tipo, data_hora, cpf_paciente, id_convenio) 
VALUES ('Confirmado', 'Biópsia', SYSTIMESTAMP + INTERVAL '3' DAY, '77777777777', 6);
INSERT INTO agendamento (status, tipo, data_hora, cpf_paciente, id_convenio) 
VALUES ('Confirmado', 'Teste Hormonal', SYSTIMESTAMP + INTERVAL '4' DAY, '88888888888', 1);

-- REALIZA (corrigida com CPFs válidos e referências consistentes)
INSERT INTO realiza VALUES (1, '95959595959', '11111111111', 1, SYSTIMESTAMP - INTERVAL '2' HOUR, SYSTIMESTAMP);
INSERT INTO realiza VALUES (2, '34343434343', '22222222222', 2, SYSTIMESTAMP - INTERVAL '3' HOUR, SYSTIMESTAMP);
INSERT INTO realiza VALUES (3, '95959595959', '55555555555', 4, SYSTIMESTAMP - INTERVAL '1' HOUR, SYSTIMESTAMP);
INSERT INTO realiza VALUES (4, '34343434343', '66666666666', 5, SYSTIMESTAMP - INTERVAL '1' HOUR, SYSTIMESTAMP);
INSERT INTO realiza VALUES (5, '34343434343', '77777777777', 6, SYSTIMESTAMP - INTERVAL '2' HOUR, SYSTIMESTAMP);
INSERT INTO realiza VALUES (6, '95959595959', '88888888888', 1, SYSTIMESTAMP - INTERVAL '3' HOUR, SYSTIMESTAMP);

-- DESIGNA (corrigida com CPFs válidos)
INSERT INTO designa VALUES (1, '31313131313', '101');
INSERT INTO designa VALUES (2, '32323232323', '102');
INSERT INTO designa VALUES (3, '31313131313', '104');
INSERT INTO designa VALUES (4, '32323232323', '105');
INSERT INTO designa VALUES (5, '31313131313', '106');
INSERT INTO designa VALUES (6, '32323232323', '107');

-- AUXILIA (corrigida com CPFs válidos)
INSERT INTO auxilia VALUES ('31313131313', '32323232323');
INSERT INTO auxilia VALUES ('31313131313', '34343434343');
INSERT INTO auxilia VALUES ('32323232323', '35353535353');
INSERT INTO auxilia VALUES ('32323232323', '36363636363');
INSERT INTO auxilia VALUES ('31313131313', '37373737373');
INSERT INTO auxilia VALUES ('31313131313', '38383838383');


