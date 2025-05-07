"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAllUserChatsService = exports.deleteUserMessageService = exports.addUserMessageService = exports.getAllUserMessagesService = exports.editMessageService = exports.deleteMessageService = exports.getAllMessagesService = exports.getMessageByIdService = exports.addMessageService = void 0;
const models_1 = require("../models");
const MatchPlayer_1 = __importDefault(require("../models/MatchPlayer"));
const sequelize_1 = require("sequelize");
const addMessageService = async ({ message, senderId, matchId, }) => {
    const newMessage = await models_1.Message.create({
        UserId: senderId,
        MatchId: matchId,
        message,
    });
    const match = await models_1.Match.findOne({
        where: { id: matchId },
        include: [
            {
                model: models_1.Message,
                where: { id: newMessage.id },
                as: 'MatchMessages',
                include: [
                    {
                        model: models_1.User,
                        attributes: [
                            'createdAt',
                            'email',
                            'id',
                            'phone',
                            'role',
                            'updatedAt',
                            'username',
                        ],
                        include: [
                            {
                                model: models_1.Player,
                            },
                            {
                                model: models_1.Stadium,
                            },
                        ],
                    },
                ],
            },
        ],
    });
    return {
        status: 201,
        data: {
            message: 'Message added successfully',
            newMessage: match?.dataValues.MatchMessages[0],
        },
    };
};
exports.addMessageService = addMessageService;
const getMessageByIdService = async (messageId) => {
    const message = await models_1.Message.findOne({ where: { id: messageId } });
    if (message) {
        return {
            status: 200,
            data: {
                message,
            },
        };
    }
    else {
        return {
            status: 404,
            data: {
                message: 'No message found',
            },
        };
    }
};
exports.getMessageByIdService = getMessageByIdService;
const getAllMessagesService = async (matchId, req) => {
    const userId = req.user?.id;
    if (req.user?.role === 'stadium') {
        const findMatch = await models_1.Match.findAll({
            where: {
                [sequelize_1.Op.or]: [{ ownerId: userId }, { stadiumId: userId }],
            },
        });
        const findMatchId = findMatch?.map((e) => e.dataValues.id);
        if (!findMatchId.includes(matchId)) {
            return {
                status: 401,
                data: {
                    message: 'Unauthorized',
                },
            };
        }
        else {
            const match = await models_1.Match.findOne({
                where: { id: matchId },
                include: [
                    {
                        model: models_1.Message,
                        as: 'MatchMessages',
                        include: [
                            {
                                model: models_1.User,
                                attributes: [
                                    'createdAt',
                                    'email',
                                    'id',
                                    'phone',
                                    'role',
                                    'updatedAt',
                                    'username',
                                ],
                                include: [
                                    {
                                        model: models_1.Player,
                                    },
                                    {
                                        model: models_1.Stadium,
                                    },
                                ],
                            },
                        ],
                    },
                ],
            });
            if (match) {
                return {
                    status: 200,
                    data: {
                        match,
                    },
                };
            }
            return {
                status: 404,
                data: {
                    message: 'Match not found',
                },
            };
        }
    }
    else {
        const matchesIds = await MatchPlayer_1.default.findAll({
            where: {
                userId,
            },
            attributes: ['matchId'],
        });
        const PlayerMatchesId = matchesIds.map(matchPlayer => matchPlayer.matchId);
        if (!PlayerMatchesId.includes(matchId)) {
            return {
                status: 401,
                data: {
                    message: 'Unauthorized',
                },
            };
        }
        else {
            const match = await models_1.Match.findOne({
                where: { id: matchId },
                include: [
                    {
                        model: models_1.Message,
                        as: 'MatchMessages',
                        include: [
                            {
                                model: models_1.User,
                                attributes: [
                                    'createdAt',
                                    'email',
                                    'id',
                                    'phone',
                                    'role',
                                    'updatedAt',
                                    'username',
                                ],
                                include: [
                                    {
                                        model: models_1.Player,
                                    },
                                    {
                                        model: models_1.Stadium,
                                    },
                                ],
                            },
                        ],
                    },
                ],
            });
            if (match) {
                return {
                    status: 200,
                    data: {
                        match,
                    },
                };
            }
            return {
                status: 404,
                data: {
                    message: 'Match not found',
                },
            };
        }
    }
};
exports.getAllMessagesService = getAllMessagesService;
const deleteMessageService = async (id) => {
    const message = await models_1.Message.findOne({ where: { id: Number(id) } });
    if (message) {
        await models_1.Message.destroy({ where: { id: Number(id) } });
        return {
            status: 200,
            data: {
                message: 'Message deleted successfully',
                deletedMessage: message,
            },
        };
    }
    else {
        return {
            status: 404,
            data: {
                message: 'No message found',
            },
        };
    }
};
exports.deleteMessageService = deleteMessageService;
const editMessageService = async (id, newMessage) => {
    const [updatedRows, [updatedMessage]] = await models_1.Message.update({ message: newMessage }, { where: { id }, returning: true });
    if (updatedRows) {
        return {
            status: 200,
            data: {
                message: 'Message updated successfully',
                updatedMessage,
            },
        };
    }
    else {
        return {
            status: 404,
            data: {
                message: 'Message not found',
            },
        };
    }
};
exports.editMessageService = editMessageService;
const getAllUserMessagesService = async (receiverId, req) => {
    const userId = req.user?.id;
    const usersIds = await models_1.User.findAll({
        where: {
            id: receiverId,
        },
        attributes: ['id'],
    });
    const usersId = usersIds.filter(use => use.id === receiverId);
    if (!usersId) {
        return {
            status: 401,
            data: {
                message: 'Unauthorized',
            },
        };
    }
    else {
        const messages = await models_1.userMessage.findAll({
            where: {
                [sequelize_1.Op.or]: [
                    { FromID: userId, ToID: receiverId },
                    { FromID: receiverId, ToID: userId },
                ],
            },
            include: [
                {
                    model: models_1.User,
                    as: 'From',
                    attributes: ['id', 'username', 'role'],
                    include: [
                        {
                            model: models_1.Player,
                            attributes: ['avatar'],
                        },
                    ],
                },
                {
                    model: models_1.User,
                    as: 'To',
                    attributes: ['id', 'username', 'role'],
                    include: [
                        {
                            model: models_1.Player,
                        },
                        {
                            model: models_1.Stadium,
                        },
                    ],
                },
            ],
            order: [['createdAt', 'ASC']],
        });
        return {
            status: 200,
            data: {
                message: messages || {},
            },
        };
    }
};
exports.getAllUserMessagesService = getAllUserMessagesService;
const addUserMessageService = async ({ message, senderId, fromId, }) => {
    const newMessage = await models_1.userMessage.create({
        ToID: senderId,
        FromID: fromId,
        message,
    });
    const messages = await models_1.userMessage.findAll({
        where: { id: newMessage.id },
        include: [
            {
                model: models_1.User,
                as: 'From',
                attributes: ['id', 'username', 'role'],
                include: [
                    {
                        model: models_1.Player,
                        attributes: ['avatar'],
                    },
                ],
            },
            {
                model: models_1.User,
                as: 'To',
                attributes: ['id', 'username', 'role'],
                include: [
                    {
                        model: models_1.Player,
                    },
                    {
                        model: models_1.Stadium,
                    },
                ],
            },
        ],
        order: [['createdAt', 'ASC']],
    });
    const daMessages = messages ? messages[0].dataValues : undefined;
    return {
        status: 201,
        data: {
            message: 'Message added successfully',
            newMessage: daMessages,
        },
    };
};
exports.addUserMessageService = addUserMessageService;
const deleteUserMessageService = async (id) => {
    const message = await models_1.userMessage.findOne({ where: { id: Number(id) } });
    if (message) {
        await models_1.userMessage.destroy({ where: { id: Number(id) } });
        return {
            status: 200,
            data: {
                message: 'Message deleted successfully',
                deletedMessage: message,
            },
        };
    }
    else {
        return {
            status: 404,
            data: {
                message: 'No message found',
            },
        };
    }
};
exports.deleteUserMessageService = deleteUserMessageService;
// const getAllUserChatsService = async (
//   receiverId: number,
//   req: Request,
// ): Promise<IResponseProps> => {
//   const userId = req.user?.id;
//   const usersIds = await User.findOne({
//     where: {
//       id: userId,
//     },
//     attributes: ['id'],
//   });
//   if (!usersIds) {
//     return {
//       status: 404,
//       data: {
//         message: 'User not found',
//       },
//     };
//   } else {
//     const messages = await userMessage.findAll({
//       where: {
//         [Op.or]: [{ FromID: userId }, { ToID: userId }],
//       },
//       include: [
//         {
//           model: User,
//           as: 'From',
//           attributes: ['id', 'username', 'role'],
//           include: [
//             {
//               model: Player,
//               attributes: ['avatar'],
//             },
//           ],
//         },
//         {
//           model: User,
//           as: 'To',
//           attributes: ['id', 'username', 'role'],
//           include: [
//             {
//               model: Player,
//             },
//             {
//               model: Stadium,
//             },
//           ],
//         },
//       ],
//       order: [['createdAt', 'ASC']],
//     });
//     // try {
//     const userChats: any = [];
//     messages.forEach((message: any) => {
//       if (message.message) {
//         const checkExist = userChats.some(
//           (chat: any) =>
//             chat.From.id === message.From.id && chat.To.id === message.To.id,
//         );
//         if (!checkExist) {
//           userChats.push({ From: message.From, To: message.To });
//         }
//       }
//     });
//     return {
//       status: 200,
//       data: {
//         message: messages || {},
//       },
//     };
//   }
// };
const getAllUserChatsService = async (receiverId, req) => {
    const userId = req.user?.id;
    const user = await models_1.User.findOne({
        where: { id: userId },
        attributes: ['id'],
    });
    if (!user) {
        return {
            status: 404,
            data: { message: 'User not found' },
        };
    }
    const messages = await models_1.userMessage.findAll({
        where: {
            [sequelize_1.Op.or]: [{ FromID: userId }, { ToID: userId }],
        },
        include: [
            {
                model: models_1.User,
                as: 'From',
                attributes: ['id', 'username', 'role'],
                include: [
                    { model: models_1.Player, attributes: ['avatar'] },
                    {
                        model: models_1.Stadium,
                    },
                ],
            },
            {
                model: models_1.User,
                as: 'To',
                attributes: ['id', 'username', 'role'],
                include: [
                    { model: models_1.Player, attributes: ['avatar'] },
                    {
                        model: models_1.Stadium,
                    },
                ],
            },
        ],
        order: [['createdAt', 'DESC']],
    });
    const userChatsMap = new Map();
    messages.forEach((message) => {
        const otherUser = message.FromID === userId ? message.To : message.From;
        const otherUserId = otherUser?.id;
        if (otherUserId && !userChatsMap.has(otherUserId)) {
            userChatsMap.set(otherUserId, {
                id: otherUser.id,
                username: otherUser.username,
                role: otherUser.role,
                avatar: otherUser.Player?.avatar || null,
            });
        }
    });
    const userChats = Array.from(userChatsMap.values());
    return {
        status: 200,
        data: userChats,
    };
};
exports.getAllUserChatsService = getAllUserChatsService;
