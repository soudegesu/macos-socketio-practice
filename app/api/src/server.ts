import path from 'path';
import express from 'express'
import { Server } from 'http';
import cors from 'cors';
import bodyParser from 'body-parser';

const router = express.Router();
router.get('/ping', async (req, res) => {
  console.log('/ping');
  res.send({ msg: 'pong' });
});

const app = express();
const server = new Server(app);

app.use(cors());
app.use(bodyParser.json());
app.use('/api', router);

export default server;
