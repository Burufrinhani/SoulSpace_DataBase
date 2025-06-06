CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sobrenome VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    senha VARCHAR(255),
    data_nasc DATE,
    contato VARCHAR(20)
);

CREATE TABLE Meu_Diario (
    user_diario INT PRIMARY KEY,
    titulo_anotacao VARCHAR(150),
    dataHora_anotacao DATETIME,
    categHumor_anotacao VARCHAR(50),
    FOREIGN KEY (user_diario) REFERENCES Usuario(user_id)
);

CREATE TABLE Hora_do_Foco (
    user_id INT PRIMARY KEY,
    titulo_sessao VARCHAR(100),
    duracao_sessao TIME,
    Horainicio_sessao TIME,
    HoraTermino_sessao TIME,
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

CREATE TABLE CVV (
    user_id INT PRIMARY KEY,
    numero_cvv VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

CREATE TABLE SoulHear (
    user_id INT PRIMARY KEY,
    opcao_guardar_conversas BOOLEAN,
    historico_conversas TEXT,
    FOREIGN KEY (user_id) REFERENCES Usuario(user_id)
);

CREATE TABLE Medite_e_relaxe (
    id_meditacao INT PRIMARY KEY,
    titulo VARCHAR(150),
    descricao TEXT,
    categoria VARCHAR(100),
    duracao TIME,
    audio_url VARCHAR(255),
    imagem_url VARCHAR(255),
    locutor VARCHAR(100)
);

CREATE TABLE Aula (
    id_aula INT PRIMARY KEY,
    id_curso INT,
    titulo VARCHAR(150),
    descricao TEXT,
    url_video VARCHAR(255),
    duracao_minutos INT,
    ordem INT,
    FOREIGN KEY (id_curso) REFERENCES Usuario(user_id) -- Assumindo que o curso pertence a um usuário
);

CREATE TABLE Aprendizado (
    id_plataforma INT PRIMARY KEY,
    nome_plataforma VARCHAR(100),
    plataforma_url VARCHAR(255)
);

CREATE TABLE Exercicio_Fisico (
    id_exercicio INT PRIMARY KEY,
    grupo_muscular VARCHAR(100),
    nivel_dificuldade VARCHAR(50),
    descricao TEXT,
    video_url VARCHAR(255)
);

CREATE TABLE Plano_Alimentar (
    id_plano INT PRIMARY KEY,
    descricao TEXT,
    objetivo VARCHAR(100),
    duracao INT
);

-- Relacionamentos N:N se forem necessários (não estão explícitos no modelo, mas podem ser úteis)
-- Ex: Relacionar usuários com exercícios, planos alimentares, meditações etc.
