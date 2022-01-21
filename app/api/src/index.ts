import server from './server';
import io from './socket';

io.attach(server);

const host = process.env.HOST || 'localhost';
const port = process.env.PORT || 3000;

server.listen(port, () => {
  console.log(`Socket.IO server running at http://${host}:${port}/`);
});  

process.on('SIGINT', () => {
  server.close(() => {
      process.exit();
  });
});
