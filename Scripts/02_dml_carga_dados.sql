-- ============================================================
-- 02_dml_carga_dados.sql
-- ViaCidada - Global Solution 2026/2
--
-- Dados sinteticos para testes.
-- Executar uma unica vez apos a criacao das tabelas.
-- ============================================================


-- ============================================================
-- 1. USUARIOS - 10 REGISTROS
-- Os dois primeiros usuarios seguem o guia do Alisson.
-- ============================================================

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Administrador ViaCidada',
     'admin@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_ADMIN', 0);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Cidadao de Teste',
     'cidadao@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 1);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Mariana Costa', 'cidadao03@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 0);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Rafael Santos', 'cidadao04@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 1);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Camila Oliveira', 'cidadao05@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 0);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Lucas Ferreira', 'cidadao06@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 0);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Beatriz Almeida', 'cidadao07@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 1);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Pedro Lima', 'cidadao08@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 0);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Ana Rodrigues', 'cidadao09@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 0);

INSERT INTO tb_vc_usuario
    (nome, email, senha, role, possui_mobilidade_reduzida)
VALUES
    ('Gabriel Souza', 'cidadao10@viacidada.com.br',
     '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a',
     'ROLE_CIDADAO', 1);


-- ============================================================
-- 2. LINHAS FAVORITAS - 10 REGISTROS
-- ============================================================

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 875010, '875A-10', 1, 'Terminal A', 'Terminal B',
       'Trabalho', id
FROM tb_vc_usuario WHERE email = 'admin@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 675010, '675K-10', 1, 'Terminal C', 'Terminal D',
       'Faculdade', id
FROM tb_vc_usuario WHERE email = 'cidadao@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 509010, '509M-10', 2, 'Terminal E', 'Terminal F',
       'Centro', id
FROM tb_vc_usuario WHERE email = 'cidadao03@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 875011, '875A-11', 2, 'Terminal B', 'Terminal A',
       'Volta para casa', id
FROM tb_vc_usuario WHERE email = 'cidadao04@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 675011, '675K-11', 2, 'Terminal D', 'Terminal C',
       'Retorno', id
FROM tb_vc_usuario WHERE email = 'cidadao05@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 509011, '509M-11', 1, 'Terminal F', 'Terminal E',
       'Deslocamento', id
FROM tb_vc_usuario WHERE email = 'cidadao06@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 875012, '875A-12', 1, 'Terminal G', 'Terminal H',
       'Servico', id
FROM tb_vc_usuario WHERE email = 'cidadao07@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 675012, '675K-12', 1, 'Terminal I', 'Terminal J',
       'Estudos', id
FROM tb_vc_usuario WHERE email = 'cidadao08@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 509012, '509M-12', 2, 'Terminal K', 'Terminal L',
       'Visitas', id
FROM tb_vc_usuario WHERE email = 'cidadao09@viacidada.com.br';

INSERT INTO tb_vc_linha_favorita
    (codigo_linha, letreiro, sentido, terminal_origem,
     terminal_destino, apelido, usuario_id)
SELECT 875013, '875A-13', 2, 'Terminal H', 'Terminal G',
       'Retorno diario', id
FROM tb_vc_usuario WHERE email = 'cidadao10@viacidada.com.br';


-- ============================================================
-- 3. PARADAS FAVORITAS - 10 REGISTROS
-- ============================================================

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015329, 'Parada Paulista A', 'Avenida Paulista',
       1, 1, id
FROM tb_vc_usuario WHERE email = 'admin@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015330, 'Parada Paulista B', 'Avenida Paulista',
       1, 0, id
FROM tb_vc_usuario WHERE email = 'cidadao@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015331, 'Parada Consolacao', 'Rua da Consolacao',
       0, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao03@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015332, 'Parada Augusta', 'Rua Augusta',
       1, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao04@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015333, 'Parada Bela Vista', 'Bela Vista',
       0, 0, id
FROM tb_vc_usuario WHERE email = 'cidadao05@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015334, 'Parada Centro', 'Praca da Se',
       1, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao06@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015335, 'Parada Liberdade', 'Bairro da Liberdade',
       1, 0, id
FROM tb_vc_usuario WHERE email = 'cidadao07@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015336, 'Parada Vergueiro', 'Rua Vergueiro',
       0, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao08@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015337, 'Parada Paraiso', 'Rua do Paraiso',
       1, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao09@viacidada.com.br';

INSERT INTO tb_vc_parada_favorita
    (codigo_parada, nome_parada, endereco,
     possui_rampa_acessivel, possui_piso_tatil, usuario_id)
SELECT 340015338, 'Parada Aclimacao', 'Aclimacao',
       0, 0, id
FROM tb_vc_usuario WHERE email = 'cidadao10@viacidada.com.br';


-- ============================================================
-- 4. ALERTAS - 10 REGISTROS
-- ============================================================

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 01',
       'Acompanhar condicao operacional da linha.',
       875010, NULL, 1, '07:30', 1, id
FROM tb_vc_usuario WHERE email = 'admin@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 02',
       'Notificacao de operacao da linha.',
       875010, NULL, 0, '08:00', 1, id
FROM tb_vc_usuario WHERE email = 'cidadao@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 03',
       'Monitoramento de linha.',
       875010, NULL, 1, '09:00', 1, id
FROM tb_vc_usuario WHERE email = 'cidadao03@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 04',
       'Alerta temporariamente desativado.',
       875010, NULL, 0, '10:00', 0, id
FROM tb_vc_usuario WHERE email = 'cidadao04@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 05',
       'Acompanhar condicao da linha.',
       675010, NULL, 1, '07:00', 1, id
FROM tb_vc_usuario WHERE email = 'cidadao05@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 06',
       'Notificacao de monitoramento.',
       675010, NULL, 0, '08:30', 1, id
FROM tb_vc_usuario WHERE email = 'cidadao06@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 07',
       'Alerta inativo para teste.',
       675010, NULL, 1, '09:30', 0, id
FROM tb_vc_usuario WHERE email = 'cidadao07@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de acessibilidade 08',
       'Acompanhar operacao da linha.',
       509010, NULL, 1, '06:30', 1, id
FROM tb_vc_usuario WHERE email = 'cidadao08@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta de parada 09',
       'Monitorar condicao da parada.',
       NULL, 340015329, 0, '11:00', 1, id
FROM tb_vc_usuario WHERE email = 'cidadao09@viacidada.com.br';

INSERT INTO tb_vc_alerta
    (titulo, mensagem, codigo_linha, codigo_parada,
     somente_veiculo_acessivel, horario_notificacao, ativo, usuario_id)
SELECT 'Alerta geral 10',
       'Alerta sem linha ou parada especifica.',
       NULL, NULL, 0, NULL, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao10@viacidada.com.br';


-- ============================================================
-- 5. OCORRENCIAS - 13 REGISTROS
--
-- Linha 875010: 5 ocorrencias criticas ativas.
-- Linha 675010: 3 ocorrencias criticas ativas.
-- Linha 509010: 1 ocorrencia critica ativa.
--
-- Registros resolvidos/arquivados e sem impacto na
-- acessibilidade ajudam a testar os filtros da procedure.
-- ============================================================

-- Linha 875010: cinco ocorrencias criticas ativas

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Elevador inoperante - teste 01',
       'Elevador indisponivel em ponto relacionado a linha.',
       'ELEVADOR_INOPERANTE', 'ABERTA', 'CRITICA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao@viacidada.com.br';

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Rampa danificada - teste 02',
       'Relato de problema em estrutura de acessibilidade.',
       'ACESSIBILIDADE', 'EM_ANALISE', 'CRITICA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao03@viacidada.com.br';

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Piso tatil danificado - teste 03',
       'Piso tatil apresenta dano no percurso.',
       'INFRAESTRUTURA_PARADA', 'CONFIRMADA', 'CRITICA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao04@viacidada.com.br';

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Acesso bloqueado - teste 04',
       'Acesso destinado a pessoas com mobilidade reduzida bloqueado.',
       'ACESSIBILIDADE', 'ABERTA', 'CRITICA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao05@viacidada.com.br';

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Plataforma inacessivel - teste 05',
       'Condicao critica de acesso na operacao.',
       'ACESSIBILIDADE', 'EM_ANALISE', 'CRITICA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao06@viacidada.com.br';


-- Linha 675010: tres ocorrencias criticas ativas

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Elevador inoperante - linha 675010',
       'Elevador indisponivel.',
       'ELEVADOR_INOPERANTE', 'ABERTA', 'CRITICA',
       675010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao07@viacidada.com.br';

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Rampa sem acesso - linha 675010',
       'Rampa de acesso apresenta impedimento.',
       'ACESSIBILIDADE', 'CONFIRMADA', 'CRITICA',
       675010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao08@viacidada.com.br';

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Piso tatil danificado - linha 675010',
       'Piso tatil com problema de infraestrutura.',
       'INFRAESTRUTURA_PARADA', 'EM_ANALISE', 'CRITICA',
       675010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao09@viacidada.com.br';


-- Linha 509010: uma ocorrencia critica ativa

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Elevador inoperante - linha 509010',
       'Elevador indisponivel para os passageiros.',
       'ELEVADOR_INOPERANTE', 'ABERTA', 'CRITICA',
       509010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao10@viacidada.com.br';


-- Ocorrencia nao critica, mas ativa e relacionada a acessibilidade

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Sinalizacao com desgaste',
       'Sinalizacao apresenta desgaste, sem gravidade critica.',
       'INFRAESTRUTURA_PARADA', 'ABERTA', 'MEDIA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'admin@viacidada.com.br';


-- Ocorrencia critica resolvida: nao deve entrar na contagem ativa

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Ocorrencia critica resolvida',
       'Registro resolvido usado para validar o filtro de status.',
       'ELEVADOR_INOPERANTE', 'RESOLVIDA', 'CRITICA',
       875010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao@viacidada.com.br';


-- Ocorrencia critica arquivada: nao deve entrar na contagem ativa

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Ocorrencia critica arquivada',
       'Registro arquivado usado para validar o filtro de status.',
       'ACESSIBILIDADE', 'ARQUIVADA', 'CRITICA',
       675010, 1, id
FROM tb_vc_usuario WHERE email = 'cidadao03@viacidada.com.br';


-- Ocorrencia que nao afeta acessibilidade: nao deve entrar no cursor

INSERT INTO tb_vc_ocorrencia
    (titulo, descricao, tipo, status, gravidade,
     codigo_linha, afeta_acessibilidade, usuario_id)
SELECT 'Atraso sem impacto na acessibilidade',
       'Relato de atraso operacional sem impacto de acessibilidade.',
       'ATRASO', 'ABERTA', 'BAIXA',
       875010, 0, id
FROM tb_vc_usuario WHERE email = 'cidadao04@viacidada.com.br';


-- Confirmar a carga
COMMIT;
