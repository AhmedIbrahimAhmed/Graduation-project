import { Router } from 'express';
import {
  addMessage,
  deleteMessage,
  editMessage,
  getAllMatchMessages,
  getMessageById,
} from '../controllers';
import { errorWrapper } from '../utils';
import { getAllUserChats, getAllUserMessages } from '../controllers/matchChat';
import { getPlayerInfo } from '../controllers/player';

const chatRouter: Router = Router();

chatRouter.get('/match/:id', errorWrapper(getAllMatchMessages));
chatRouter.get('/:id', errorWrapper(getMessageById));
chatRouter.post('/', errorWrapper(addMessage));
chatRouter.delete('/:id', deleteMessage);
chatRouter.put('/', errorWrapper(editMessage));

chatRouter.get('/username/:id', errorWrapper(getPlayerInfo));
chatRouter.get('/userChat/getAllMyChat', errorWrapper(getAllUserChats));
chatRouter.get('/userChat/:id', errorWrapper(getAllUserMessages));

export default chatRouter;
