import { Server } from 'socket.io';

const io = new Server({cors: {
  origin: '*',
  methods: ["GET", "POST", "OPTION"],
}});

io.connectTimeout(15000);

io.on('connection', async (socket) => {
  console.log('connection');

  socket.on('disconnect', () => {
    console.log('disconnect');
  });
});

export default io;
