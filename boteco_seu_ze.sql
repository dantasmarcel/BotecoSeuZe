CREATE TABLE `cliente_contato`(
  `id_cliente_contato` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `tel_cel` VARCHAR(255) NOT NULL,
  `tel_res` VARCHAR(255) NOT NULL,
  `tel_com` VARCHAR(255) NOT NULL
);

CREATE TABLE `enderecos`(
  `id_endereco` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `rua` VARCHAR(255) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(255) NOT NULL,
  `id_cidade` INT NOT NULL
);

CREATE TABLE `clientes`(
  `id_cliente` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `id_endereco` INT NOT NULL,
  `id_cliente_contato` INT NOT NULL
);

CREATE TABLE `formas_pagamento`(
  `id_forma_pagamento` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `metodo_pagamento` VARCHAR(255) NOT NULL
);

CREATE TABLE `pedidos`(
  `id_pedido` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `data_pedido` DATETIME NOT NULL,
  `id_cliente` INT NOT NULL,
  `descricao` VARCHAR(255) NOT NULL
);

CREATE TABLE `produtos`(
  `id_produto` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(255) NOT NULL,
  `preco_unitario` DECIMAL(8, 2) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `id_categoria` INT NOT NULL
);

CREATE TABLE `produtos_pedidos`(
  `id_produto_pedido` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_produto` INT NOT NULL,
  `id_pedido` INT NOT NULL,
  `quantidade` DECIMAL(8, 2) NOT NULL,
  `id_forma_pagamento` INT NOT NULL
);
CREATE TABLE `cidades`(
  `id_cidade` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(255) NOT NULL,
  `id_estado` INT NOT NULL
);
CREATE TABLE `estados`(
  `id_estado` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(255) NOT NULL,
  `id_pais` INT NOT NULL
);
CREATE TABLE `paises`(
  `id_pais` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(255) NOT NULL
);
CREATE TABLE `categorias`(
  `id_categoria` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(255) NOT NULL
);
ALTER TABLE
  `pedidos` ADD CONSTRAINT `pedidos_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `clientes`(`id_cliente`);
ALTER TABLE
  `clientes` ADD CONSTRAINT `clientes_id_cliente_contato_foreign` FOREIGN KEY(`id_cliente_contato`) REFERENCES `cliente_contato`(`id_cliente_contato`);
ALTER TABLE
  `produtos_pedidos` ADD CONSTRAINT `produtos_pedidos_id_forma_pagamento_foreign` FOREIGN KEY(`id_forma_pagamento`) REFERENCES `formas_pagamento`(`id_forma_pagamento`);
ALTER TABLE
  `produtos_pedidos` ADD CONSTRAINT `produtos_pedidos_id_pedido_foreign` FOREIGN KEY(`id_pedido`) REFERENCES `pedidos`(`id_pedido`);
ALTER TABLE
  `produtos_pedidos` ADD CONSTRAINT `produtos_pedidos_id_produto_foreign` FOREIGN KEY(`id_produto`) REFERENCES `produtos`(`id_produto`);
ALTER TABLE
  `cidades` ADD CONSTRAINT `cidades_id_estado_foreign` FOREIGN KEY(`id_estado`) REFERENCES `estados`(`id_estado`);
ALTER TABLE
  `estados` ADD CONSTRAINT `estados_id_pais_foreign` FOREIGN KEY(`id_pais`) REFERENCES `paises`(`id_pais`);
ALTER TABLE
  `enderecos` ADD CONSTRAINT `enderecos_id_cidade_foreign` FOREIGN KEY(`id_cidade`) REFERENCES `cidades`(`id_cidade`);
ALTER TABLE
  `produtos` ADD CONSTRAINT `produtos_id_categoria_foreign` FOREIGN KEY(`id_categoria`) REFERENCES `categorias`(`id_categoria`);