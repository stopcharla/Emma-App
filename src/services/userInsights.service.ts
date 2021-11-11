import { sequelize } from '../databases';
import { QueryTypes } from 'sequelize';

export interface UserInsights {
  merchant_id: number;
  percentile: number;
}

class UserInsightsService {
  public async getUserInsights(userId: number, fromDate: string, toDate: string): Promise<UserInsights[]> {
    const result = await sequelize.query<UserInsights>(
      `with selected_transaction as (
        SELECT 
            sum(amount) AS total, 
            user_id,
            merchant_id 
        FROM transactions
        WHERE date BETWEEN "${fromDate} 00:00:00" AND "${toDate} 23:59:59"
        GROUP BY merchant_id, user_id),
      percent_details as (
        SELECT 
            PERCENT_RANK() OVER (PARTITION BY merchant_id ORDER BY total desc) as percentile,
            merchant_id,
            user_id
        from selected_transaction)
      select merchant_id, percentile from percent_details where user_id=${userId};`,
      { type: QueryTypes.SELECT },
    );
    return result;
  }
}

export default UserInsightsService;
