import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../database';

class Stadium extends Model {
  declare user_id: number;
  declare address: string;
  declare description: string;
  declare price: number;
  declare ground: string;
  declare image: string;
}

Stadium.init(
  {
    address: { type: DataTypes.STRING, defaultValue: 'لم يتم ادخال عنوان' },
    description: {
      type: DataTypes.STRING,
      defaultValue: 'لم يتم ادخال وصف',
    },
    price: { type: DataTypes.INTEGER, defaultValue: 0 },
    ground: {
      type: DataTypes.STRING(50),
      defaultValue: 'يمكنك اضافة نوع الارضية ',
    },
    image: {
      type: DataTypes.TEXT,
      defaultValue:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Etihad_Stadium.jpg/1024px-Etihad_Stadium.jpg',
    },
  },
  {
    sequelize,
    modelName: 'Stadium',
    tableName: 'stadiums',
  },
);
export default Stadium;
