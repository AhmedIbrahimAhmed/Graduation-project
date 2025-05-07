import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../database';

class userMessage extends Model {
  declare message: string;
  declare UserId: number;
  id: unknown;
}

userMessage.init(
  {
    message: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  },
  {
    sequelize,
    modelName: 'userMessage',
    tableName: 'usermessage',
    timestamps: true,
  },
);

export default userMessage;
