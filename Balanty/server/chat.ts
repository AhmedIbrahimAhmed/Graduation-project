import app from './app';
import { Server } from 'socket.io';
import { createServer } from 'http';
import { addMessageService, deleteMessageService } from './services';
import {
  addUserMessageService,
  deleteUserMessageService,
} from './services/matchChat';

const server = createServer(app);

const io = new Server(server, {
  cors: {
    origin: (ori, callback) => {
      if (/^http:\/\/localhost(:\d+)?$/.test(ori as string)) {
        callback(null, true);
      } else {
        callback(new Error('Not allowed by CORS'));
      }
    },
    methods: '*',
  },
});

io.on('connection', socket => {
  console.log(`⚡: ${socket.id} user just connected!`);

  socket.on('message', async ({ message, senderId, matchId }) => {
    const newMessage = await addMessageService({
      message,
      senderId,
      matchId,
    });

    io.emit('messageResponse', newMessage);
  });
  socket.on('addUserMessage', async ({ message, senderId, fromId }) => {
    const newMessage = await addUserMessageService({
      message,
      senderId,
      fromId,
    });

    io.emit('messageUserResponse', newMessage);
  });

  socket.on('delete', async ({ id }) => {
    const response = await deleteMessageService(id.toString());
    const { deletedMessage } = response.data;

    io.emit('messageDeleted', deletedMessage);
  });

  socket.on('UserDelete', async ({ id }) => {
    const response = await deleteUserMessageService(id.toString());
    const deletedUserMessage = response.data.deletedMessage || null;

    io.emit('messageUserDeleted', deletedUserMessage);
  });

  socket.on('disconnect', () => {
    console.log('🔥: A user disconnected');
  });
});

export default server;
