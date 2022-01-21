import { Server } from 'socket.io';
import { v4 } from 'uuid';

const io = new Server({cors: {
  origin: '*',
  methods: ["GET", "POST", "OPTION"],
}});

io.connectTimeout(15000);

io.of('/chat').use((socket, next) => {
  console.log(socket.handshake.auth);
  const connectionId = socket.handshake.auth.connectionId;
  if (!connectionId) {
    return next(new Error("invalid connectionId"));
  }
  (socket as any).connectionId = connectionId;
  next();
});

io.of('/chat').on('connection', async (socket) => {
  console.log('connection');
  const roomId = socket.handshake.auth.roomId;
  const socketId = socket.id;
  console.log(`join to ${roomId} with sid ${socketId}`);

  socket.on('disconnect', () => {
    console.log(`disconnect: ${(socket as any).connectionId}`);
  });

  socket.on('message', ({ content, from }) => {
    console.log(`${roomId} content: ${content}, from: ${from}`);
    socket.emit('message', {
      content,
      from,
      time: Date.now(),
      id: v4()
    });
  })
});

export default io;
