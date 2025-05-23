import { RequestHandler } from 'express';
declare const addMessage: RequestHandler;
declare const getMessageById: RequestHandler;
declare const getAllMatchMessages: RequestHandler;
declare const deleteMessage: RequestHandler<{
    id: string;
}>;
declare const editMessage: RequestHandler;
declare const getAllUserMessages: RequestHandler;
declare const getAllUserChats: RequestHandler;
export { addMessage, getMessageById, getAllMatchMessages, deleteMessage, editMessage, getAllUserMessages, getAllUserChats, };
