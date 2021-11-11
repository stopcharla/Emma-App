import { Sequelize, DataTypes, Model, Optional } from 'sequelize';
import { Transaction } from '../interfaces/transactions.interface';
import { MerchantModel } from './merchants.model';
import { UserModel } from './users.model';

export type MerchantCreationAttributes = Optional<Transaction, 'id'>;

export class TransactionModel extends Model<Transaction> implements Transaction {
  public id: number;
  public user_id: number;
  public merchant_id: number;
  public amount: number;
  public date: string;
  public description: string;

  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

export default function (sequelize: Sequelize): typeof TransactionModel {
  TransactionModel.init(
    {
      id: {
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      user_id: {
        allowNull: false,
        type: DataTypes.INTEGER,
        references: {
          model: UserModel,
          key: 'id',
        },
      },
      merchant_id: {
        type: DataTypes.INTEGER,
        references: {
          model: MerchantModel,
          key: 'id',
        },
      },
      amount: {
        allowNull: false,
        type: DataTypes.FLOAT,
      },
      date: {
        allowNull: false,
        type: DataTypes.DATE,
      },
      description: {
        allowNull: true,
        type: DataTypes.STRING(255),
      },
    },
    {
      tableName: 'transactions',
      indexes: [{ unique: false, fields: ['date', 'merchant_id', 'user_id'] }],
      sequelize,
    },
  );

  return TransactionModel;
}
