import { Router } from 'express';
import { errorWrapper } from '../utils';
import { addReview, getPlayerReview, getReview } from '../controllers';

const reviewRouter: Router = Router();

reviewRouter.get('/:stadiumId', errorWrapper(getReview));
reviewRouter.get('/player/:stadiumId', errorWrapper(getPlayerReview));
reviewRouter.post('/add/:stadiumId', errorWrapper(addReview));

export default reviewRouter;
