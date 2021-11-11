import { Sequelize, DataTypes, Model, Optional } from 'sequelize';
import { Merchant } from '../interfaces/merchants.interface';

export type MerchantCreationAttributes = Optional<Merchant, 'id'>;

export class MerchantModel extends Model<Merchant> implements Merchant {
  public id: number;
  public display_name: string;
  public icon_url: string;
  public funny_gif_url: string;

  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

export default function (sequelize: Sequelize): typeof MerchantModel {
  MerchantModel.init(
    {
      id: {
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      display_name: {
        allowNull: false,
        type: DataTypes.STRING(255),
      },
      icon_url: {
        allowNull: true,
        type: DataTypes.STRING(255),
      },
      funny_gif_url: {
        allowNull: true,
        type: DataTypes.STRING(45),
      },
    },
    {
      tableName: 'merchants',
      sequelize,
    },
  );

  return MerchantModel;
}
