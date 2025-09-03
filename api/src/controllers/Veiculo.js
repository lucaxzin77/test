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
    },

   async addVeiculo(req, res) {
    try {
        const { marca, tipo, modelo, cor, ano, n_portas, combustivel, cambio, km, preco, status } = req.body;

        if (!marca || !tipo || !modelo || !cor || !ano || !n_portas || !combustivel || !cambio || !km || !preco || !status) {
            return res.status(400).json('All fields required!');
        }

        const data = { marca, tipo, modelo, cor, ano, n_portas, combustivel, cambio, km, preco, status };

        const result = await Veiculo.addVeiculo(data);

        return res.status(201).json({ message: "Create successfully!", data: result });

    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Internal server error', error });
    }
}

}