export class BaseRepository {
    constructor(model) {
        this.model = model;
    }

    async findAll(filters = {}) {
        return await this.model.findMany(filters);
    }

    async findById(id) {
        return await this.model.findById({
            where: {
                id,
            },
        });
    }

    async create(data) {
        return await this.model.create(data);
    }

    async createMany(data) {
        return await this.model.createMany(data);
    }

    async update(id, data) {
        return await this.model.update(id, data);
    }

    async delete(id) {
        return await this.model.delete(id, data);
    }

    async deleteMany(data) {
        return await this.model.delete(id, data);
    }
}