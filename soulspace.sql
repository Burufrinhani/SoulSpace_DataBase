-- Tabela Usuario
CREATE TABLE Usuario (
    user_id NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    sobrenome VARCHAR2(100) NOT NULL,
    email VARCHAR2(150) UNIQUE NOT NULL,
    senha VARCHAR2(255) NOT NULL,
    data_nasc DATE NOT NULL,
    contato VARCHAR2(20)
);

-- Tabela Meu_Diario
CREATE TABLE Meu_Diario (
    user_diario NUMBER PRIMARY KEY,
    titulo_anotacao VARCHAR2(200) NOT NULL,
    data_hora_anotacao TIMESTAMP,
    categoria_humor_anotacao VARCHAR2(50),
    CONSTRAINT fk_meu_diario_usuario FOREIGN KEY (user_diario) REFERENCES Usuario(user_id)
);

-- Tabela Hora_do_Foco
CREATE TABLE Hora_do_Foco (
    user_id NUMBER PRIMARY KEY,
    titulo_sessao VARCHAR2(200) NOT NULL,
    duracao_sessao NUMBER(5,2) NOT NULL,
    hora_inicio_sessao TIMESTAMP,
    hora_termino_sessao TIMESTAMP,
    CONSTRAINT fk_hora_foco_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

-- Tabela CVV
CREATE TABLE CVV (
    user_id NUMBER PRIMARY KEY,
    numero_cvv VARCHAR2(20) UNIQUE NOT NULL,
    CONSTRAINT fk_cvv_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

-- Tabela SoulHear
CREATE TABLE SoulHear (
    user_id NUMBER PRIMARY KEY,
    opcao_guardar_conversas Boolean,
    historico_conversas CLOB,
    CONSTRAINT fk_soulhear_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

-- Tabela Medite_e_relaxe
CREATE TABLE Medite_e_relaxe (
    id_meditacao NUMBER PRIMARY KEY,
    titulo VARCHAR2(200) NOT NULL,
    descricao CLOB,
    categoria VARCHAR2(100),
    duracao NUMBER(5,2),
    audio_url VARCHAR2(500),
    imagem_url VARCHAR2(500),
    locutor VARCHAR2(100)
);

-- Tabela Aula
CREATE TABLE Aula (
    id_aula NUMBER PRIMARY KEY,
    id_curso NUMBER NOT NULL,
    titulo VARCHAR2(200) NOT NULL,
    descricao CLOB,
    url_video VARCHAR2(500),
    duracao_minutos NUMBER(5,2),
    ordem NUMBER(3)
);

-- Tabela Aprendizado
CREATE TABLE Aprendizado (
    id_plataforma NUMBER PRIMARY KEY,
    nome_plataforma VARCHAR2(150) NOT NULL,
    plataforma_url VARCHAR2(500)
);

-- Tabela Exercicio_Fisico
CREATE TABLE Exercicio_Fisico (
    id_exercicio NUMBER PRIMARY KEY,
    grupo_muscular VARCHAR2(100),
    nivel_dificuldade VARCHAR2(50),
    descricao CLOB,
    video_url VARCHAR2(500)
);

-- Tabela Plano_Alimentar
CREATE TABLE Plano_Alimentar (
    id_plano NUMBER PRIMARY KEY,
    descricao CLOB NOT NULL,
    objetivo VARCHAR2(200),
    duracao NUMBER(3)
);

-- ====================================
-- TABELAS DE RELACIONAMENTO N:N
-- ====================================

-- Relacionamento Usuario x Medite_e_relaxe (usuário pode ter várias meditações)
CREATE TABLE Usuario_Meditacao (
    user_id NUMBER,
    id_meditacao NUMBER,
    data_pratica TIMESTAMP,
    concluida CHAR(1),
    PRIMARY KEY (user_id, id_meditacao),
    CONSTRAINT fk_user_med_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id),
    CONSTRAINT fk_user_med_meditacao FOREIGN KEY (id_meditacao) REFERENCES Medite_e_relaxe(id_meditacao)
);

-- Relacionamento Usuario x Aula (usuário pode assistir várias aulas)
CREATE TABLE Usuario_Aula (
    user_id NUMBER,
    id_aula NUMBER,
    data_acesso TIMESTAMP,
    progresso NUMBER(5,2),
    concluida CHAR(1),
    PRIMARY KEY (user_id, id_aula),
    CONSTRAINT fk_user_aula_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id),
    CONSTRAINT fk_user_aula_aula FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

-- Relacionamento Usuario x Exercicio_Fisico
CREATE TABLE Usuario_Exercicio (
    user_id NUMBER,
    id_exercicio NUMBER,
    data_pratica TIMESTAMP,
    series_realizadas NUMBER(3),
    repeticoes NUMBER(3),
    peso_usado NUMBER(5,2),
    observacoes VARCHAR2(500),
    PRIMARY KEY (user_id, id_exercicio, data_pratica),
    CONSTRAINT fk_user_ex_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id),
    CONSTRAINT fk_user_ex_exercicio FOREIGN KEY (id_exercicio) REFERENCES Exercicio_Fisico(id_exercicio)
);

-- Relacionamento Usuario x Plano_Alimentar
CREATE TABLE Usuario_Plano_Alimentar (
    user_id NUMBER,
    id_plano NUMBER,
    data_inicio DATE,
    data_fim DATE,
    ativo CHAR(1),
    PRIMARY KEY (user_id, id_plano),
    CONSTRAINT fk_user_plano_usuario FOREIGN KEY (user_id) REFERENCES Usuario(user_id),
    CONSTRAINT fk_user_plano_alimentar FOREIGN KEY (id_plano) REFERENCES Plano_Alimentar(id_plano)
);
