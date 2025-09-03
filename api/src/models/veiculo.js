import {pool} from "../../db/pool.js";

export const Veiculo = {
    async getVeiculos(){
        try{
            const [veiculos] = await pool.promise().execute(`SELECT * FROM veiculo;`);
            return veiculos;
        }catch(error){
            throw error;
        }
    },

    async addVeiculo([data]){
        try{
            const newVeiculo = await pool.promise().execute(`
                INSERT INTO veiculo (marca, tipo, modelo, cor, ano, n_portas, combustivel, cambio, km, preco, status)
                VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`, 
                [data.marca, data.tipo, data.modelo, data.cor, data.ano, data.n_portas, 
                    data.combustivel, data.cambio, data.km, data.preco, data.status])
                return newVeiculo;
        }catch(error){
            throw error;
        }
    }
}
