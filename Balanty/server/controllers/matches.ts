import { Response, Request, RequestHandler } from 'express';
import {
  createMatchService,
  getAllMatches,
  getMatchDataService,
  getMyMatchesService,
  JoinToMatchService,
} from '../services';
import { IServiceResponse } from '../interfaces';
import { deletePlayrerMatch, delOwnMatch } from '../services/matches';

export const createMatch: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = (await createMatchService(req)) as IServiceResponse;
  res.status(data?.status).json(data);
};

export const getMatches: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = await getAllMatches(req);
  res.status(data.status).json(data);
};

export const getMyMatches: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = await getMyMatchesService(req);
  res.status(data.status).json(data);
};

export const getMatchData: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = await getMatchDataService(req);
  res.status(data.status).json(data);
};

export const JoinToMatch: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = await JoinToMatchService(req);
  res.status(data.status).json(data);
};

export const searchMatches: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const response = await getAllMatches(req);
  res.status(response.status).json(response);
};

export const deletePlayerMatch: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = await deletePlayrerMatch(req);
  res.status(data.status).json(data);
};
export const deleteMatch: RequestHandler = async (
  req: Request,
  res: Response,
): Promise<void> => {
  const data = await delOwnMatch(req);
  res.status(data.status).json(data);
};
