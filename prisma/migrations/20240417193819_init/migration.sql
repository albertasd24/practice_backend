/*
  Warnings:

  - You are about to drop the column `descripcion` on the `plantilla` table. All the data in the column will be lost.
  - You are about to drop the column `nombres` on the `plantilla` table. All the data in the column will be lost.
  - Added the required column `altura_fotografia` to the `Plantilla` table without a default value. This is not possible if the table is not empty.
  - Added the required column `altura_plantilla` to the `Plantilla` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ancho_fotografia` to the `Plantilla` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ancho_plantilla` to the `Plantilla` table without a default value. This is not possible if the table is not empty.
  - Added the required column `codigo_qr` to the `Plantilla` table without a default value. This is not possible if the table is not empty.
  - Added the required column `posicion_fotografia_x` to the `Plantilla` table without a default value. This is not possible if the table is not empty.
  - Added the required column `posicion_fotografia_y` to the `Plantilla` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `plantilla` DROP COLUMN `descripcion`,
    DROP COLUMN `nombres`,
    ADD COLUMN `altura_fotografia` INTEGER NOT NULL,
    ADD COLUMN `altura_plantilla` INTEGER NOT NULL,
    ADD COLUMN `ancho_fotografia` INTEGER NOT NULL,
    ADD COLUMN `ancho_plantilla` INTEGER NOT NULL,
    ADD COLUMN `codigo_qr` BOOLEAN NOT NULL,
    ADD COLUMN `posicion_fotografia_x` INTEGER NOT NULL,
    ADD COLUMN `posicion_fotografia_y` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `DatosPlantilla` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombres` VARCHAR(60) NOT NULL,
    `descripcion` VARCHAR(60) NOT NULL,
    `posicion_x` INTEGER NOT NULL,
    `posicion_y` INTEGER NOT NULL,
    `plantilla_id` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FrecuenciaConsulta` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `carnet_id` INTEGER NOT NULL,
    `fecha` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FrecuenciaSesion` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `fecha` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DatosPlantilla` ADD CONSTRAINT `DatosPlantilla_plantilla_id_fkey` FOREIGN KEY (`plantilla_id`) REFERENCES `Plantilla`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FrecuenciaConsulta` ADD CONSTRAINT `FrecuenciaConsulta_carnet_id_fkey` FOREIGN KEY (`carnet_id`) REFERENCES `Carnet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FrecuenciaSesion` ADD CONSTRAINT `FrecuenciaSesion_usuario_id_fkey` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
