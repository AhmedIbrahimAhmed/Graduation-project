"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const database_1 = require("../database");
class userMessage extends sequelize_1.Model {
}
userMessage.init({
    message: {
        type: sequelize_1.DataTypes.TEXT,
        allowNull: false,
    },
}, {
    sequelize: database_1.sequelize,
    modelName: 'userMessage',
    tableName: 'usermessage',
    timestamps: true,
});
exports.default = userMessage;
