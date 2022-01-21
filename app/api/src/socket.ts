import { Server } from 'socket.io';

const io = new Server({cors: {
  origin: '*',
  methods: ["GET", "POST", "OPTION"],
}});

io.connectTimeout(15000);

io.use((socket, next) => {
  console.log(socket.handshake.auth);
  const connectionId = socket.handshake.auth.connectionId;
  if (!connectionId) {
    return next(new Error("invalid connectionId"));
  }
  (socket as any).connectionId = connectionId;
  next();
});

io.on('connection', async (socket) => {
  console.log('connection');

  socket.on('disconnect', () => {
    console.log(`disconnect: ${(socket as any).connectionId}`);
  });
});

export default io;
