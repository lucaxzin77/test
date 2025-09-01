import { Veiculo } from '../models/veiculo.js';

export const ControllerVeiculo = {
    async getVeiculos(_, res){
        try{
            const result = await Veiculo.getVeiculos();
            if(!result){
                return res.status(404).json("Error: Vehicles not found!" )
            }
            return res.status(200).json(result);
        }catch(error){
            res.status(500).json(error);
        }
    }
}