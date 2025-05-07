import { Model } from 'sequelize';
declare class userMessage extends Model {
    message: string;
    UserId: number;
    id: unknown;
}
export default userMessage;
