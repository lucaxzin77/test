import { Router } from 'express';
import { ControllerVeiculo } from '../controllers/Veiculo.js';

export const router = Router();

router.get('/', ControllerVeiculo.getVeiculos);
router.post('/', (req, res)=>{
    res.send('HELLO WORLD')
});
router.put('/:id', (req, res)=>{
    res.send('HELLO WORLD')
});
router.delete('/:id', (req, res)=>{
    res.send('HELLO WORLD')
})

export default router;