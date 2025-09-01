import express from 'express';
import cors from 'cors';
import 'dotenv/config';
import RouterVeiculo from './src/routes/veiculo.js'

const app = express();
const port = process.env.PORT

app.use(express.json());
app.use(cors());

app.use('/api/veiculo', RouterVeiculo)

app.listen(port, ()=>{
    console.log(`Server open at http://localhost:${port}`)
})

app.get('/', (_, res)=>{
    res.send('Hello World!')
})