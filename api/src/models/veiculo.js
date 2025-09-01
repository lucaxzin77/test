import {pool} from "../../db/pool.js";

export const Veiculo = {
    async getVeiculos(){
        try{
            const [veiculos] = await pool.promise().execute(`SELECT * FROM veiculo;`);
            return veiculos;
        }catch(error){
            throw error;
        }
    }
}
