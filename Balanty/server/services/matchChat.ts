import { Request } from 'express';
import { IMatchMessage, IResponseProps } from '../interfaces';
import {
  Gallery,
  Match,
  Message,
  Player,
  Stadium,
  User,
  userMessage,
} from '../models';
import MatchPlayer from '../models/MatchPlayer';

import { Op } from 'sequelize';
import { IUsersMessage } from '../interfaces/matchInterfaces';
import { image } from '@cloudinary/url-gen/qualifiers/source';

const addMessageService = async ({
  message,
  senderId,
  matchId,
}: IMatchMessage): Promise<IResponseProps> => {
  const newMessage = await Message.create({
    UserId: senderId,
    MatchId: matchId,
    message,
  });

  const match = await Match.findOne({
    where: { id: matchId },
    include: [
      {
        model: Message,
        where: { id: newMessage.id },
        as: 'MatchMessages',
        include: [
          {
            model: User,
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
                model: Player,
              },
              {
                model: Stadium,
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

const getMessageByIdService = async (
  messageId: number,
): Promise<IResponseProps> => {
  const message = await Message.findOne({ where: { id: messageId } });

  if (message) {
    return {
      status: 200,
      data: {
        message,
      },
    };
  } else {
    return {
      status: 404,
      data: {
        message: 'No message found',
      },
    };
  }
};

const getAllMessagesService = async (
  matchId: number,
  req: Request,
): Promise<IResponseProps> => {
  const userId = req.user?.id;
  if (req.user?.role === 'stadium') {
    const findMatch = await Match.findAll({
      where: {
        [Op.or]: [{ ownerId: userId }, { stadiumId: userId }],
      },
    });
    const findMatchId: number[] | undefined = findMatch?.map(
      (e: { dataValues: { id: number } }) => e.dataValues.id,
    );
    if (!findMatchId.includes(matchId)) {
      return {
        status: 401,
        data: {
          message: 'Unauthorized',
        },
      };
    } else {
      const match = await Match.findOne({
        where: { id: matchId },
        include: [
          {
            model: Message,
            as: 'MatchMessages',
            include: [
              {
                model: User,
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
                    model: Player,
                  },
                  {
                    model: Stadium,
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
  } else {
    const matchesIds = await MatchPlayer.findAll({
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
    } else {
      const match = await Match.findOne({
        where: { id: matchId },
        include: [
          {
            model: Message,
            as: 'MatchMessages',
            include: [
              {
                model: User,
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
                    model: Player,
                  },
                  {
                    model: Stadium,
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

const deleteMessageService: (
  id: string,
) => Promise<IResponseProps> = async id => {
  const message = await Message.findOne({ where: { id: Number(id) } });

  if (message) {
    await Message.destroy({ where: { id: Number(id) } });
    return {
      status: 200,
      data: {
        message: 'Message deleted successfully',
        deletedMessage: message,
      },
    };
  } else {
    return {
      status: 404,
      data: {
        message: 'No message found',
      },
    };
  }
};

const editMessageService = async (
  id: number,
  newMessage: string,
): Promise<IResponseProps> => {
  const [updatedRows, [updatedMessage]] = await Message.update(
    { message: newMessage },
    { where: { id }, returning: true },
  );

  if (updatedRows) {
    return {
      status: 200,
      data: {
        message: 'Message updated successfully',
        updatedMessage,
      },
    };
  } else {
    return {
      status: 404,
      data: {
        message: 'Message not found',
      },
    };
  }
};

const getAllUserMessagesService = async (
  receiverId: number,
  req: Request,
): Promise<IResponseProps> => {
  const userId = req.user?.id;

  const usersIds = await User.findAll({
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
  } else {
    const messages = await userMessage.findAll({
      where: {
        [Op.or]: [
          { FromID: userId, ToID: receiverId },
          { FromID: receiverId, ToID: userId },
        ],
      },
      include: [
        {
          model: User,
          as: 'From',
          attributes: ['id', 'username', 'role'],
          include: [
            {
              model: Player,
              attributes: ['avatar'],
            },
          ],
        },
        {
          model: User,
          as: 'To',
          attributes: ['id', 'username', 'role'],
          include: [
            {
              model: Player,
            },
            {
              model: Stadium,
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
const addUserMessageService = async ({
  message,
  senderId,
  fromId,
}: IUsersMessage): Promise<IResponseProps> => {
  const newMessage = await userMessage.create({
    ToID: senderId,
    FromID: fromId,
    message,
  });
  const messages = await userMessage.findAll({
    where: { id: newMessage.id },
    include: [
      {
        model: User,
        as: 'From',
        attributes: ['id', 'username', 'role'],
        include: [
          {
            model: Player,
            attributes: ['avatar'],
          },
        ],
      },
      {
        model: User,
        as: 'To',
        attributes: ['id', 'username', 'role'],
        include: [
          {
            model: Player,
          },
          {
            model: Stadium,
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
const deleteUserMessageService: (
  id: string,
) => Promise<IResponseProps> = async id => {
  const message = await userMessage.findOne({ where: { id: Number(id) } });

  if (message) {
    await userMessage.destroy({ where: { id: Number(id) } });
    return {
      status: 200,
      data: {
        message: 'Message deleted successfully',
        deletedMessage: message,
      },
    };
  } else {
    return {
      status: 404,
      data: {
        message: 'No message found',
      },
    };
  }
};

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

const getAllUserChatsService = async (
  receiverId: number,
  req: Request,
): Promise<IResponseProps> => {
  const userId = req.user?.id;

  const user = await User.findOne({
    where: { id: userId },
    attributes: ['id'],
  });

  if (!user) {
    return {
      status: 404,
      data: { message: 'User not found' },
    };
  }
  const messages = await userMessage.findAll({
    where: {
      [Op.or]: [{ FromID: userId }, { ToID: userId }],
    },
    include: [
      {
        model: User,
        as: 'From',
        attributes: ['id', 'username', 'role'],
        include: [
          { model: Player, attributes: ['avatar'] },
          {
            model: Stadium,
          },
        ],
      },
      {
        model: User,
        as: 'To',
        attributes: ['id', 'username', 'role'],
        include: [
          { model: Player, attributes: ['avatar'] },
          {
            model: Stadium,
          },
        ],
      },
    ],
    order: [['createdAt', 'DESC']],
  });

  const userChatsMap = new Map<number, any>();

  messages.forEach((message: any) => {
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

export {
  addMessageService,
  getMessageByIdService,
  getAllMessagesService,
  deleteMessageService,
  editMessageService,
  getAllUserMessagesService,
  addUserMessageService,
  deleteUserMessageService,
  getAllUserChatsService,
};
