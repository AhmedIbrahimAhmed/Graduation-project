import { Router } from 'express';
import {
  JoinToMatch,
  createMatch,
  getMatches,
  getMyMatches,
  getStadiumMatches,
  searchMatches,
  getMatchData,
} from '../controllers';
import { errorWrapper } from '../utils';
import { checkAuth } from '../middleware';
import { deletePlayerMatch, deleteMatch } from '../controllers/matches';

const matchRouter: Router = Router();

matchRouter.get('/', errorWrapper(getMatches));
matchRouter.get('/my-matches', errorWrapper(getMyMatches));
matchRouter.get('/match-data/:matchId', getMatchData);
matchRouter.post('/', errorWrapper(createMatch));
matchRouter.get('/search', errorWrapper(searchMatches));
matchRouter.get('/stadium/:stadiumId', errorWrapper(getStadiumMatches));
matchRouter.get('/join/:matchId', errorWrapper(JoinToMatch));
matchRouter.delete(
  '/deleteMathch/:matchId',
  errorWrapper(checkAuth),
  errorWrapper(deleteMatch),
);
matchRouter.delete(
  '/:matchId',
  errorWrapper(checkAuth),
  errorWrapper(deletePlayerMatch),
);

export default matchRouter;
