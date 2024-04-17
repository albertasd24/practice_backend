-- CreateTable
CREATE TABLE `Plantilla` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombres` VARCHAR(60) NOT NULL,
    `descripcion` VARCHAR(60) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Carnet` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fecha_hora_Creacion` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `codigo` VARCHAR(100) NOT NULL,
    `usuario_id` INTEGER NOT NULL,
    `plantilla_id` INTEGER NOT NULL,

    UNIQUE INDEX `Carnet_usuario_id_key`(`usuario_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Usuario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombres` VARCHAR(60) NOT NULL,
    `apellidos` VARCHAR(60) NOT NULL,
    `cargo` VARCHAR(60) NOT NULL,
    `tipo_documento` VARCHAR(20) NOT NULL,
    `documento` VARCHAR(20) NOT NULL,
    `correo` VARCHAR(50) NOT NULL,
    `clave` VARCHAR(255) NOT NULL,
    `foto` VARCHAR(50) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `rol_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Carnet` ADD CONSTRAINT `Carnet_plantilla_id_fkey` FOREIGN KEY (`plantilla_id`) REFERENCES `Plantilla`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Carnet` ADD CONSTRAINT `Carnet_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Usuario` ADD CONSTRAINT `Usuario_rol_id_fkey` FOREIGN KEY (`rol_id`) REFERENCES `Rol`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
