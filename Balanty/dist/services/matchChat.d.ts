import { Request } from 'express';
import { IMatchMessage, IResponseProps } from '../interfaces';
import { IUsersMessage } from '../interfaces/matchInterfaces';
declare const addMessageService: ({ message, senderId, matchId, }: IMatchMessage) => Promise<IResponseProps>;
declare const getMessageByIdService: (messageId: number) => Promise<IResponseProps>;
declare const getAllMessagesService: (matchId: number, req: Request) => Promise<IResponseProps>;
declare const deleteMessageService: (id: string) => Promise<IResponseProps>;
declare const editMessageService: (id: number, newMessage: string) => Promise<IResponseProps>;
declare const getAllUserMessagesService: (receiverId: number, req: Request) => Promise<IResponseProps>;
declare const addUserMessageService: ({ message, senderId, fromId, }: IUsersMessage) => Promise<IResponseProps>;
declare const deleteUserMessageService: (id: string) => Promise<IResponseProps>;
declare const getAllUserChatsService: (receiverId: number, req: Request) => Promise<IResponseProps>;
export { addMessageService, getMessageByIdService, getAllMessagesService, deleteMessageService, editMessageService, getAllUserMessagesService, addUserMessageService, deleteUserMessageService, getAllUserChatsService, };
