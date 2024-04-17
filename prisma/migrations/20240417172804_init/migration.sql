/*
  Warnings:

  - You are about to drop the column `title` on the `post` table. All the data in the column will be lost.
  - You are about to drop the `categoriesonposts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `titulo` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `categoriesonposts` DROP FOREIGN KEY `CategoriesOnPosts_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `categoriesonposts` DROP FOREIGN KEY `CategoriesOnPosts_postId_fkey`;

-- AlterTable
ALTER TABLE `post` DROP COLUMN `title`,
    ADD COLUMN `titulo` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `categoriesonposts`;

-- DropTable
DROP TABLE `category`;

-- CreateTable
CREATE TABLE `Categoria` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CategoriasEnPosts` (
    `postId` INTEGER NOT NULL,
    `categoryId` INTEGER NOT NULL,
    `asignadoEn` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `asignadoPor` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`postId`, `categoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CategoriasEnPosts` ADD CONSTRAINT `CategoriasEnPosts_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CategoriasEnPosts` ADD CONSTRAINT `CategoriasEnPosts_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Categoria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
